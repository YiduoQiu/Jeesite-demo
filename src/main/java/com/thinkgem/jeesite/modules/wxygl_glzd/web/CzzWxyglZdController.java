/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wxygl_glzd.web;

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
import com.thinkgem.jeesite.modules.wxygl_glzd.entity.CzzWxyglZd;
import com.thinkgem.jeesite.modules.wxygl_glzd.service.CzzWxyglZdService;

/**
 * 管理制度Controller
 * @author qyd
 * @version 2018-09-25
 */
@Controller
@RequestMapping(value = "${adminPath}/wxygl_glzd/czzWxyglZd")
public class CzzWxyglZdController extends BaseController {

	@Autowired
	private CzzWxyglZdService czzWxyglZdService;
	
	@ModelAttribute
	public CzzWxyglZd get(@RequestParam(required=false) String id) {
		CzzWxyglZd entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzWxyglZdService.get(id);
		}
		if (entity == null){
			entity = new CzzWxyglZd();
		}
		return entity;
	}
	
	@RequiresPermissions("wxygl_glzd:czzWxyglZd:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzWxyglZd czzWxyglZd, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzWxyglZd> page = czzWxyglZdService.findPage(new Page<CzzWxyglZd>(request, response), czzWxyglZd); 
		model.addAttribute("page", page);
		return "modules/wxygl_glzd/czzWxyglZdList";
	}

	@RequiresPermissions("wxygl_glzd:czzWxyglZd:view")
	@RequestMapping(value = "form")
	public String form(CzzWxyglZd czzWxyglZd, Model model) {
		czzWxyglZd.setContent(StringEscapeUtils.unescapeHtml4(czzWxyglZd.getContent()));
		model.addAttribute("czzWxyglZd", czzWxyglZd);
		return "modules/wxygl_glzd/czzWxyglZdForm";
	}

	@RequiresPermissions("wxygl_glzd:czzWxyglZd:edit")
	@RequestMapping(value = "save")
	public String save(CzzWxyglZd czzWxyglZd, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzWxyglZd)){
			return form(czzWxyglZd, model);
		}
		czzWxyglZdService.save(czzWxyglZd);
		addMessage(redirectAttributes, "保存管理制度成功");
		return "redirect:"+Global.getAdminPath()+"/wxygl_glzd/czzWxyglZd/?repage";
	}
	
	@RequiresPermissions("wxygl_glzd:czzWxyglZd:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzWxyglZd czzWxyglZd, RedirectAttributes redirectAttributes) {
		czzWxyglZdService.delete(czzWxyglZd);
		addMessage(redirectAttributes, "删除管理制度成功");
		return "redirect:"+Global.getAdminPath()+"/wxygl_glzd/czzWxyglZd/?repage";
	}

}