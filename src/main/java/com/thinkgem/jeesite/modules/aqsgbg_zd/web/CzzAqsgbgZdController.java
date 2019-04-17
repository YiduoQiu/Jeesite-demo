/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqsgbg_zd.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringEscapeUtils;
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
import com.thinkgem.jeesite.modules.aqsgbg_zd.entity.CzzAqsgbgZd;
import com.thinkgem.jeesite.modules.aqsgbg_zd.service.CzzAqsgbgZdService;

/**
 * 安全事故报告制度Controller
 * @author qyd
 * @version 2019-03-21
 */
@Controller
@RequestMapping(value = "${adminPath}/aqsgbg_zd/czzAqsgbgZd")
public class CzzAqsgbgZdController extends BaseController {

	@Autowired
	private CzzAqsgbgZdService czzAqsgbgZdService;
	
	@ModelAttribute
	public CzzAqsgbgZd get(@RequestParam(required=false) String id) {
		CzzAqsgbgZd entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzAqsgbgZdService.get(id);
		}
		if (entity == null){
			entity = new CzzAqsgbgZd();
		}
		return entity;
	}
	
	@RequiresPermissions("aqsgbg_zd:czzAqsgbgZd:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzAqsgbgZd czzAqsgbgZd, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzAqsgbgZd> page = czzAqsgbgZdService.findPage(new Page<CzzAqsgbgZd>(request, response), czzAqsgbgZd); 
		model.addAttribute("page", page);
		return "modules/aqsgbg_zd/czzAqsgbgZdList";
	}

	@RequiresPermissions("aqsgbg_zd:czzAqsgbgZd:view")
	@RequestMapping(value = "form")
	public String form(CzzAqsgbgZd czzAqsgbgZd, Model model) {
		czzAqsgbgZd.setContent(StringEscapeUtils.unescapeHtml4(czzAqsgbgZd.getContent()));
		model.addAttribute("czzAqsgbgZd", czzAqsgbgZd);
		return "modules/aqsgbg_zd/czzAqsgbgZdForm";
	}

	@RequiresPermissions("aqsgbg_zd:czzAqsgbgZd:edit")
	@RequestMapping(value = "save")
	public String save(CzzAqsgbgZd czzAqsgbgZd, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzAqsgbgZd)){
			return form(czzAqsgbgZd, model);
		}
		czzAqsgbgZdService.save(czzAqsgbgZd);
		addMessage(redirectAttributes, "保存安全事故报告制度成功");
		return "redirect:"+Global.getAdminPath()+"/aqsgbg_zd/czzAqsgbgZd/?repage";
	}
	
	@RequiresPermissions("aqsgbg_zd:czzAqsgbgZd:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzAqsgbgZd czzAqsgbgZd, RedirectAttributes redirectAttributes) {
		czzAqsgbgZdService.delete(czzAqsgbgZd);
		addMessage(redirectAttributes, "删除安全事故报告制度成功");
		return "redirect:"+Global.getAdminPath()+"/aqsgbg_zd/czzAqsgbgZd/?repage";
	}

}