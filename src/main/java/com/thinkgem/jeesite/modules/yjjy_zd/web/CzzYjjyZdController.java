/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.yjjy_zd.web;

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
import com.thinkgem.jeesite.modules.yjjy_zd.entity.CzzYjjyZd;
import com.thinkgem.jeesite.modules.yjjy_zd.service.CzzYjjyZdService;

/**
 * 应急救援制度Controller
 * @author qyd
 * @version 2019-03-21
 */
@Controller
@RequestMapping(value = "${adminPath}/yjjy_zd/czzYjjyZd")
public class CzzYjjyZdController extends BaseController {

	@Autowired
	private CzzYjjyZdService czzYjjyZdService;
	
	@ModelAttribute
	public CzzYjjyZd get(@RequestParam(required=false) String id) {
		CzzYjjyZd entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzYjjyZdService.get(id);
		}
		if (entity == null){
			entity = new CzzYjjyZd();
		}
		return entity;
	}
	
	@RequiresPermissions("yjjy_zd:czzYjjyZd:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzYjjyZd czzYjjyZd, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzYjjyZd> page = czzYjjyZdService.findPage(new Page<CzzYjjyZd>(request, response), czzYjjyZd); 
		model.addAttribute("page", page);
		return "modules/yjjy_zd/czzYjjyZdList";
	}

	@RequiresPermissions("yjjy_zd:czzYjjyZd:view")
	@RequestMapping(value = "form")
	public String form(CzzYjjyZd czzYjjyZd, Model model) {
		czzYjjyZd.setContent(StringEscapeUtils.unescapeHtml4(czzYjjyZd.getContent()));
		model.addAttribute("czzYjjyZd", czzYjjyZd);
		return "modules/yjjy_zd/czzYjjyZdForm";
	}

	@RequiresPermissions("yjjy_zd:czzYjjyZd:edit")
	@RequestMapping(value = "save")
	public String save(CzzYjjyZd czzYjjyZd, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzYjjyZd)){
			return form(czzYjjyZd, model);
		}
		czzYjjyZdService.save(czzYjjyZd);
		addMessage(redirectAttributes, "保存应急救援制度成功");
		return "redirect:"+Global.getAdminPath()+"/yjjy_zd/czzYjjyZd/?repage";
	}
	
	@RequiresPermissions("yjjy_zd:czzYjjyZd:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzYjjyZd czzYjjyZd, RedirectAttributes redirectAttributes) {
		czzYjjyZdService.delete(czzYjjyZd);
		addMessage(redirectAttributes, "删除应急救援制度成功");
		return "redirect:"+Global.getAdminPath()+"/yjjy_zd/czzYjjyZd/?repage";
	}

}