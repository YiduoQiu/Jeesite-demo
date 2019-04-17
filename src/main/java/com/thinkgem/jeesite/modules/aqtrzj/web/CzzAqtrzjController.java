package com.thinkgem.jeesite.modules.aqtrzj.web;

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
import com.thinkgem.jeesite.modules.aqtrzj.entity.CzzAqtrzj;
import com.thinkgem.jeesite.modules.aqtrzj.service.CzzAqtrzjService;

/**
 * 安全投入资金计划Controller
 * @author qyd
 * @version 2018-08-27
 */
@Controller
@RequestMapping(value = "${adminPath}/aqtrzj/czzAqtrzj")
public class CzzAqtrzjController extends BaseController {

	@Autowired
	private CzzAqtrzjService czzAqtrzjService;
	
	@ModelAttribute
	public CzzAqtrzj get(@RequestParam(required=false) String id) {
		CzzAqtrzj entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzAqtrzjService.get(id);
		}
		if (entity == null){
			entity = new CzzAqtrzj();
		}
		return entity;
	}
	
	@RequiresPermissions("aqtrzj:czzAqtrzj:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzAqtrzj czzAqtrzj, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzAqtrzj> page = czzAqtrzjService.findPage(new Page<CzzAqtrzj>(request, response), czzAqtrzj); 
		model.addAttribute("page", page);
		return "modules/aqtrzj/czzAqtrzjList";
	}

	@RequiresPermissions("aqtrzj:czzAqtrzj:view")
	@RequestMapping(value = "form")
	public String form(CzzAqtrzj czzAqtrzj, Model model) {
		model.addAttribute("czzAqtrzj", czzAqtrzj);
		return "modules/aqtrzj/czzAqtrzjForm";
	}
	
	@RequiresPermissions("aqtrzj:czzAqtrzj:edit")
	@RequestMapping(value = "save")
	public String save(CzzAqtrzj czzAqtrzj, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzAqtrzj)){
			return form(czzAqtrzj, model);
		}
		czzAqtrzjService.save(czzAqtrzj);
		addMessage(redirectAttributes, "保存安全投入资金计划成功");
		return "redirect:"+Global.getAdminPath()+"/aqtrzj/czzAqtrzj/?repage";
	}
	
	@RequiresPermissions("aqtrzj:czzAqtrzj:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzAqtrzj czzAqtrzj, RedirectAttributes redirectAttributes) {
		czzAqtrzjService.delete(czzAqtrzj);
		addMessage(redirectAttributes, "删除安全投入资金计划成功");
		return "redirect:"+Global.getAdminPath()+"/aqtrzj/czzAqtrzj/?repage";
	}

}