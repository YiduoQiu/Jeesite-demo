/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sssb_aqzd.web;

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
import com.thinkgem.jeesite.modules.sssb_aqzd.entity.CzzSssbAqzd;
import com.thinkgem.jeesite.modules.sssb_aqzd.service.CzzSssbAqzdService;

/**
 * 设备安全制度Controller
 * @author qyd
 * @version 2019-03-20
 */
@Controller
@RequestMapping(value = "${adminPath}/sssb_aqzd/czzSssbAqzd")
public class CzzSssbAqzdController extends BaseController {

	@Autowired
	private CzzSssbAqzdService czzSssbAqzdService;
	
	@ModelAttribute
	public CzzSssbAqzd get(@RequestParam(required=false) String id) {
		CzzSssbAqzd entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzSssbAqzdService.get(id);
		}
		if (entity == null){
			entity = new CzzSssbAqzd();
		}
		return entity;
	}
	
	@RequiresPermissions("sssb_aqzd:czzSssbAqzd:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzSssbAqzd czzSssbAqzd, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzSssbAqzd> page = czzSssbAqzdService.findPage(new Page<CzzSssbAqzd>(request, response), czzSssbAqzd); 
		model.addAttribute("page", page);
		return "modules/sssb_aqzd/czzSssbAqzdList";
	}

	@RequiresPermissions("sssb_aqzd:czzSssbAqzd:view")
	@RequestMapping(value = "form")
	public String form(CzzSssbAqzd czzSssbAqzd, Model model) {
		czzSssbAqzd.setContent(StringEscapeUtils.unescapeHtml4(czzSssbAqzd.getContent()));
		model.addAttribute("czzSssbAqzd", czzSssbAqzd);
		return "modules/sssb_aqzd/czzSssbAqzdForm";
	}

	@RequiresPermissions("sssb_aqzd:czzSssbAqzd:edit")
	@RequestMapping(value = "save")
	public String save(CzzSssbAqzd czzSssbAqzd, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzSssbAqzd)){
			return form(czzSssbAqzd, model);
		}
		czzSssbAqzdService.save(czzSssbAqzd);
		addMessage(redirectAttributes, "保存设备安全制度成功");
		return "redirect:"+Global.getAdminPath()+"/sssb_aqzd/czzSssbAqzd/?repage";
	}
	
	@RequiresPermissions("sssb_aqzd:czzSssbAqzd:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzSssbAqzd czzSssbAqzd, RedirectAttributes redirectAttributes) {
		czzSssbAqzdService.delete(czzSssbAqzd);
		addMessage(redirectAttributes, "删除设备安全制度成功");
		return "redirect:"+Global.getAdminPath()+"/sssb_aqzd/czzSssbAqzd/?repage";
	}

}