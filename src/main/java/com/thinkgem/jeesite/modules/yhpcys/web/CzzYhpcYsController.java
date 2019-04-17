/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.yhpcys.web;

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
import com.thinkgem.jeesite.modules.yhpcys.entity.CzzYhpcYs;
import com.thinkgem.jeesite.modules.yhpcys.service.CzzYhpcYsService;

/**
 * 隐患排查验收Controller
 * @author qyd
 * @version 2018-08-08
 */
@Controller
@RequestMapping(value = "${adminPath}/yhpcys/czzYhpcYs")
public class CzzYhpcYsController extends BaseController {

	@Autowired
	private CzzYhpcYsService czzYhpcYsService;
	
	@ModelAttribute
	public CzzYhpcYs get(@RequestParam(required=false) String id) {
		CzzYhpcYs entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzYhpcYsService.get(id);
		}
		if (entity == null){
			entity = new CzzYhpcYs();
		}
		return entity;
	}
	
	@RequiresPermissions("yhpcys:czzYhpcYs:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzYhpcYs czzYhpcYs, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzYhpcYs> page = czzYhpcYsService.findPage(new Page<CzzYhpcYs>(request, response), czzYhpcYs); 
		model.addAttribute("page", page);
		return "modules/yhpcys/czzYhpcYsList";
	}

	@RequiresPermissions("yhpcys:czzYhpcYs:view")
	@RequestMapping(value = "form")
	public String form(CzzYhpcYs czzYhpcYs, Model model) {
		czzYhpcYs.setContent1(StringEscapeUtils.unescapeHtml4(czzYhpcYs.getContent1()));
		czzYhpcYs.setContent2(StringEscapeUtils.unescapeHtml4(czzYhpcYs.getContent2()));
		czzYhpcYs.setContent3(StringEscapeUtils.unescapeHtml4(czzYhpcYs.getContent3()));
		czzYhpcYs.setContent4(StringEscapeUtils.unescapeHtml4(czzYhpcYs.getContent4()));
		czzYhpcYs.setContent5(StringEscapeUtils.unescapeHtml4(czzYhpcYs.getContent5()));
		czzYhpcYs.setContent6(StringEscapeUtils.unescapeHtml4(czzYhpcYs.getContent6()));
		czzYhpcYs.setCorrectacction(StringEscapeUtils.unescapeHtml4(czzYhpcYs.getCorrectacction()));
		model.addAttribute("czzYhpcYs", czzYhpcYs);
		return "modules/yhpcys/czzYhpcYsForm";
	}

	@RequiresPermissions("yhpcys:czzYhpcYs:edit")
	@RequestMapping(value = "save")
	public String save(CzzYhpcYs czzYhpcYs, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzYhpcYs)){
			return form(czzYhpcYs, model);
		}
		czzYhpcYsService.save(czzYhpcYs);
		addMessage(redirectAttributes, "保存隐患排查验收成功");
		return "redirect:"+Global.getAdminPath()+"/yhpcys/czzYhpcYs/?repage";
	}
	
	@RequiresPermissions("yhpcys:czzYhpcYs:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzYhpcYs czzYhpcYs, RedirectAttributes redirectAttributes) {
		czzYhpcYsService.delete(czzYhpcYs);
		addMessage(redirectAttributes, "删除隐患排查验收成功");
		return "redirect:"+Global.getAdminPath()+"/yhpcys/czzYhpcYs/?repage";
	}

}