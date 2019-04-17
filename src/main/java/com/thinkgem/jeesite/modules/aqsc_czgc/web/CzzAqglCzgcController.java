/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqsc_czgc.web;

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
import com.thinkgem.jeesite.modules.aqsc_czgc.entity.CzzAqglCzgc;
import com.thinkgem.jeesite.modules.aqsc_czgc.service.CzzAqglCzgcService;

/**
 * 安全生产操作规程Controller
 * @author qyd
 * @version 2018-08-13
 */
@Controller
@RequestMapping(value = "${adminPath}/aqsc_czgc/czzAqglCzgc")
public class CzzAqglCzgcController extends BaseController {

	@Autowired
	private CzzAqglCzgcService czzAqglCzgcService;
	
	@ModelAttribute
	public CzzAqglCzgc get(@RequestParam(required=false) String id) {
		CzzAqglCzgc entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzAqglCzgcService.get(id);
		}
		if (entity == null){
			entity = new CzzAqglCzgc();
		}
		return entity;
	}
	
	@RequiresPermissions("aqsc_czgc:czzAqglCzgc:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzAqglCzgc czzAqglCzgc, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzAqglCzgc> page = czzAqglCzgcService.findPage(new Page<CzzAqglCzgc>(request, response), czzAqglCzgc); 
		model.addAttribute("page", page);
		return "modules/aqsc_czgc/czzAqglCzgcList";
	}

	@RequiresPermissions("aqsc_czgc:czzAqglCzgc:view")
	@RequestMapping(value = "form")
	public String form(CzzAqglCzgc czzAqglCzgc, Model model) {
		czzAqglCzgc.setContent(StringEscapeUtils.unescapeHtml4(czzAqglCzgc.getContent()));
		model.addAttribute("czzAqglCzgc", czzAqglCzgc);
		return "modules/aqsc_czgc/czzAqglCzgcForm";
	}

	@RequiresPermissions("aqsc_czgc:czzAqglCzgc:edit")
	@RequestMapping(value = "save")
	public String save(CzzAqglCzgc czzAqglCzgc, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzAqglCzgc)){
			return form(czzAqglCzgc, model);
		}
		czzAqglCzgcService.save(czzAqglCzgc);
		addMessage(redirectAttributes, "保存安全生产操作规程成功");
		return "redirect:"+Global.getAdminPath()+"/aqsc_czgc/czzAqglCzgc/?repage";
	}
	
	@RequiresPermissions("aqsc_czgc:czzAqglCzgc:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzAqglCzgc czzAqglCzgc, RedirectAttributes redirectAttributes) {
		czzAqglCzgcService.delete(czzAqglCzgc);
		addMessage(redirectAttributes, "删除安全生产操作规程成功");
		return "redirect:"+Global.getAdminPath()+"/aqsc_czgc/czzAqglCzgc/?repage";
	}

	@RequestMapping(value = "help")
	public String help1() {
		return "modules/aqsc_czgc/czzAqglCzgc_help";
	}
}