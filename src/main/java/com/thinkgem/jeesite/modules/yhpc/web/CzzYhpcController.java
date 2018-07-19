/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.yhpc.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.thinkgem.jeesite.modules.yhpc.entity.CzzYhpc;
import com.thinkgem.jeesite.modules.yhpc.service.CzzYhpcService;

/**
 * 隐患排查Controller
 * @author qyd
 * @version 2018-07-06
 */
@Controller
@RequestMapping(value = "${adminPath}/yhpc/czzYhpc")
public class CzzYhpcController extends BaseController {

	@Autowired
	private CzzYhpcService czzYhpcService;
	
	@ModelAttribute
	public CzzYhpc get(@RequestParam(required=false) String id) {
		CzzYhpc entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzYhpcService.get(id);
		}
		if (entity == null){
			entity = new CzzYhpc();
		}
		return entity;
	}
	
	@RequiresPermissions("yhpc:czzYhpc:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzYhpc czzYhpc, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzYhpc> page = czzYhpcService.findPage(new Page<CzzYhpc>(request, response), czzYhpc); 
		model.addAttribute("page", page);
		return "modules/yhpc/czzYhpcList";
	}

	@RequiresPermissions("yhpc:czzYhpc:view")
	@RequestMapping(value = "form")
	public String form(CzzYhpc czzYhpc, Model model) {
		model.addAttribute("czzYhpc", czzYhpc);
		return "modules/yhpc/czzYhpcForm";
	}

	@RequiresPermissions("yhpc:czzYhpc:edit")
	@RequestMapping(value = "save")
	public String save(CzzYhpc czzYhpc, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzYhpc)){
			return form(czzYhpc, model);
		}
		czzYhpcService.save(czzYhpc);
		addMessage(redirectAttributes, "保存隐患排查成功");
		return "redirect:"+Global.getAdminPath()+"/yhpc/czzYhpc/?repage";
	}
	
	@RequiresPermissions("yhpc:czzYhpc:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzYhpc czzYhpc, RedirectAttributes redirectAttributes) {
		czzYhpcService.delete(czzYhpc);
		addMessage(redirectAttributes, "删除隐患排查成功");
		return "redirect:"+Global.getAdminPath()+"/yhpc/czzYhpc/?repage";
	}

}