/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqpx.web.pxqk;

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
import com.thinkgem.jeesite.modules.aqpx.entity.pxqk.CzzAqpxPxqk;
import com.thinkgem.jeesite.modules.aqpx.service.pxqk.CzzAqpxPxqkService;

/**
 * 培训情况Controller
 * @author qyd
 * @version 2018-07-20
 */
@Controller
@RequestMapping(value = "${adminPath}/aqpx/pxqk/czzAqpxPxqk")
public class CzzAqpxPxqkController extends BaseController {

	@Autowired
	private CzzAqpxPxqkService czzAqpxPxqkService;
	
	@ModelAttribute
	public CzzAqpxPxqk get(@RequestParam(required=false) String id) {
		CzzAqpxPxqk entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzAqpxPxqkService.get(id);
		}
		if (entity == null){
			entity = new CzzAqpxPxqk();
		}
		return entity;
	}
	
	@RequiresPermissions("aqpx:pxqk:czzAqpxPxqk:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzAqpxPxqk czzAqpxPxqk, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzAqpxPxqk> page = czzAqpxPxqkService.findPage(new Page<CzzAqpxPxqk>(request, response), czzAqpxPxqk); 
		model.addAttribute("page", page);
		return "modules/aqpx/pxqk/czzAqpxPxqkList";
	}

	@RequiresPermissions("aqpx:pxqk:czzAqpxPxqk:view")
	@RequestMapping(value = "form")
	public String form(CzzAqpxPxqk czzAqpxPxqk, Model model) {
		czzAqpxPxqk.setContent(StringEscapeUtils.unescapeHtml4(czzAqpxPxqk.getContent()));
		model.addAttribute("czzAqpxPxqk", czzAqpxPxqk);
		return "modules/aqpx/pxqk/czzAqpxPxqkForm";
	}

	@RequiresPermissions("aqpx:pxqk:czzAqpxPxqk:edit")
	@RequestMapping(value = "save")
	public String save(CzzAqpxPxqk czzAqpxPxqk, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzAqpxPxqk)){
			return form(czzAqpxPxqk, model);
		}
		czzAqpxPxqkService.save(czzAqpxPxqk);
		addMessage(redirectAttributes, "保存培训情况成功");
		return "redirect:"+Global.getAdminPath()+"/aqpx/pxqk/czzAqpxPxqk/?repage";
	}
	
	@RequiresPermissions("aqpx:pxqk:czzAqpxPxqk:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzAqpxPxqk czzAqpxPxqk, RedirectAttributes redirectAttributes) {
		czzAqpxPxqkService.delete(czzAqpxPxqk);
		addMessage(redirectAttributes, "删除培训情况成功");
		return "redirect:"+Global.getAdminPath()+"/aqpx/pxqk/czzAqpxPxqk/?repage";
	}

}