/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqtr.web;

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
import com.thinkgem.jeesite.modules.aqtr.entity.CzzAqtr;
import com.thinkgem.jeesite.modules.aqtr.service.CzzAqtrService;

/**
 * 安全投入Controller
 * @author qyd
 * @version 2018-07-09
 */
@Controller
@RequestMapping(value = "${adminPath}/aqtr/czzAqtr")
public class CzzAqtrController extends BaseController {

	@Autowired
	private CzzAqtrService czzAqtrService;
	
	@ModelAttribute
	public CzzAqtr get(@RequestParam(required=false) String id) {
		CzzAqtr entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzAqtrService.get(id);
		}
		if (entity == null){
			entity = new CzzAqtr();
		}
		return entity;
	}
	
	@RequiresPermissions("aqtr:czzAqtr:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzAqtr czzAqtr, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzAqtr> page = czzAqtrService.findPage(new Page<CzzAqtr>(request, response), czzAqtr); 
		model.addAttribute("page", page);
		return "modules/aqtr/czzAqtrList";
	}

	@RequiresPermissions("aqtr:czzAqtr:view")
	@RequestMapping(value = "form")
	public String form(CzzAqtr czzAqtr, Model model) {
		model.addAttribute("czzAqtr", czzAqtr);
		return "modules/aqtr/czzAqtrForm";
	}

	@RequiresPermissions("aqtr:czzAqtr:edit")
	@RequestMapping(value = "save")
	public String save(CzzAqtr czzAqtr, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzAqtr)){
			return form(czzAqtr, model);
		}
		czzAqtrService.save(czzAqtr);
		addMessage(redirectAttributes, "保存安全投入成功");
		return "redirect:"+Global.getAdminPath()+"/aqtr/czzAqtr/?repage";
	}
	
	@RequiresPermissions("aqtr:czzAqtr:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzAqtr czzAqtr, RedirectAttributes redirectAttributes) {
		czzAqtrService.delete(czzAqtr);
		addMessage(redirectAttributes, "删除安全投入成功");
		return "redirect:"+Global.getAdminPath()+"/aqtr/czzAqtr/?repage";
	}

}