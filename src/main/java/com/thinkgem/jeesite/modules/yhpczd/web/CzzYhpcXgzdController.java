/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.yhpczd.web;

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
import com.thinkgem.jeesite.modules.yhpczd.entity.CzzYhpcXgzd;
import com.thinkgem.jeesite.modules.yhpczd.service.CzzYhpcXgzdService;

/**
 * 隐患排查相关制度Controller
 * @author qyd
 * @version 2018-09-13
 */
@Controller
@RequestMapping(value = "${adminPath}/yhpczd/czzYhpcXgzd")
public class CzzYhpcXgzdController extends BaseController {

	@Autowired
	private CzzYhpcXgzdService czzYhpcXgzdService;
	
	@ModelAttribute
	public CzzYhpcXgzd get(@RequestParam(required=false) String id) {
		CzzYhpcXgzd entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzYhpcXgzdService.get(id);
		}
		if (entity == null){
			entity = new CzzYhpcXgzd();
		}
		return entity;
	}
	
	@RequiresPermissions("yhpczd:czzYhpcXgzd:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzYhpcXgzd czzYhpcXgzd, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzYhpcXgzd> page = czzYhpcXgzdService.findPage(new Page<CzzYhpcXgzd>(request, response), czzYhpcXgzd); 
		model.addAttribute("page", page);
		return "modules/yhpczd/czzYhpcXgzdList";
	}

	@RequiresPermissions("yhpczd:czzYhpcXgzd:view")
	@RequestMapping(value = "form")
	public String form(CzzYhpcXgzd czzYhpcXgzd, Model model) {
		czzYhpcXgzd.setContent(StringEscapeUtils.unescapeHtml4(czzYhpcXgzd.getContent()));
		model.addAttribute("czzYhpcXgzd", czzYhpcXgzd);
		return "modules/yhpczd/czzYhpcXgzdForm";
	}

	@RequiresPermissions("yhpczd:czzYhpcXgzd:edit")
	@RequestMapping(value = "save")
	public String save(CzzYhpcXgzd czzYhpcXgzd, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzYhpcXgzd)){
			return form(czzYhpcXgzd, model);
		}
		czzYhpcXgzdService.save(czzYhpcXgzd);
		addMessage(redirectAttributes, "保存制度成功");
		return "redirect:"+Global.getAdminPath()+"/yhpczd/czzYhpcXgzd/?repage";
	}
	
	@RequiresPermissions("yhpczd:czzYhpcXgzd:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzYhpcXgzd czzYhpcXgzd, RedirectAttributes redirectAttributes) {
		czzYhpcXgzdService.delete(czzYhpcXgzd);
		addMessage(redirectAttributes, "删除制度成功");
		return "redirect:"+Global.getAdminPath()+"/yhpczd/czzYhpcXgzd/?repage";
	}

}