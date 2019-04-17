/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zybwh_cx.web;

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
import com.thinkgem.jeesite.modules.zybwh_cx.entity.CzzZybflCx;
import com.thinkgem.jeesite.modules.zybwh_cx.service.CzzZybflCxService;

/**
 * 职业病危害因素分类目录查询Controller
 * @author qyd
 * @version 2018-09-17
 */
@Controller
@RequestMapping(value = "${adminPath}/zybwh_cx/czzZybflCx")
public class CzzZybflCxController extends BaseController {

	@Autowired
	private CzzZybflCxService czzZybflCxService;
	
	@ModelAttribute
	public CzzZybflCx get(@RequestParam(required=false) String id) {
		CzzZybflCx entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzZybflCxService.get(id);
		}
		if (entity == null){
			entity = new CzzZybflCx();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(CzzZybflCx czzZybflCx, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzZybflCx> page = czzZybflCxService.findPage(new Page<CzzZybflCx>(request, response), czzZybflCx); 
		model.addAttribute("page", page);
		return "modules/zybwh_cx/czzZybflCxList";
	}

	@RequestMapping(value = "form")
	public String form(CzzZybflCx czzZybflCx, Model model) {
		model.addAttribute("czzZybflCx", czzZybflCx);
		return "modules/zybwh_cx/czzZybflCxForm";
	}

	@RequiresPermissions("zybwh_cx:czzZybflCx:edit")
	@RequestMapping(value = "save")
	public String save(CzzZybflCx czzZybflCx, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzZybflCx)){
			return form(czzZybflCx, model);
		}
		czzZybflCxService.save(czzZybflCx);
		addMessage(redirectAttributes, "保存职业病危害因素分类目录查询成功");
		return "redirect:"+Global.getAdminPath()+"/zybwh_cx/czzZybflCx/?repage";
	}
	
	@RequiresPermissions("zybwh_cx:czzZybflCx:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzZybflCx czzZybflCx, RedirectAttributes redirectAttributes) {
		czzZybflCxService.delete(czzZybflCx);
		addMessage(redirectAttributes, "删除职业病危害因素分类目录查询成功");
		return "redirect:"+Global.getAdminPath()+"/zybwh_cx/czzZybflCx/?repage";
	}

}