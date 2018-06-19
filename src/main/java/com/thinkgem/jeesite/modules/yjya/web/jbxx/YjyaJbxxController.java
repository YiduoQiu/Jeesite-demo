/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.yjya.web.jbxx;

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
import com.thinkgem.jeesite.modules.yjya.entity.jbxx.YjyaJbxx;
import com.thinkgem.jeesite.modules.yjya.service.jbxx.YjyaJbxxService;

/**
 * 应急预案_基本信息表生成Controller
 * @author qyd
 * @version 2018-06-15
 */
@Controller
@RequestMapping(value = "${adminPath}/yjya/jbxx/yjyaJbxx")
public class YjyaJbxxController extends BaseController {

	@Autowired
	private YjyaJbxxService yjyaJbxxService;
	
	@ModelAttribute
	public YjyaJbxx get(@RequestParam(required=false) String id) {
		YjyaJbxx entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = yjyaJbxxService.get(id);
		}
		if (entity == null){
			entity = new YjyaJbxx();
		}
		return entity;
	}
	
	@RequiresPermissions("yjya:jbxx:yjyaJbxx:view")
	@RequestMapping(value = {"list", ""})
	public String list(YjyaJbxx yjyaJbxx, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<YjyaJbxx> page = yjyaJbxxService.findPage(new Page<YjyaJbxx>(request, response), yjyaJbxx); 
		model.addAttribute("page", page);
		return "modules/yjya/jbxx/yjyaJbxxList";
	}

	@RequiresPermissions("yjya:jbxx:yjyaJbxx:view")
	@RequestMapping(value = "form")
	public String form(YjyaJbxx yjyaJbxx, Model model) {
		model.addAttribute("yjyaJbxx", yjyaJbxx);
		return "modules/yjya/jbxx/yjyaJbxxForm";
	}

	@RequiresPermissions("yjya:jbxx:yjyaJbxx:edit")
	@RequestMapping(value = "save")
	public String save(YjyaJbxx yjyaJbxx, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, yjyaJbxx)){
			return form(yjyaJbxx, model);
		}
		yjyaJbxxService.save(yjyaJbxx);
		addMessage(redirectAttributes, "保存应急预案_基本信息表成功");
		return "redirect:"+Global.getAdminPath()+"/yjya/jbxx/yjyaJbxx/?repage";
	}
	
	@RequiresPermissions("yjya:jbxx:yjyaJbxx:edit")
	@RequestMapping(value = "delete")
	public String delete(YjyaJbxx yjyaJbxx, RedirectAttributes redirectAttributes) {
		yjyaJbxxService.delete(yjyaJbxx);
		addMessage(redirectAttributes, "删除应急预案_基本信息表成功");
		return "redirect:"+Global.getAdminPath()+"/yjya/jbxx/yjyaJbxx/?repage";
	}

}