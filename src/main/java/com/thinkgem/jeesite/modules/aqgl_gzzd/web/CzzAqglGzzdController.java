/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqgl_gzzd.web;

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
import com.thinkgem.jeesite.modules.aqgl_gzzd.entity.CzzAqglGzzd;
import com.thinkgem.jeesite.modules.aqgl_gzzd.service.CzzAqglGzzdService;

/**
 * 安全管理规章制度Controller
 * @author qyd
 * @version 2018-08-13
 */
@Controller
@RequestMapping(value = "${adminPath}/aqgl_gzzd/czzAqglGzzd")
public class CzzAqglGzzdController extends BaseController {

	@Autowired
	private CzzAqglGzzdService czzAqglGzzdService;
	
	@ModelAttribute
	public CzzAqglGzzd get(@RequestParam(required=false) String id) {
		CzzAqglGzzd entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzAqglGzzdService.get(id);
		}
		if (entity == null){
			entity = new CzzAqglGzzd();
		}
		return entity;
	}
	
	@RequiresPermissions("aqgl_gzzd:czzAqglGzzd:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzAqglGzzd czzAqglGzzd, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzAqglGzzd> page = czzAqglGzzdService.findPage(new Page<CzzAqglGzzd>(request, response), czzAqglGzzd); 
		model.addAttribute("page", page);
		return "modules/aqgl_gzzd/czzAqglGzzdList";
	}

	@RequiresPermissions("aqgl_gzzd:czzAqglGzzd:view")
	@RequestMapping(value = "form")
	public String form(CzzAqglGzzd czzAqglGzzd, Model model) {
		czzAqglGzzd.setContent(StringEscapeUtils.unescapeHtml4(czzAqglGzzd.getContent()));
		model.addAttribute("czzAqglGzzd", czzAqglGzzd);
		return "modules/aqgl_gzzd/czzAqglGzzdForm";
	}

	@RequiresPermissions("aqgl_gzzd:czzAqglGzzd:edit")
	@RequestMapping(value = "save")
	public String save(CzzAqglGzzd czzAqglGzzd, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzAqglGzzd)){
			return form(czzAqglGzzd, model);
		}
		czzAqglGzzdService.save(czzAqglGzzd);
		addMessage(redirectAttributes, "保存安全管理规章制度成功");
		return "redirect:"+Global.getAdminPath()+"/aqgl_gzzd/czzAqglGzzd/?repage";
	}
	
	@RequiresPermissions("aqgl_gzzd:czzAqglGzzd:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzAqglGzzd czzAqglGzzd, RedirectAttributes redirectAttributes) {
		czzAqglGzzdService.delete(czzAqglGzzd);
		addMessage(redirectAttributes, "删除安全管理规章制度成功");
		return "redirect:"+Global.getAdminPath()+"/aqgl_gzzd/czzAqglGzzd/?repage";
	}
	
	@RequestMapping(value = "help1")
	public String help1() {
		return "modules/aqgl_gzzd/czzAqglGzzd_help";
	}
}