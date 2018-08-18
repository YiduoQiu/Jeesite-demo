/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.awh.web;

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
import com.thinkgem.jeesite.modules.awh.entity.CzzAwh;
import com.thinkgem.jeesite.modules.awh.service.CzzAwhService;

/**
 * 安委会Controller
 * @author qyd
 * @version 2018-08-18
 */
@Controller
@RequestMapping(value = "${adminPath}/awh/czzAwh")
public class CzzAwhController extends BaseController {

	@Autowired
	private CzzAwhService czzAwhService;
	
	@ModelAttribute
	public CzzAwh get(@RequestParam(required=false) String id) {
		CzzAwh entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzAwhService.get(id);
		}
		if (entity == null){
			entity = new CzzAwh();
		}
		return entity;
	}
	
	@RequiresPermissions("awh:czzAwh:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzAwh czzAwh, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzAwh> page = czzAwhService.findPage(new Page<CzzAwh>(request, response), czzAwh); 
		model.addAttribute("page", page);
		return "modules/awh/czzAwhList";
	}

	@RequiresPermissions("awh:czzAwh:view")
	@RequestMapping(value = "form")
	public String form(CzzAwh czzAwh, Model model) {
		model.addAttribute("czzAwh", czzAwh);
		return "modules/awh/czzAwhForm";
	}

	@RequiresPermissions("awh:czzAwh:edit")
	@RequestMapping(value = "save")
	public String save(CzzAwh czzAwh, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzAwh)){
			return form(czzAwh, model);
		}
		czzAwhService.save(czzAwh);
		addMessage(redirectAttributes, "保存安委会成功");
		return "redirect:"+Global.getAdminPath()+"/awh/czzAwh/?repage";
	}
	
	@RequiresPermissions("awh:czzAwh:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzAwh czzAwh, RedirectAttributes redirectAttributes) {
		czzAwhService.delete(czzAwh);
		addMessage(redirectAttributes, "删除安委会成功");
		return "redirect:"+Global.getAdminPath()+"/awh/czzAwh/?repage";
	}

}