/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zyjk.web;

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
import com.thinkgem.jeesite.modules.zyjk.entity.CzzZyjk;
import com.thinkgem.jeesite.modules.zyjk.service.CzzZyjkService;

/**
 * 职业健康Controller
 * @author qyd
 * @version 2018-07-20
 */
@Controller
@RequestMapping(value = "${adminPath}/zyjk/czzZyjk")
public class CzzZyjkController extends BaseController {

	@Autowired
	private CzzZyjkService czzZyjkService;
	
	@ModelAttribute
	public CzzZyjk get(@RequestParam(required=false) String id) {
		CzzZyjk entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzZyjkService.get(id);
		}
		if (entity == null){
			entity = new CzzZyjk();
		}
		return entity;
	}
	
	@RequiresPermissions("zyjk:czzZyjk:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzZyjk czzZyjk, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzZyjk> page = czzZyjkService.findPage(new Page<CzzZyjk>(request, response), czzZyjk); 
		model.addAttribute("page", page);
		return "modules/zyjk/czzZyjkList";
	}

	@RequiresPermissions("zyjk:czzZyjk:view")
	@RequestMapping(value = "form")
	public String form(CzzZyjk czzZyjk, Model model) {
		model.addAttribute("czzZyjk", czzZyjk);
		return "modules/zyjk/czzZyjkForm";
	}

	@RequiresPermissions("zyjk:czzZyjk:edit")
	@RequestMapping(value = "save")
	public String save(CzzZyjk czzZyjk, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzZyjk)){
			return form(czzZyjk, model);
		}
		czzZyjkService.save(czzZyjk);
		addMessage(redirectAttributes, "保存职业健康成功");
		return "redirect:"+Global.getAdminPath()+"/zyjk/czzZyjk/?repage";
	}
	
	@RequiresPermissions("zyjk:czzZyjk:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzZyjk czzZyjk, RedirectAttributes redirectAttributes) {
		czzZyjkService.delete(czzZyjk);
		addMessage(redirectAttributes, "删除职业健康成功");
		return "redirect:"+Global.getAdminPath()+"/zyjk/czzZyjk/?repage";
	}

}