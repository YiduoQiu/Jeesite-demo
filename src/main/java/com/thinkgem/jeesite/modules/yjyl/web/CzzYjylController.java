/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.yjyl.web;

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
import com.thinkgem.jeesite.modules.yjyl.entity.CzzYjyl;
import com.thinkgem.jeesite.modules.yjyl.service.CzzYjylService;

/**
 * 应急演练Controller
 * @author qyd
 * @version 2018-08-08
 */
@Controller
@RequestMapping(value = "${adminPath}/yjyl/czzYjyl")
public class CzzYjylController extends BaseController {

	@Autowired
	private CzzYjylService czzYjylService;
	
	@ModelAttribute
	public CzzYjyl get(@RequestParam(required=false) String id) {
		CzzYjyl entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzYjylService.get(id);
		}
		if (entity == null){
			entity = new CzzYjyl();
		}
		return entity;
	}
	
	@RequiresPermissions("yjyl:czzYjyl:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzYjyl czzYjyl, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzYjyl> page = czzYjylService.findPage(new Page<CzzYjyl>(request, response), czzYjyl); 
		model.addAttribute("page", page);
		return "modules/yjyl/czzYjylList";
	}

	@RequiresPermissions("yjyl:czzYjyl:view")
	@RequestMapping(value = "form")
	public String form(CzzYjyl czzYjyl, Model model) {
		model.addAttribute("czzYjyl", czzYjyl);
		return "modules/yjyl/czzYjylForm";
	}

	@RequiresPermissions("yjyl:czzYjyl:edit")
	@RequestMapping(value = "save")
	public String save(CzzYjyl czzYjyl, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzYjyl)){
			return form(czzYjyl, model);
		}
		czzYjylService.save(czzYjyl);
		addMessage(redirectAttributes, "保存应急演练成功");
		return "redirect:"+Global.getAdminPath()+"/yjyl/czzYjyl/?repage";
	}
	
	@RequiresPermissions("yjyl:czzYjyl:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzYjyl czzYjyl, RedirectAttributes redirectAttributes) {
		czzYjylService.delete(czzYjyl);
		addMessage(redirectAttributes, "删除应急演练成功");
		return "redirect:"+Global.getAdminPath()+"/yjyl/czzYjyl/?repage";
	}

}