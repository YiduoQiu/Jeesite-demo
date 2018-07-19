/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.fcys.web;

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
import com.thinkgem.jeesite.modules.fcys.entity.CzzFcys;
import com.thinkgem.jeesite.modules.fcys.service.CzzFcysService;

/**
 * 复查验收Controller
 * @author qyd
 * @version 2018-07-06
 */
@Controller
@RequestMapping(value = "${adminPath}/fcys/czzFcys")
public class CzzFcysController extends BaseController {

	@Autowired
	private CzzFcysService czzFcysService;
	
	@ModelAttribute
	public CzzFcys get(@RequestParam(required=false) String id) {
		CzzFcys entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzFcysService.get(id);
		}
		if (entity == null){
			entity = new CzzFcys();
		}
		return entity;
	}
	
	@RequiresPermissions("fcys:czzFcys:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzFcys czzFcys, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzFcys> page = czzFcysService.findPage(new Page<CzzFcys>(request, response), czzFcys); 
		model.addAttribute("page", page);
		return "modules/fcys/czzFcysList";
	}

	@RequiresPermissions("fcys:czzFcys:view")
	@RequestMapping(value = "form")
	public String form(CzzFcys czzFcys, Model model) {
		model.addAttribute("czzFcys", czzFcys);
		return "modules/fcys/czzFcysForm";
	}

	@RequiresPermissions("fcys:czzFcys:edit")
	@RequestMapping(value = "save")
	public String save(CzzFcys czzFcys, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzFcys)){
			return form(czzFcys, model);
		}
		czzFcysService.save(czzFcys);
		addMessage(redirectAttributes, "保存复查验收成功");
		return "redirect:"+Global.getAdminPath()+"/fcys/czzFcys/?repage";
	}
	
	@RequiresPermissions("fcys:czzFcys:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzFcys czzFcys, RedirectAttributes redirectAttributes) {
		czzFcysService.delete(czzFcys);
		addMessage(redirectAttributes, "删除复查验收成功");
		return "redirect:"+Global.getAdminPath()+"/fcys/czzFcys/?repage";
	}

}