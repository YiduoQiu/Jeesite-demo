/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqpx.web.ndpxjh;

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
import com.thinkgem.jeesite.modules.aqpx.entity.ndpxjh.CzzAqpxNdjh;
import com.thinkgem.jeesite.modules.aqpx.service.ndpxjh.CzzAqpxNdjhService;

/**
 * 年度培训计划Controller
 * @author qyd
 * @version 2019-03-12
 */
@Controller
@RequestMapping(value = "${adminPath}/aqpx/ndpxjh/czzAqpxNdjh")
public class CzzAqpxNdjhController extends BaseController {

	@Autowired
	private CzzAqpxNdjhService czzAqpxNdjhService;
	
	@ModelAttribute
	public CzzAqpxNdjh get(@RequestParam(required=false) String id) {
		CzzAqpxNdjh entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzAqpxNdjhService.get(id);
		}
		if (entity == null){
			entity = new CzzAqpxNdjh();
		}
		return entity;
	}
	
	@RequiresPermissions("aqpx:ndpxjh:czzAqpxNdjh:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzAqpxNdjh czzAqpxNdjh, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzAqpxNdjh> page = czzAqpxNdjhService.findPage(new Page<CzzAqpxNdjh>(request, response), czzAqpxNdjh); 
		model.addAttribute("page", page);
		return "modules/aqpx/ndpxjh/czzAqpxNdjhList";
	}

	@RequiresPermissions("aqpx:ndpxjh:czzAqpxNdjh:view")
	@RequestMapping(value = "form")
	public String form(CzzAqpxNdjh czzAqpxNdjh, Model model) {
		czzAqpxNdjh.setContent(StringEscapeUtils.unescapeHtml4(czzAqpxNdjh.getContent()));
		model.addAttribute("czzAqpxNdjh", czzAqpxNdjh);
		return "modules/aqpx/ndpxjh/czzAqpxNdjhForm";
	}

	@RequiresPermissions("aqpx:ndpxjh:czzAqpxNdjh:edit")
	@RequestMapping(value = "save")
	public String save(CzzAqpxNdjh czzAqpxNdjh, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzAqpxNdjh)){
			return form(czzAqpxNdjh, model);
		}
		czzAqpxNdjhService.save(czzAqpxNdjh);
		addMessage(redirectAttributes, "保存年度培训计划成功");
		return "redirect:"+Global.getAdminPath()+"/aqpx/ndpxjh/czzAqpxNdjh/?repage";
	}
	
	@RequiresPermissions("aqpx:ndpxjh:czzAqpxNdjh:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzAqpxNdjh czzAqpxNdjh, RedirectAttributes redirectAttributes) {
		czzAqpxNdjhService.delete(czzAqpxNdjh);
		addMessage(redirectAttributes, "删除年度培训计划成功");
		return "redirect:"+Global.getAdminPath()+"/aqpx/ndpxjh/czzAqpxNdjh/?repage";
	}

}