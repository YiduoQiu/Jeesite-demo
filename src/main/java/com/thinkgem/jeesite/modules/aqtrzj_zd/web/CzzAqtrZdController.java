/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqtrzj_zd.web;

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
import com.thinkgem.jeesite.modules.aqtrzj_zd.entity.CzzAqtrZd;
import com.thinkgem.jeesite.modules.aqtrzj_zd.service.CzzAqtrZdService;

/**
 * 安全生产投入资金管理制度Controller
 * @author qyd
 * @version 2019-03-21
 */
@Controller
@RequestMapping(value = "${adminPath}/aqtrzj_zd/czzAqtrZd")
public class CzzAqtrZdController extends BaseController {

	@Autowired
	private CzzAqtrZdService czzAqtrZdService;
	
	@ModelAttribute
	public CzzAqtrZd get(@RequestParam(required=false) String id) {
		CzzAqtrZd entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzAqtrZdService.get(id);
		}
		if (entity == null){
			entity = new CzzAqtrZd();
		}
		return entity;
	}
	
	@RequiresPermissions("aqtrzj_zd:czzAqtrZd:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzAqtrZd czzAqtrZd, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzAqtrZd> page = czzAqtrZdService.findPage(new Page<CzzAqtrZd>(request, response), czzAqtrZd); 
		model.addAttribute("page", page);
		return "modules/aqtrzj_zd/czzAqtrZdList";
	}

	@RequiresPermissions("aqtrzj_zd:czzAqtrZd:view")
	@RequestMapping(value = "form")
	public String form(CzzAqtrZd czzAqtrZd, Model model) {
		czzAqtrZd.setContent(StringEscapeUtils.unescapeHtml4(czzAqtrZd.getContent()));
		model.addAttribute("czzAqtrZd", czzAqtrZd);
		return "modules/aqtrzj_zd/czzAqtrZdForm";
	}

	@RequiresPermissions("aqtrzj_zd:czzAqtrZd:edit")
	@RequestMapping(value = "save")
	public String save(CzzAqtrZd czzAqtrZd, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzAqtrZd)){
			return form(czzAqtrZd, model);
		}
		czzAqtrZdService.save(czzAqtrZd);
		addMessage(redirectAttributes, "保存安全生产投入资金管理制度成功");
		return "redirect:"+Global.getAdminPath()+"/aqtrzj_zd/czzAqtrZd/?repage";
	}
	
	@RequiresPermissions("aqtrzj_zd:czzAqtrZd:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzAqtrZd czzAqtrZd, RedirectAttributes redirectAttributes) {
		czzAqtrZdService.delete(czzAqtrZd);
		addMessage(redirectAttributes, "删除安全生产投入资金管理制度成功");
		return "redirect:"+Global.getAdminPath()+"/aqtrzj_zd/czzAqtrZd/?repage";
	}

}