/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.ckwz.web;

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
import com.thinkgem.jeesite.modules.ckwz.entity.CkwzMain;
import com.thinkgem.jeesite.modules.ckwz.service.CkwzMainService;

/**
 * 仓库物资管理Controller
 * @author qyd
 * @version 2018-06-22
 */
@Controller
@RequestMapping(value = "${adminPath}/ckwz/ckwzMain")
public class CkwzMainController extends BaseController {

	@Autowired
	private CkwzMainService ckwzMainService;
	
	@ModelAttribute
	public CkwzMain get(@RequestParam(required=false) String id) {
		CkwzMain entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = ckwzMainService.get(id);
		}
		if (entity == null){
			entity = new CkwzMain();
		}
		return entity;
	}
	
	@RequiresPermissions("ckwz:ckwzMain:view")
	@RequestMapping(value = {"list", ""})
	public String list(CkwzMain ckwzMain, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CkwzMain> page = ckwzMainService.findPage(new Page<CkwzMain>(request, response), ckwzMain); 
		model.addAttribute("page", page);
		return "modules/ckwz/ckwzMainList";
	}

	@RequiresPermissions("ckwz:ckwzMain:view")
	@RequestMapping(value = "form")
	public String form(CkwzMain ckwzMain, Model model) {
		model.addAttribute("ckwzMain", ckwzMain);
		return "modules/ckwz/ckwzMainForm";
	}

	@RequiresPermissions("ckwz:ckwzMain:edit")
	@RequestMapping(value = "save")
	public String save(CkwzMain ckwzMain, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, ckwzMain)){
			return form(ckwzMain, model);
		}
		ckwzMainService.save(ckwzMain);
		addMessage(redirectAttributes, "保存仓库物资管理成功");
		return "redirect:"+Global.getAdminPath()+"/ckwz/ckwzMain/?repage";
	}
	
	@RequiresPermissions("ckwz:ckwzMain:edit")
	@RequestMapping(value = "delete")
	public String delete(CkwzMain ckwzMain, RedirectAttributes redirectAttributes) {
		ckwzMainService.delete(ckwzMain);
		addMessage(redirectAttributes, "删除仓库物资管理成功");
		return "redirect:"+Global.getAdminPath()+"/ckwz/ckwzMain/?repage";
	}

}