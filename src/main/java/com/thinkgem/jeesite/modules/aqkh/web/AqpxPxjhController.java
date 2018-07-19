/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqkh.web;

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
import com.thinkgem.jeesite.modules.aqkh.entity.AqpxPxjh;
import com.thinkgem.jeesite.modules.aqkh.service.AqpxPxjhService;

/**
 * 安全考核Controller
 * @author qyd
 * @version 2018-07-16
 */
@Controller
@RequestMapping(value = "${adminPath}/aqkh/aqpxPxjh")
public class AqpxPxjhController extends BaseController {

	@Autowired
	private AqpxPxjhService aqpxPxjhService;
	
	@ModelAttribute
	public AqpxPxjh get(@RequestParam(required=false) String id) {
		AqpxPxjh entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = aqpxPxjhService.get(id);
		}
		if (entity == null){
			entity = new AqpxPxjh();
		}
		return entity;
	}
	
	@RequiresPermissions("aqkh:aqpxPxjh:view")
	@RequestMapping(value = {"list", ""})
	public String list(AqpxPxjh aqpxPxjh, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AqpxPxjh> page = aqpxPxjhService.findPage(new Page<AqpxPxjh>(request, response), aqpxPxjh); 
		model.addAttribute("page", page);
		return "modules/aqkh/aqpxPxjhList";
	}

	@RequiresPermissions("aqkh:aqpxPxjh:view")
	@RequestMapping(value = "form")
	public String form(AqpxPxjh aqpxPxjh, Model model) {
		model.addAttribute("aqpxPxjh", aqpxPxjh);
		return "modules/aqkh/aqpxPxjhForm";
	}

	@RequiresPermissions("aqkh:aqpxPxjh:edit")
	@RequestMapping(value = "save")
	public String save(AqpxPxjh aqpxPxjh, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, aqpxPxjh)){
			return form(aqpxPxjh, model);
		}
		aqpxPxjhService.save(aqpxPxjh);
		addMessage(redirectAttributes, "保存安全考核成功");
		return "redirect:"+Global.getAdminPath()+"/aqkh/aqpxPxjh/?repage";
	}
	
	@RequiresPermissions("aqkh:aqpxPxjh:edit")
	@RequestMapping(value = "delete")
	public String delete(AqpxPxjh aqpxPxjh, RedirectAttributes redirectAttributes) {
		aqpxPxjhService.delete(aqpxPxjh);
		addMessage(redirectAttributes, "删除安全考核成功");
		return "redirect:"+Global.getAdminPath()+"/aqkh/aqpxPxjh/?repage";
	}

}