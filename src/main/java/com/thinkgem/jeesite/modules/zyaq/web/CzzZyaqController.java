/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zyaq.web;

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
import com.thinkgem.jeesite.modules.zyaq.entity.CzzZyaq;
import com.thinkgem.jeesite.modules.zyaq.service.CzzZyaqService;

/**
 * 作业安全Controller
 * @author qyd
 * @version 2018-07-17
 */
@Controller
@RequestMapping(value = "${adminPath}/zyaq/czzZyaq")
public class CzzZyaqController extends BaseController {

	@Autowired
	private CzzZyaqService czzZyaqService;
	
	@ModelAttribute
	public CzzZyaq get(@RequestParam(required=false) String id) {
		CzzZyaq entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzZyaqService.get(id);
		}
		if (entity == null){
			entity = new CzzZyaq();
		}
		return entity;
	}
	
	@RequiresPermissions("zyaq:czzZyaq:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzZyaq czzZyaq, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzZyaq> page = czzZyaqService.findPage(new Page<CzzZyaq>(request, response), czzZyaq); 
		model.addAttribute("page", page);
		return "modules/zyaq/czzZyaqList";
	}

	@RequiresPermissions("zyaq:czzZyaq:view")
	@RequestMapping(value = "form")
	public String form(CzzZyaq czzZyaq, Model model) {
		model.addAttribute("czzZyaq", czzZyaq);
		return "modules/zyaq/czzZyaqForm";
	}

	@RequiresPermissions("zyaq:czzZyaq:edit")
	@RequestMapping(value = "save")
	public String save(CzzZyaq czzZyaq, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzZyaq)){
			return form(czzZyaq, model);
		}
		czzZyaqService.save(czzZyaq);
		addMessage(redirectAttributes, "保存作业安全成功");
		return "redirect:"+Global.getAdminPath()+"/zyaq/czzZyaq/?repage";
	}
	
	@RequiresPermissions("zyaq:czzZyaq:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzZyaq czzZyaq, RedirectAttributes redirectAttributes) {
		czzZyaqService.delete(czzZyaq);
		addMessage(redirectAttributes, "删除作业安全成功");
		return "redirect:"+Global.getAdminPath()+"/zyaq/czzZyaq/?repage";
	}

}