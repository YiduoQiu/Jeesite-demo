/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqjc_zd.web;

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
import com.thinkgem.jeesite.modules.aqjc_zd.entity.CzzAqjcZd;
import com.thinkgem.jeesite.modules.aqjc_zd.service.CzzAqjcZdService;

/**
 * 安全检查制度Controller
 * @author qyd
 * @version 2019-03-21
 */
@Controller
@RequestMapping(value = "${adminPath}/aqjc_zd/czzAqjcZd")
public class CzzAqjcZdController extends BaseController {

	@Autowired
	private CzzAqjcZdService czzAqjcZdService;
	
	@ModelAttribute
	public CzzAqjcZd get(@RequestParam(required=false) String id) {
		CzzAqjcZd entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzAqjcZdService.get(id);
		}
		if (entity == null){
			entity = new CzzAqjcZd();
		}
		return entity;
	}
	
	@RequiresPermissions("aqjc_zd:czzAqjcZd:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzAqjcZd czzAqjcZd, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzAqjcZd> page = czzAqjcZdService.findPage(new Page<CzzAqjcZd>(request, response), czzAqjcZd); 
		model.addAttribute("page", page);
		return "modules/aqjc_zd/czzAqjcZdList";
	}

	@RequiresPermissions("aqjc_zd:czzAqjcZd:view")
	@RequestMapping(value = "form")
	public String form(CzzAqjcZd czzAqjcZd, Model model) {
		czzAqjcZd.setContent(StringEscapeUtils.unescapeHtml4(czzAqjcZd.getContent()));
		model.addAttribute("czzAqjcZd", czzAqjcZd);
		return "modules/aqjc_zd/czzAqjcZdForm";
	}

	@RequiresPermissions("aqjc_zd:czzAqjcZd:edit")
	@RequestMapping(value = "save")
	public String save(CzzAqjcZd czzAqjcZd, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzAqjcZd)){
			return form(czzAqjcZd, model);
		}
		czzAqjcZdService.save(czzAqjcZd);
		addMessage(redirectAttributes, "保存安全检查制度成功");
		return "redirect:"+Global.getAdminPath()+"/aqjc_zd/czzAqjcZd/?repage";
	}
	
	@RequiresPermissions("aqjc_zd:czzAqjcZd:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzAqjcZd czzAqjcZd, RedirectAttributes redirectAttributes) {
		czzAqjcZdService.delete(czzAqjcZd);
		addMessage(redirectAttributes, "删除安全检查制度成功");
		return "redirect:"+Global.getAdminPath()+"/aqjc_zd/czzAqjcZd/?repage";
	}

}