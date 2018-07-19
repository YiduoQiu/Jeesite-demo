/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.yjjy.web;

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
import com.thinkgem.jeesite.modules.yjjy.entity.CzzYjjy;
import com.thinkgem.jeesite.modules.yjjy.service.CzzYjjyService;

/**
 * 应急救援Controller
 * @author qyd
 * @version 2018-07-04
 */
@Controller
@RequestMapping(value = "${adminPath}/yjjy/czzYjjy")
public class CzzYjjyController extends BaseController {

	@Autowired
	private CzzYjjyService czzYjjyService;
	
	@ModelAttribute
	public CzzYjjy get(@RequestParam(required=false) String id) {
		CzzYjjy entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzYjjyService.get(id);
		}
		if (entity == null){
			entity = new CzzYjjy();
		}
		return entity;
	}
	
	@RequiresPermissions("yjjy:czzYjjy:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzYjjy czzYjjy, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzYjjy> page = czzYjjyService.findPage(new Page<CzzYjjy>(request, response), czzYjjy); 
		model.addAttribute("page", page);
		return "modules/yjjy/czzYjjyList";
	}

	@RequiresPermissions("yjjy:czzYjjy:view")
	@RequestMapping(value = "form")
	public String form(CzzYjjy czzYjjy, Model model) {
		model.addAttribute("czzYjjy", czzYjjy);
		return "modules/yjjy/czzYjjyForm";
	}

	@RequiresPermissions("yjjy:czzYjjy:edit")
	@RequestMapping(value = "save")
	public String save(CzzYjjy czzYjjy, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzYjjy)){
			return form(czzYjjy, model);
		}
		czzYjjyService.save(czzYjjy);
		addMessage(redirectAttributes, "保存应急救援成功");
		return "redirect:"+Global.getAdminPath()+"/yjjy/czzYjjy/?repage";
	}
	
	@RequiresPermissions("yjjy:czzYjjy:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzYjjy czzYjjy, RedirectAttributes redirectAttributes) {
		czzYjjyService.delete(czzYjjy);
		addMessage(redirectAttributes, "删除应急救援成功");
		return "redirect:"+Global.getAdminPath()+"/yjjy/czzYjjy/?repage";
	}

}