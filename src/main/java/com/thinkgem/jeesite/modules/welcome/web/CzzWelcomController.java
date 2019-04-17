/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.welcome.web;

import java.util.Date;

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
import com.thinkgem.jeesite.modules.welcome.entity.CzzWelcom;
import com.thinkgem.jeesite.modules.welcome.service.CzzWelcomService;

/**
 * 欢迎页面Controller
 * @author qyd
 * @version 2018-11-20
 */
@Controller
@RequestMapping(value = "${adminPath}/welcome/czzWelcom")
public class CzzWelcomController extends BaseController {

	@Autowired
	private CzzWelcomService czzWelcomService;
	
	@ModelAttribute
	public CzzWelcom get(@RequestParam(required=false) String id) {
		CzzWelcom entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzWelcomService.get(id);
		}
		if (entity == null){
			entity = new CzzWelcom();
			//进入欢迎页面，若数据库没有此条记录，则新增加一条id为1的空的记录
			id = "1";
			entity.setId(id);
			Date now = new Date();
			entity.setCreateDate(now);
			entity.setIsNewRecord(true);
			czzWelcomService.save(entity);
		}
		return entity;
	}
	
//	@RequiresPermissions("welcome:czzWelcom:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzWelcom czzWelcom, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzWelcom> page = czzWelcomService.findPage(new Page<CzzWelcom>(request, response), czzWelcom); 
		model.addAttribute("page", page);
		return "modules/welcome/czzWelcomList";
	}

//	@RequiresPermissions("welcome:czzWelcom:view")
	@RequestMapping(value = "form")
	public String form(CzzWelcom czzWelcom, Model model) {
		model.addAttribute("czzWelcom", czzWelcom);
		return "modules/welcome/czzWelcomForm";
	}

//	@RequiresPermissions("welcome:czzWelcom:edit")
	@RequestMapping(value = "save")
	public String save(CzzWelcom czzWelcom, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzWelcom)){
			return form(czzWelcom, model);
		}
		czzWelcomService.save(czzWelcom);
		addMessage(redirectAttributes, "保存设置成功");
//		return "redirect:"+Global.getAdminPath()+"/welcome/czzWelcom/?repage";
		return "redirect:"+Global.getAdminPath()+"/welcome/czzWelcom/form?id=1";
	}
	
	@RequiresPermissions("welcome:czzWelcom:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzWelcom czzWelcom, RedirectAttributes redirectAttributes) {
		czzWelcomService.delete(czzWelcom);
		addMessage(redirectAttributes, "删除设置成功");
		return "redirect:"+Global.getAdminPath()+"/welcome/czzWelcom/?repage";
	}

} 