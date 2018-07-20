/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqpx.web.khqk;

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
import com.thinkgem.jeesite.modules.aqpx.entity.khqk.CzzAqpxKhqk;
import com.thinkgem.jeesite.modules.aqpx.service.khqk.CzzAqpxKhqkService;

/**
 * 安全培训_考核情况Controller
 * @author qyd
 * @version 2018-07-20
 */
@Controller
@RequestMapping(value = "${adminPath}/aqpx/khqk/czzAqpxKhqk")
public class CzzAqpxKhqkController extends BaseController {

	@Autowired
	private CzzAqpxKhqkService czzAqpxKhqkService;
	
	@ModelAttribute
	public CzzAqpxKhqk get(@RequestParam(required=false) String id) {
		CzzAqpxKhqk entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzAqpxKhqkService.get(id);
		}
		if (entity == null){
			entity = new CzzAqpxKhqk();
		}
		return entity;
	}
	
	@RequiresPermissions("aqpx:khqk:czzAqpxKhqk:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzAqpxKhqk czzAqpxKhqk, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzAqpxKhqk> page = czzAqpxKhqkService.findPage(new Page<CzzAqpxKhqk>(request, response), czzAqpxKhqk); 
		model.addAttribute("page", page);
		return "modules/aqpx/khqk/czzAqpxKhqkList";
	}

	@RequiresPermissions("aqpx:khqk:czzAqpxKhqk:view")
	@RequestMapping(value = "form")
	public String form(CzzAqpxKhqk czzAqpxKhqk, Model model) {
		model.addAttribute("czzAqpxKhqk", czzAqpxKhqk);
		return "modules/aqpx/khqk/czzAqpxKhqkForm";
	}

	@RequiresPermissions("aqpx:khqk:czzAqpxKhqk:edit")
	@RequestMapping(value = "save")
	public String save(CzzAqpxKhqk czzAqpxKhqk, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzAqpxKhqk)){
			return form(czzAqpxKhqk, model);
		}
		czzAqpxKhqkService.save(czzAqpxKhqk);
		addMessage(redirectAttributes, "保存考核情况成功");
		return "redirect:"+Global.getAdminPath()+"/aqpx/khqk/czzAqpxKhqk/?repage";
	}
	
	@RequiresPermissions("aqpx:khqk:czzAqpxKhqk:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzAqpxKhqk czzAqpxKhqk, RedirectAttributes redirectAttributes) {
		czzAqpxKhqkService.delete(czzAqpxKhqk);
		addMessage(redirectAttributes, "删除考核情况成功");
		return "redirect:"+Global.getAdminPath()+"/aqpx/khqk/czzAqpxKhqk/?repage";
	}

}