/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sssbtz.web;

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
import com.thinkgem.jeesite.modules.sssbtz.entity.CzzSssbjcTz;
import com.thinkgem.jeesite.modules.sssbtz.service.CzzSssbjcTzService;

/**
 * 设施设备台账Controller
 * @author qyd
 * @version 2018-09-17
 */
@Controller
@RequestMapping(value = "${adminPath}/sssbtz/czzSssbjcTz")
public class CzzSssbjcTzController extends BaseController {

	@Autowired
	private CzzSssbjcTzService czzSssbjcTzService;
	
	@ModelAttribute
	public CzzSssbjcTz get(@RequestParam(required=false) String id) {
		CzzSssbjcTz entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzSssbjcTzService.get(id);
		}
		if (entity == null){
			entity = new CzzSssbjcTz();
		}
		return entity;
	}
	
	@RequiresPermissions("sssbtz:czzSssbjcTz:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzSssbjcTz czzSssbjcTz, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzSssbjcTz> page = czzSssbjcTzService.findPage(new Page<CzzSssbjcTz>(request, response), czzSssbjcTz); 
		model.addAttribute("page", page);
		return "modules/sssbtz/czzSssbjcTzList";
	}

	@RequiresPermissions("sssbtz:czzSssbjcTz:view")
	@RequestMapping(value = "form")
	public String form(CzzSssbjcTz czzSssbjcTz, Model model) {
		czzSssbjcTz.setSituation(StringEscapeUtils.unescapeHtml4(czzSssbjcTz.getSituation()));
		model.addAttribute("czzSssbjcTz", czzSssbjcTz);
		return "modules/sssbtz/czzSssbjcTzForm";
	}

	@RequiresPermissions("sssbtz:czzSssbjcTz:edit")
	@RequestMapping(value = "save")
	public String save(CzzSssbjcTz czzSssbjcTz, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzSssbjcTz)){
			return form(czzSssbjcTz, model);
		}
		czzSssbjcTzService.save(czzSssbjcTz);
		addMessage(redirectAttributes, "保存设施设备台账成功");
		return "redirect:"+Global.getAdminPath()+"/sssbtz/czzSssbjcTz/?repage";
	}
	
	@RequiresPermissions("sssbtz:czzSssbjcTz:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzSssbjcTz czzSssbjcTz, RedirectAttributes redirectAttributes) {
		czzSssbjcTzService.delete(czzSssbjcTz);
		addMessage(redirectAttributes, "删除设施设备台账成功");
		return "redirect:"+Global.getAdminPath()+"/sssbtz/czzSssbjcTz/?repage";
	}

}