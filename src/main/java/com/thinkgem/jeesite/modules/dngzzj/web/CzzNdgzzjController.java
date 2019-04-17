/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.dngzzj.web;

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
import com.thinkgem.jeesite.modules.dngzzj.entity.CzzNdgzzj;
import com.thinkgem.jeesite.modules.dngzzj.service.CzzNdgzzjService;

/**
 * 年度工作总结Controller
 * @author qyd
 * @version 2018-12-17
 */
@Controller
@RequestMapping(value = "${adminPath}/dngzzj/czzNdgzzj")
public class CzzNdgzzjController extends BaseController {

	@Autowired
	private CzzNdgzzjService czzNdgzzjService;
	
	@ModelAttribute
	public CzzNdgzzj get(@RequestParam(required=false) String id) {
		CzzNdgzzj entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzNdgzzjService.get(id);
		}
		if (entity == null){
			entity = new CzzNdgzzj();
		}
		return entity;
	}
	
	@RequiresPermissions("dngzzj:czzNdgzzj:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzNdgzzj czzNdgzzj, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzNdgzzj> page = czzNdgzzjService.findPage(new Page<CzzNdgzzj>(request, response), czzNdgzzj); 
		model.addAttribute("page", page);
		return "modules/dngzzj/czzNdgzzjList";
	}

	@RequiresPermissions("dngzzj:czzNdgzzj:view")
	@RequestMapping(value = "form")
	public String form(CzzNdgzzj czzNdgzzj, Model model) {
		czzNdgzzj.setPlan(StringEscapeUtils.unescapeHtml4(czzNdgzzj.getPlan()));
		model.addAttribute("czzNdgzzj", czzNdgzzj);
		return "modules/dngzzj/czzNdgzzjForm";
	}

	@RequiresPermissions("dngzzj:czzNdgzzj:edit")
	@RequestMapping(value = "save")
	public String save(CzzNdgzzj czzNdgzzj, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzNdgzzj)){
			return form(czzNdgzzj, model);
		}
		czzNdgzzjService.save(czzNdgzzj);
		addMessage(redirectAttributes, "保存年度工作总结成功");
		return "redirect:"+Global.getAdminPath()+"/dngzzj/czzNdgzzj/?repage";
	}
	
	@RequiresPermissions("dngzzj:czzNdgzzj:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzNdgzzj czzNdgzzj, RedirectAttributes redirectAttributes) {
		czzNdgzzjService.delete(czzNdgzzj);
		addMessage(redirectAttributes, "删除年度工作总结成功");
		return "redirect:"+Global.getAdminPath()+"/dngzzj/czzNdgzzj/?repage";
	}

}