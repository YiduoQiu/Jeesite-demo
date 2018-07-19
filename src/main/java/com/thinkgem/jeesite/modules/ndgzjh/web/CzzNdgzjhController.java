/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.ndgzjh.web;

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
import com.thinkgem.jeesite.modules.ndgzjh.entity.CzzNdgzjh;
import com.thinkgem.jeesite.modules.ndgzjh.service.CzzNdgzjhService;

/**
 * 年度工作计划Controller
 * @author qyd
 * @version 2018-07-12
 */
@Controller
@RequestMapping(value = "${adminPath}/ndgzjh/czzNdgzjh")
public class CzzNdgzjhController extends BaseController {

	@Autowired
	private CzzNdgzjhService czzNdgzjhService;
	
	@ModelAttribute
	public CzzNdgzjh get(@RequestParam(required=false) String id) {
		CzzNdgzjh entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzNdgzjhService.get(id);
		}
		if (entity == null){
			entity = new CzzNdgzjh();
		}
		return entity;
	}
	
	@RequiresPermissions("ndgzjh:czzNdgzjh:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzNdgzjh czzNdgzjh, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzNdgzjh> page = czzNdgzjhService.findPage(new Page<CzzNdgzjh>(request, response), czzNdgzjh); 
		model.addAttribute("page", page);
		return "modules/ndgzjh/czzNdgzjhList";
	}

	@RequiresPermissions("ndgzjh:czzNdgzjh:view")
	@RequestMapping(value = "form")
	public String form(CzzNdgzjh czzNdgzjh, Model model) {
		model.addAttribute("czzNdgzjh", czzNdgzjh);
		return "modules/ndgzjh/czzNdgzjhForm";
	}

	@RequiresPermissions("ndgzjh:czzNdgzjh:edit")
	@RequestMapping(value = "save")
	public String save(CzzNdgzjh czzNdgzjh, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzNdgzjh)){
			return form(czzNdgzjh, model);
		}
		czzNdgzjhService.save(czzNdgzjh);
		addMessage(redirectAttributes, "保存年度工作计划成功");
		return "redirect:"+Global.getAdminPath()+"/ndgzjh/czzNdgzjh/?repage";
	}
	
	@RequiresPermissions("ndgzjh:czzNdgzjh:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzNdgzjh czzNdgzjh, RedirectAttributes redirectAttributes) {
		czzNdgzjhService.delete(czzNdgzjh);
		addMessage(redirectAttributes, "删除年度工作计划成功");
		return "redirect:"+Global.getAdminPath()+"/ndgzjh/czzNdgzjh/?repage";
	}

}