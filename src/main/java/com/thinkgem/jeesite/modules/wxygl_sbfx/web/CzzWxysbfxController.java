/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wxygl_sbfx.web;

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
import com.thinkgem.jeesite.modules.wxygl_sbfx.entity.CzzWxysbfx;
import com.thinkgem.jeesite.modules.wxygl_sbfx.service.CzzWxysbfxService;

/**
 * 重大危险源管理Controller
 * @author qyd
 * @version 2019-01-08
 */
@Controller
@RequestMapping(value = "${adminPath}/wxygl_sbfx/czzWxysbfx")
public class CzzWxysbfxController extends BaseController {

	@Autowired
	private CzzWxysbfxService czzWxysbfxService;
	
	@ModelAttribute
	public CzzWxysbfx get(@RequestParam(required=false) String id) {
		CzzWxysbfx entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzWxysbfxService.get(id);
		}
		if (entity == null){
			entity = new CzzWxysbfx();
		}
		return entity;
	}
	
	@RequiresPermissions("wxygl_sbfx:czzWxysbfx:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzWxysbfx czzWxysbfx, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzWxysbfx> page = czzWxysbfxService.findPage(new Page<CzzWxysbfx>(request, response), czzWxysbfx); 
		model.addAttribute("page", page);
		return "modules/wxygl_sbfx/czzWxysbfxList";
	}

	@RequiresPermissions("wxygl_sbfx:czzWxysbfx:view")
	@RequestMapping(value = "form")
	public String form(CzzWxysbfx czzWxysbfx, Model model) {
		czzWxysbfx.setPlan(StringEscapeUtils.unescapeHtml4(czzWxysbfx.getPlan()));
		model.addAttribute("czzWxysbfx", czzWxysbfx);
		return "modules/wxygl_sbfx/czzWxysbfxForm";
	}

	@RequiresPermissions("wxygl_sbfx:czzWxysbfx:edit")
	@RequestMapping(value = "save")
	public String save(CzzWxysbfx czzWxysbfx, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzWxysbfx)){
			return form(czzWxysbfx, model);
		}
		czzWxysbfxService.save(czzWxysbfx);
		addMessage(redirectAttributes, "保存重大危险源管理成功");
		return "redirect:"+Global.getAdminPath()+"/wxygl_sbfx/czzWxysbfx/?repage";
	}
	
	@RequiresPermissions("wxygl_sbfx:czzWxysbfx:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzWxysbfx czzWxysbfx, RedirectAttributes redirectAttributes) {
		czzWxysbfxService.delete(czzWxysbfx);
		addMessage(redirectAttributes, "删除重大危险源管理成功");
		return "redirect:"+Global.getAdminPath()+"/wxygl_sbfx/czzWxysbfx/?repage";
	}
	
	@RequestMapping(value = "search")
	public String search() {
		return "modules/wxygl_sbfx/czzWxy_yilan";
	}
	
	@RequestMapping(value = "help1")
	public String help1() {
		return "modules/wxygl_sbfx/czzWxy_help1";
	}
	
	@RequestMapping(value = "help2")
	public String help2() {
		return "modules/wxygl_sbfx/czzWxy_help2";
	}
	
	@RequestMapping(value = "help3")
	public String help3() {
		return "modules/wxygl_sbfx/czzWxy_help3";
	}


}