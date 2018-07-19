/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zntx.web;

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
import com.thinkgem.jeesite.modules.zntx.entity.CzzZntx;
import com.thinkgem.jeesite.modules.zntx.service.CzzZntxService;

/**
 * 智能提醒Controller
 * @author qyd
 * @version 2018-07-18
 */
@Controller
@RequestMapping(value = "${adminPath}/zntx/czzZntx")
public class CzzZntxController extends BaseController {

	@Autowired
	private CzzZntxService czzZntxService;
	
	@ModelAttribute
	public CzzZntx get(@RequestParam(required=false) String id) {
		CzzZntx entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzZntxService.get(id);
		}
		if (entity == null){
			entity = new CzzZntx();
		}
		return entity;
	}
	
	@RequiresPermissions("zntx:czzZntx:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzZntx czzZntx, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzZntx> page = czzZntxService.findPage(new Page<CzzZntx>(request, response), czzZntx); 
		model.addAttribute("page", page);
		return "modules/zntx/czzZntxList";
	}

	@RequiresPermissions("zntx:czzZntx:view")
	@RequestMapping(value = "form")
	public String form(CzzZntx czzZntx, Model model) {
		model.addAttribute("czzZntx", czzZntx);
		return "modules/zntx/czzZntxForm";
	}

	@RequiresPermissions("zntx:czzZntx:edit")
	@RequestMapping(value = "save")
	public String save(CzzZntx czzZntx, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzZntx)){
			return form(czzZntx, model);
		}
		czzZntxService.save(czzZntx);
		addMessage(redirectAttributes, "保存该条提醒成功");
		return "redirect:"+Global.getAdminPath()+"/zntx/czzZntx/?repage";
	}
	
	@RequiresPermissions("zntx:czzZntx:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzZntx czzZntx, RedirectAttributes redirectAttributes) {
		czzZntxService.delete(czzZntx);
		addMessage(redirectAttributes, "删除该条提醒成功");
		return "redirect:"+Global.getAdminPath()+"/zntx/czzZntx/?repage";
	}

}