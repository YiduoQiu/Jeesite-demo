/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqkh_zd.web;

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
import com.thinkgem.jeesite.modules.aqkh_zd.entity.CzzAqkhZd;
import com.thinkgem.jeesite.modules.aqkh_zd.service.CzzAqkhZdService;

/**
 * 安全考核制度Controller
 * @author qyd
 * @version 2019-03-21
 */
@Controller
@RequestMapping(value = "${adminPath}/aqkh_zd/czzAqkhZd")
public class CzzAqkhZdController extends BaseController {

	@Autowired
	private CzzAqkhZdService czzAqkhZdService;
	
	@ModelAttribute
	public CzzAqkhZd get(@RequestParam(required=false) String id) {
		CzzAqkhZd entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzAqkhZdService.get(id);
		}
		if (entity == null){
			entity = new CzzAqkhZd();
		}
		return entity;
	}
	
	@RequiresPermissions("aqkh_zd:czzAqkhZd:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzAqkhZd czzAqkhZd, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzAqkhZd> page = czzAqkhZdService.findPage(new Page<CzzAqkhZd>(request, response), czzAqkhZd); 
		model.addAttribute("page", page);
		return "modules/aqkh_zd/czzAqkhZdList";
	}

	@RequiresPermissions("aqkh_zd:czzAqkhZd:view")
	@RequestMapping(value = "form")
	public String form(CzzAqkhZd czzAqkhZd, Model model) {
		czzAqkhZd.setContent(StringEscapeUtils.unescapeHtml4(czzAqkhZd.getContent()));
		model.addAttribute("czzAqkhZd", czzAqkhZd);
		return "modules/aqkh_zd/czzAqkhZdForm";
	}

	@RequiresPermissions("aqkh_zd:czzAqkhZd:edit")
	@RequestMapping(value = "save")
	public String save(CzzAqkhZd czzAqkhZd, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzAqkhZd)){
			return form(czzAqkhZd, model);
		}
		czzAqkhZdService.save(czzAqkhZd);
		addMessage(redirectAttributes, "保存安全考核制度成功");
		return "redirect:"+Global.getAdminPath()+"/aqkh_zd/czzAqkhZd/?repage";
	}
	
	@RequiresPermissions("aqkh_zd:czzAqkhZd:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzAqkhZd czzAqkhZd, RedirectAttributes redirectAttributes) {
		czzAqkhZdService.delete(czzAqkhZd);
		addMessage(redirectAttributes, "删除安全考核制度成功");
		return "redirect:"+Global.getAdminPath()+"/aqkh_zd/czzAqkhZd/?repage";
	}

}