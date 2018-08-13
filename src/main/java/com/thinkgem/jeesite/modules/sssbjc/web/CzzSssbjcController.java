/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sssbjc.web;

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
import com.thinkgem.jeesite.modules.sssbjc.entity.CzzSssbjc;
import com.thinkgem.jeesite.modules.sssbjc.service.CzzSssbjcService;

/**
 * 设施设备安全检查Controller
 * @author qyd
 * @version 2018-08-13
 */
@Controller
@RequestMapping(value = "${adminPath}/sssbjc/czzSssbjc")
public class CzzSssbjcController extends BaseController {

	@Autowired
	private CzzSssbjcService czzSssbjcService;
	
	@ModelAttribute
	public CzzSssbjc get(@RequestParam(required=false) String id) {
		CzzSssbjc entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzSssbjcService.get(id);
		}
		if (entity == null){
			entity = new CzzSssbjc();
		}
		return entity;
	}
	
	@RequiresPermissions("sssbjc:czzSssbjc:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzSssbjc czzSssbjc, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzSssbjc> page = czzSssbjcService.findPage(new Page<CzzSssbjc>(request, response), czzSssbjc); 
		model.addAttribute("page", page);
		return "modules/sssbjc/czzSssbjcList";
	}

	@RequiresPermissions("sssbjc:czzSssbjc:view")
	@RequestMapping(value = "form")
	public String form(CzzSssbjc czzSssbjc, Model model) {
		model.addAttribute("czzSssbjc", czzSssbjc);
		return "modules/sssbjc/czzSssbjcForm";
	}

	@RequiresPermissions("sssbjc:czzSssbjc:edit")
	@RequestMapping(value = "save")
	public String save(CzzSssbjc czzSssbjc, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzSssbjc)){
			return form(czzSssbjc, model);
		}
		czzSssbjcService.save(czzSssbjc);
		addMessage(redirectAttributes, "保存设施设备安全检查成功");
		return "redirect:"+Global.getAdminPath()+"/sssbjc/czzSssbjc/?repage";
	}
	
	@RequiresPermissions("sssbjc:czzSssbjc:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzSssbjc czzSssbjc, RedirectAttributes redirectAttributes) {
		czzSssbjcService.delete(czzSssbjc);
		addMessage(redirectAttributes, "删除设施设备安全检查成功");
		return "redirect:"+Global.getAdminPath()+"/sssbjc/czzSssbjc/?repage";
	}

}