/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqsgbg.web;

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
import com.thinkgem.jeesite.modules.aqsgbg.entity.CzzAqsgbg;
import com.thinkgem.jeesite.modules.aqsgbg.service.CzzAqsgbgService;

/**
 * DROP TABLE IF EXISTS czz_aqsgbg;Controller
 * @author qyd
 * @version 2018-08-13
 */
@Controller
@RequestMapping(value = "${adminPath}/aqsgbg/czzAqsgbg")
public class CzzAqsgbgController extends BaseController {

	@Autowired
	private CzzAqsgbgService czzAqsgbgService;
	
	@ModelAttribute
	public CzzAqsgbg get(@RequestParam(required=false) String id) {
		CzzAqsgbg entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzAqsgbgService.get(id);
		}
		if (entity == null){
			entity = new CzzAqsgbg();
		}
		return entity;
	}
	
	@RequiresPermissions("aqsgbg:czzAqsgbg:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzAqsgbg czzAqsgbg, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzAqsgbg> page = czzAqsgbgService.findPage(new Page<CzzAqsgbg>(request, response), czzAqsgbg); 
		model.addAttribute("page", page);
		return "modules/aqsgbg/czzAqsgbgList";
	}

	@RequiresPermissions("aqsgbg:czzAqsgbg:view")
	@RequestMapping(value = "form")
	public String form(CzzAqsgbg czzAqsgbg, Model model) {
		model.addAttribute("czzAqsgbg", czzAqsgbg);
		return "modules/aqsgbg/czzAqsgbgForm";
	}

	@RequiresPermissions("aqsgbg:czzAqsgbg:edit")
	@RequestMapping(value = "save")
	public String save(CzzAqsgbg czzAqsgbg, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzAqsgbg)){
			return form(czzAqsgbg, model);
		}
		czzAqsgbgService.save(czzAqsgbg);
		addMessage(redirectAttributes, "保存DROP TABLE IF EXISTS czz_aqsgbg;成功");
		return "redirect:"+Global.getAdminPath()+"/aqsgbg/czzAqsgbg/?repage";
	}
	
	@RequiresPermissions("aqsgbg:czzAqsgbg:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzAqsgbg czzAqsgbg, RedirectAttributes redirectAttributes) {
		czzAqsgbgService.delete(czzAqsgbg);
		addMessage(redirectAttributes, "删除DROP TABLE IF EXISTS czz_aqsgbg;成功");
		return "redirect:"+Global.getAdminPath()+"/aqsgbg/czzAqsgbg/?repage";
	}

}