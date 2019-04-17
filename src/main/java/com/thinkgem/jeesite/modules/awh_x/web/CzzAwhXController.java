/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.awh_x.web;

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
import com.thinkgem.jeesite.modules.aqglbm.entity.CzzAqglbm;
import com.thinkgem.jeesite.modules.awh_x.entity.CzzAwhX;
import com.thinkgem.jeesite.modules.awh_x.service.CzzAwhXService;

/**
 * 新安委会Controller
 * @author qyd
 * @version 2018-09-13
 */
@Controller
@RequestMapping(value = "${adminPath}/awh_x/czzAwhX")
public class CzzAwhXController extends BaseController {

	@Autowired
	private CzzAwhXService czzAwhXService;
	
	@ModelAttribute
	public CzzAwhX get(@RequestParam(required=false) String id) {
		CzzAwhX entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzAwhXService.get(id);
		}
		if (entity == null){
			entity = new CzzAwhX();
		}
		return entity;
	}
	
	@RequiresPermissions("awh_x:czzAwhX:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzAwhX czzAwhX, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzAwhX> page = czzAwhXService.findPage(new Page<CzzAwhX>(request, response), czzAwhX); 
		for(CzzAwhX czzawhx:page.getList()){
			czzawhx.setPost(StringEscapeUtils.unescapeHtml4(czzawhx.getPost()));
		}
		model.addAttribute("page", page);
		return "modules/awh_x/czzAwhXList";
	}

	@RequiresPermissions("awh_x:czzAwhX:view")
	@RequestMapping(value = "form")
	public String form(CzzAwhX czzAwhX, Model model) {
		czzAwhX.setPost(StringEscapeUtils.unescapeHtml4(czzAwhX.getPost()));
		model.addAttribute("czzAwhX", czzAwhX);
		return "modules/awh_x/czzAwhXForm";
	}

	@RequiresPermissions("awh_x:czzAwhX:edit")
	@RequestMapping(value = "save")
	public String save(CzzAwhX czzAwhX, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzAwhX)){
			return form(czzAwhX, model);
		}
		czzAwhXService.save(czzAwhX);
		addMessage(redirectAttributes, "保存安委会成员成功");
		return "redirect:"+Global.getAdminPath()+"/awh_x/czzAwhX/?repage";
	}
	
	@RequiresPermissions("awh_x:czzAwhX:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzAwhX czzAwhX, RedirectAttributes redirectAttributes) {
		czzAwhXService.delete(czzAwhX);
		addMessage(redirectAttributes, "删除安委会成员成功");
		return "redirect:"+Global.getAdminPath()+"/awh_x/czzAwhX/?repage";
	}

}