/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zyjk_pj.web;

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
import com.thinkgem.jeesite.modules.zyjk_pj.entity.CzzZyjkPj;
import com.thinkgem.jeesite.modules.zyjk_pj.service.CzzZyjkPjService;
import java.util.List;

/**
 * 职安评价Controller
 * @author qyd
 * @version 2019-03-04
 */
@Controller
@RequestMapping(value = "${adminPath}/zyjk_pj/czzZyjkPj")
public class CzzZyjkPjController extends BaseController {

	@Autowired
	private CzzZyjkPjService czzZyjkPjService;
	
	@ModelAttribute
	public CzzZyjkPj get(@RequestParam(required=false) String id) {
		CzzZyjkPj entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzZyjkPjService.get(id);
		}
		if (entity == null){
			entity = new CzzZyjkPj();
		}
		return entity;
	}
	
	@RequiresPermissions("zyjk_pj:czzZyjkPj:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzZyjkPj czzZyjkPj, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzZyjkPj> page = czzZyjkPjService.findPage(new Page<CzzZyjkPj>(request, response), czzZyjkPj); 
		model.addAttribute("page", page);
		return "modules/zyjk_pj/czzZyjkPjList";
	}

	@RequiresPermissions("zyjk_pj:czzZyjkPj:view")
	@RequestMapping(value = "form")
	public String form(CzzZyjkPj czzZyjkPj, Model model) {
		czzZyjkPj.setContent(StringEscapeUtils.unescapeHtml4(czzZyjkPj.getContent()));
		model.addAttribute("czzZyjkPj", czzZyjkPj);
		return "modules/zyjk_pj/czzZyjkPjForm";
	}

	@RequiresPermissions("zyjk_pj:czzZyjkPj:edit")
	@RequestMapping(value = "save")
	public String save(CzzZyjkPj czzZyjkPj, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzZyjkPj)){
			return form(czzZyjkPj, model);
		}
		czzZyjkPjService.save(czzZyjkPj);
		addMessage(redirectAttributes, "保存职安评价成功");
		return "redirect:"+Global.getAdminPath()+"/zyjk_pj/czzZyjkPj/?repage";
	}
	
	@RequiresPermissions("zyjk_pj:czzZyjkPj:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzZyjkPj czzZyjkPj, RedirectAttributes redirectAttributes) {
		czzZyjkPjService.delete(czzZyjkPj);
		addMessage(redirectAttributes, "删除职安评价成功");
		return "redirect:"+Global.getAdminPath()+"/zyjk_pj/czzZyjkPj/?repage";
	}

}