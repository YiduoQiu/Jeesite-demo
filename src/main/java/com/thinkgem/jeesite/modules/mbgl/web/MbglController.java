/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mbgl.web;

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
import com.thinkgem.jeesite.modules.mbgl.entity.Mbgl;
import com.thinkgem.jeesite.modules.mbgl.service.MbglService;

/**
 * 目标管理Controller
 * @author qyd
 * @version 2018-06-22
 */
@Controller
@RequestMapping(value = "${adminPath}/mbgl/mbgl")
public class MbglController extends BaseController {

	@Autowired
	private MbglService mbglService;
	
	@ModelAttribute
	public Mbgl get(@RequestParam(required=false) String id) {
		Mbgl entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = mbglService.get(id);
		}
		if (entity == null){
			entity = new Mbgl();
		}
		return entity;
	}
	
	@RequiresPermissions("mbgl:mbgl:view")
	@RequestMapping(value = {"list", ""})
	public String list(Mbgl mbgl, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Mbgl> page = mbglService.findPage(new Page<Mbgl>(request, response), mbgl); 
		model.addAttribute("page", page);
		return "modules/mbgl/mbglList";
	}

	@RequiresPermissions("mbgl:mbgl:view")
	@RequestMapping(value = "form")
	public String form(Mbgl mbgl, Model model) {
		model.addAttribute("mbgl", mbgl);
		return "modules/mbgl/mbglForm";
	}

	@RequiresPermissions("mbgl:mbgl:edit")
	@RequestMapping(value = "save")
	public String save(Mbgl mbgl, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, mbgl)){
			return form(mbgl, model);
		}
		mbglService.save(mbgl);
		addMessage(redirectAttributes, "保存目标管理成功");
		return "redirect:"+Global.getAdminPath()+"/mbgl/mbgl/?repage";
	}
	
	@RequiresPermissions("mbgl:mbgl:edit")
	@RequestMapping(value = "delete")
	public String delete(Mbgl mbgl, RedirectAttributes redirectAttributes) {
		mbglService.delete(mbgl);
		addMessage(redirectAttributes, "删除目标管理成功");
		return "redirect:"+Global.getAdminPath()+"/mbgl/mbgl/?repage";
	}

}