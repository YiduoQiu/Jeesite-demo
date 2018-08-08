/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqglbm.web;

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
import com.thinkgem.jeesite.modules.aqglbm.entity.CzzAqglbm;
import com.thinkgem.jeesite.modules.aqglbm.service.CzzAqglbmService;

/**
 * 安全管理部门Controller
 * @author qyd
 * @version 2018-08-08
 */
@Controller
@RequestMapping(value = "${adminPath}/aqglbm/czzAqglbm")
public class CzzAqglbmController extends BaseController {

	@Autowired
	private CzzAqglbmService czzAqglbmService;
	
	@ModelAttribute
	public CzzAqglbm get(@RequestParam(required=false) String id) {
		CzzAqglbm entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzAqglbmService.get(id);
		}
		if (entity == null){
			entity = new CzzAqglbm();
		}
		return entity;
	}
	
	@RequiresPermissions("aqglbm:czzAqglbm:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzAqglbm czzAqglbm, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzAqglbm> page = czzAqglbmService.findPage(new Page<CzzAqglbm>(request, response), czzAqglbm); 
		model.addAttribute("page", page);
		return "modules/aqglbm/czzAqglbmList";
	}

	@RequiresPermissions("aqglbm:czzAqglbm:view")
	@RequestMapping(value = "form")
	public String form(CzzAqglbm czzAqglbm, Model model) {
		model.addAttribute("czzAqglbm", czzAqglbm);
		return "modules/aqglbm/czzAqglbmForm";
	}

	@RequiresPermissions("aqglbm:czzAqglbm:edit")
	@RequestMapping(value = "save")
	public String save(CzzAqglbm czzAqglbm, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzAqglbm)){
			return form(czzAqglbm, model);
		}
		czzAqglbmService.save(czzAqglbm);
		addMessage(redirectAttributes, "保存安全管理部门成功");
		return "redirect:"+Global.getAdminPath()+"/aqglbm/czzAqglbm/?repage";
	}
	
	@RequiresPermissions("aqglbm:czzAqglbm:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzAqglbm czzAqglbm, RedirectAttributes redirectAttributes) {
		czzAqglbmService.delete(czzAqglbm);
		addMessage(redirectAttributes, "删除安全管理部门成功");
		return "redirect:"+Global.getAdminPath()+"/aqglbm/czzAqglbm/?repage";
	}

}