/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zyaq_zd.web;

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
import com.thinkgem.jeesite.modules.zyaq_zd.entity.CzzZyaqZd;
import com.thinkgem.jeesite.modules.zyaq_zd.service.CzzZyaqZdService;

/**
 * 作业安全制度Controller
 * @author qyd
 * @version 2019-03-20
 */
@Controller
@RequestMapping(value = "${adminPath}/zyaq_zd/czzZyaqZd")
public class CzzZyaqZdController extends BaseController {

	@Autowired
	private CzzZyaqZdService czzZyaqZdService;
	
	@ModelAttribute
	public CzzZyaqZd get(@RequestParam(required=false) String id) {
		CzzZyaqZd entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzZyaqZdService.get(id);
		}
		if (entity == null){
			entity = new CzzZyaqZd();
		}
		return entity;
	}
	
	@RequiresPermissions("zyaq_zd:czzZyaqZd:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzZyaqZd czzZyaqZd, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzZyaqZd> page = czzZyaqZdService.findPage(new Page<CzzZyaqZd>(request, response), czzZyaqZd); 
		model.addAttribute("page", page);
		return "modules/zyaq_zd/czzZyaqZdList";
	}

	@RequiresPermissions("zyaq_zd:czzZyaqZd:view")
	@RequestMapping(value = "form")
	public String form(CzzZyaqZd czzZyaqZd, Model model) {
		czzZyaqZd.setContent(StringEscapeUtils.unescapeHtml4(czzZyaqZd.getContent()));
		model.addAttribute("czzZyaqZd", czzZyaqZd);
		return "modules/zyaq_zd/czzZyaqZdForm";
	}

	@RequiresPermissions("zyaq_zd:czzZyaqZd:edit")
	@RequestMapping(value = "save")
	public String save(CzzZyaqZd czzZyaqZd, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzZyaqZd)){
			return form(czzZyaqZd, model);
		}
		czzZyaqZdService.save(czzZyaqZd);
		addMessage(redirectAttributes, "保存作业安全制度成功");
		return "redirect:"+Global.getAdminPath()+"/zyaq_zd/czzZyaqZd/?repage";
	}
	
	@RequiresPermissions("zyaq_zd:czzZyaqZd:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzZyaqZd czzZyaqZd, RedirectAttributes redirectAttributes) {
		czzZyaqZdService.delete(czzZyaqZd);
		addMessage(redirectAttributes, "删除作业安全制度成功");
		return "redirect:"+Global.getAdminPath()+"/zyaq_zd/czzZyaqZd/?repage";
	}

}