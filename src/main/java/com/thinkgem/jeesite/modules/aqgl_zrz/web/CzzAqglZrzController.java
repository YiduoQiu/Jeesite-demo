/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqgl_zrz.web;

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
import com.thinkgem.jeesite.modules.aqgl_zrz.entity.CzzAqglZrz;
import com.thinkgem.jeesite.modules.aqgl_zrz.service.CzzAqglZrzService;

/**
 * 安全管理责任制Controller
 * @author qyd
 * @version 2018-08-13
 */
@Controller
@RequestMapping(value = "${adminPath}/aqgl_zrz/czzAqglZrz")
public class CzzAqglZrzController extends BaseController {

	@Autowired
	private CzzAqglZrzService czzAqglZrzService;
	
	@ModelAttribute
	public CzzAqglZrz get(@RequestParam(required=false) String id) {
		CzzAqglZrz entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzAqglZrzService.get(id);
		}
		if (entity == null){
			entity = new CzzAqglZrz();
		}
		return entity;
	}
	
	@RequiresPermissions("aqgl_zrz:czzAqglZrz:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzAqglZrz czzAqglZrz, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzAqglZrz> page = czzAqglZrzService.findPage(new Page<CzzAqglZrz>(request, response), czzAqglZrz); 
		model.addAttribute("page", page);
		return "modules/aqgl_zrz/czzAqglZrzList";
	}

	@RequiresPermissions("aqgl_zrz:czzAqglZrz:view")
	@RequestMapping(value = "form")
	public String form(CzzAqglZrz czzAqglZrz, Model model) {
		czzAqglZrz.setContent(StringEscapeUtils.unescapeHtml4(czzAqglZrz.getContent()));
		model.addAttribute("czzAqglZrz", czzAqglZrz);
		return "modules/aqgl_zrz/czzAqglZrzForm";
	}

	@RequiresPermissions("aqgl_zrz:czzAqglZrz:edit")
	@RequestMapping(value = "save")
	public String save(CzzAqglZrz czzAqglZrz, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzAqglZrz)){
			return form(czzAqglZrz, model);
		}
		czzAqglZrzService.save(czzAqglZrz);
		addMessage(redirectAttributes, "保存安全管理责任制成功");
		return "redirect:"+Global.getAdminPath()+"/aqgl_zrz/czzAqglZrz/?repage";
	}
	
	@RequiresPermissions("aqgl_zrz:czzAqglZrz:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzAqglZrz czzAqglZrz, RedirectAttributes redirectAttributes) {
		czzAqglZrzService.delete(czzAqglZrz);
		addMessage(redirectAttributes, "删除安全管理责任制成功");
		return "redirect:"+Global.getAdminPath()+"/aqgl_zrz/czzAqglZrz/?repage";
	}

	@RequestMapping(value = "help")
	public String help1() {
		return "modules/aqgl_zrz/czzAqglZrz_help";
	}
}