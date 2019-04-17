/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqkh.web;

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
import com.thinkgem.jeesite.modules.aqkh.entity.CzzAqkh;
import com.thinkgem.jeesite.modules.aqkh.service.CzzAqkhService;

/**
 * 安全考核Controller
 * @author qyd
 * @version 2018-07-16
 */
@Controller
@RequestMapping(value = "${adminPath}/aqkh/czzAqkh")
public class CzzAqkhController extends BaseController {

	@Autowired
	private CzzAqkhService czzAqkhService;
	
	@ModelAttribute
	public CzzAqkh get(@RequestParam(required=false) String id) {
		CzzAqkh entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzAqkhService.get(id);
		}
		if (entity == null){
			entity = new CzzAqkh();
		}
		return entity;
	}
	
	@RequiresPermissions("aqkh:czzAqkh:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzAqkh czzAqkh, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzAqkh> page = czzAqkhService.findPage(new Page<CzzAqkh>(request, response), czzAqkh); 
		model.addAttribute("page", page);
		return "modules/aqkh/czzAqkhList";
	}

	@RequiresPermissions("aqkh:czzAqkh:view")
	@RequestMapping(value = "form")
	public String form(CzzAqkh czzAqkh, Model model) {
		czzAqkh.setContent(StringEscapeUtils.unescapeHtml4(czzAqkh.getContent()));
		czzAqkh.setFeedback(StringEscapeUtils.unescapeHtml4(czzAqkh.getFeedback()));
		model.addAttribute("czzAqkh", czzAqkh);
		return "modules/aqkh/czzAqkhForm";
	}

	@RequiresPermissions("aqkh:czzAqkh:edit")
	@RequestMapping(value = "save")
	public String save(CzzAqkh czzAqkh, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzAqkh)){
			return form(czzAqkh, model);
		}
		czzAqkhService.save(czzAqkh);
		addMessage(redirectAttributes, "保存安全考核成功");
		return "redirect:"+Global.getAdminPath()+"/aqkh/czzAqkh/?repage";
	}
	
	@RequiresPermissions("aqkh:czzAqkh:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzAqkh czzAqkh, RedirectAttributes redirectAttributes) {
		czzAqkhService.delete(czzAqkh);
		addMessage(redirectAttributes, "删除安全考核成功");
		return "redirect:"+Global.getAdminPath()+"/aqkh/czzAqkh/?repage";
	}

}