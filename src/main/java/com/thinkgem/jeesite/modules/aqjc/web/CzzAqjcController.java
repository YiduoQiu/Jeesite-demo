/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqjc.web;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.aqjc.entity.CzzAqjc;
import com.thinkgem.jeesite.modules.aqjc.service.CzzAqjcService;

/**
 * 安全检查Controller
 * @author qyd
 * @version 2018-07-06
 */
@Controller
@RequestMapping(value = "${adminPath}/aqjc/czzAqjc")
public class CzzAqjcController extends BaseController {

	@Autowired
	private CzzAqjcService czzAqjcService;
	
	@ModelAttribute
	public CzzAqjc get(@RequestParam(required=false) String id) {
		CzzAqjc entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = czzAqjcService.get(id);
		}
		if (entity == null){
			entity = new CzzAqjc();
		}
		return entity;
	}
	
	@RequiresPermissions("aqjc:czzAqjc:view")
	@RequestMapping(value = {"list", ""})
	public String list(CzzAqjc czzAqjc, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CzzAqjc> page = czzAqjcService.findPage(new Page<CzzAqjc>(request, response), czzAqjc); 
		model.addAttribute("page", page);
		return "modules/aqjc/czzAqjcList";
	}

	@RequiresPermissions("aqjc:czzAqjc:view")
	@RequestMapping(value = "form")
	public String form(CzzAqjc czzAqjc, Model model) {
		czzAqjc.setCheckcontent(StringEscapeUtils.unescapeHtml4(czzAqjc.getCheckcontent()));
		czzAqjc.setProblem(StringEscapeUtils.unescapeHtml4(czzAqjc.getProblem()));
		czzAqjc.setRequirements(StringEscapeUtils.unescapeHtml4(czzAqjc.getRequirements()));
		czzAqjc.setCorrectacction(StringEscapeUtils.unescapeHtml4(czzAqjc.getCorrectacction()));
		model.addAttribute("czzAqjc", czzAqjc);
		return "modules/aqjc/czzAqjcForm";
	}

	@RequiresPermissions("aqjc:czzAqjc:edit")
	@RequestMapping(value = "save")
	public String save(CzzAqjc czzAqjc, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, czzAqjc)){
			return form(czzAqjc, model);
		}
		czzAqjcService.save(czzAqjc);
		addMessage(redirectAttributes, "保存安全检查成功");
		return "redirect:"+Global.getAdminPath()+"/aqjc/czzAqjc/?repage";
	}
	
	@RequiresPermissions("aqjc:czzAqjc:edit")
	@RequestMapping(value = "delete")
	public String delete(CzzAqjc czzAqjc, RedirectAttributes redirectAttributes) {
		czzAqjcService.delete(czzAqjc);
		addMessage(redirectAttributes, "删除安全检查成功");
		return "redirect:"+Global.getAdminPath()+"/aqjc/czzAqjc/?repage";
	}
	
//  /**安全检查报表统计

  /**
   *
   * @param czzAqjc
   * @return
   */
  @RequiresPermissions("aqjc:czzAqjc:show")
  @RequestMapping(value = "countaqjc")
//  public List countaqjc(CzzAqjc czzAqjc) {
//	  List list = new ArrayList<>();
//      int countzx00 = czzAqjcService.countzx00(czzAqjc);
//      int countzx01 = czzAqjcService.countzx01(czzAqjc);
//      int countqm10 = czzAqjcService.countqm10(czzAqjc);
//      int countqm11 = czzAqjcService.countqm11(czzAqjc);
//	  list.add(countzx00);
//      list.add(countzx01);
//      list.add(countqm10);
//      list.add(countqm11);
//      return list;
//  }

  public ModelAndView countaqjc(CzzAqjc czzAqjc) {
	  List countList = new ArrayList<>();
      int countzx00 = czzAqjcService.countzx00(czzAqjc);
      int countzx01 = czzAqjcService.countzx01(czzAqjc);
      int countqm10 = czzAqjcService.countqm10(czzAqjc);
      int countqm11 = czzAqjcService.countqm11(czzAqjc);
      countList.add(countzx00);
      countList.add(countzx01);
      countList.add(countqm10);
      countList.add(countqm11);
      return new ModelAndView("modules/aqjc/czzAqjcCount","count",countList);
//      return list;
  }
}