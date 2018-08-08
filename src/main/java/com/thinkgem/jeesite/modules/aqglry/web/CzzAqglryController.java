/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqglry.web;

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
import com.thinkgem.jeesite.modules.aqglry.entity.CzzAqglry;
import com.thinkgem.jeesite.modules.aqglry.service.CzzAqglryService;

/**
 * 安全管理人员Controller
 * @author qyd
 * @version 2018-08-08
 */
@Controller
@RequestMapping(value = "${adminPath}/aqglry/czzAqglry")
public class CzzAqglryController extends BaseController {

	@Autowired
	private CzzAqglryService czzAqglryService;
	
	@ModelAttribute
	public CzzAqglry get(@RequestParam(required=false) String id) {
		CzzAqglry entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzAqglryService.get(id);
		}
		if (entity == null){
			entity = new CzzAqglry();
		}
		return entity;
	}
	
	@RequiresPermissions("aqglry:czzAqglry:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzAqglry czzAqglry, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzAqglry> page = czzAqglryService.findPage(new Page<CzzAqglry>(request, response), czzAqglry); 
		model.addAttribute("page", page);
		return "modules/aqglry/czzAqglryList";
	}

	@RequiresPermissions("aqglry:czzAqglry:view")
	@RequestMapping(value = "form")
	public String form(CzzAqglry czzAqglry, Model model) {
		model.addAttribute("czzAqglry", czzAqglry);
		return "modules/aqglry/czzAqglryForm";
	}

	@RequiresPermissions("aqglry:czzAqglry:edit")
	@RequestMapping(value = "save")
	public String save(CzzAqglry czzAqglry, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzAqglry)){
			return form(czzAqglry, model);
		}
		czzAqglryService.save(czzAqglry);
		addMessage(redirectAttributes, "保存安全管理人员成功");
		return "redirect:"+Global.getAdminPath()+"/aqglry/czzAqglry/?repage";
	}
	
	@RequiresPermissions("aqglry:czzAqglry:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzAqglry czzAqglry, RedirectAttributes redirectAttributes) {
		czzAqglryService.delete(czzAqglry);
		addMessage(redirectAttributes, "删除安全管理人员成功");
		return "redirect:"+Global.getAdminPath()+"/aqglry/czzAqglry/?repage";
	}

}