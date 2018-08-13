/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wxygl.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.wxygl.entity.CzzWxygl;
import com.thinkgem.jeesite.modules.wxygl.service.CzzWxyglService;

/**
 * 危险源管理Controller
 * @author qyd
 * @version 2018-08-13
 */
@Controller
@RequestMapping(value = "${adminPath}/wxygl/czzWxygl")
public class CzzWxyglController extends BaseController {

	@Autowired
	private CzzWxyglService czzWxyglService;
	
	@ModelAttribute
	public CzzWxygl get(@RequestParam(required=false) String id) {
		CzzWxygl entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzWxyglService.get(id);
		}
		if (entity == null){
			entity = new CzzWxygl();
		}
		return entity;
	}
	
	@RequiresPermissions("wxygl:czzWxygl:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzWxygl czzWxygl, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzWxygl> page = czzWxyglService.findPage(new Page<CzzWxygl>(request, response), czzWxygl); 
		model.addAttribute("page", page);
		return "modules/wxygl/czzWxyglList";
	}

	@RequiresPermissions("wxygl:czzWxygl:view")
	@RequestMapping(value = "form")
	public String form(CzzWxygl czzWxygl, Model model) {
		model.addAttribute("czzWxygl", czzWxygl);
		return "modules/wxygl/czzWxyglForm";
	}

	@RequiresPermissions("wxygl:czzWxygl:edit")
	@RequestMapping(value = "save")
	public String save(CzzWxygl czzWxygl, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzWxygl)){
			return form(czzWxygl, model);
		}
		czzWxyglService.save(czzWxygl);
		addMessage(redirectAttributes, "保存危险源管理成功");
		return "redirect:"+Global.getAdminPath()+"/wxygl/czzWxygl/?repage";
	}
	
	@RequiresPermissions("wxygl:czzWxygl:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzWxygl czzWxygl, RedirectAttributes redirectAttributes) {
		czzWxyglService.delete(czzWxygl);
		addMessage(redirectAttributes, "删除危险源管理成功");
		return "redirect:"+Global.getAdminPath()+"/wxygl/czzWxygl/?repage";
	}

}