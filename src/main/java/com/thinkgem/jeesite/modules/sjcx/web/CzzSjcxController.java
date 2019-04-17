/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sjcx.web;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.aqkh.entity.CzzAqkh;
import com.thinkgem.jeesite.modules.aqkh.service.CzzAqkhService;
import com.thinkgem.jeesite.modules.aqsgbg.entity.CzzAqsgbg;
import com.thinkgem.jeesite.modules.aqsgbg.service.CzzAqsgbgService;
import com.thinkgem.jeesite.modules.sjcx.entity.CzzSjcx;
import com.thinkgem.jeesite.modules.sjcx.service.CzzSjcxService;
import com.thinkgem.jeesite.modules.wxygl.entity.CzzWxygl;
import com.thinkgem.jeesite.modules.wxygl.service.CzzWxyglService;
import com.thinkgem.jeesite.modules.yhpc.entity.CzzYhpc;
import com.thinkgem.jeesite.modules.yhpc.service.CzzYhpcService;
import com.thinkgem.jeesite.modules.zyaq.entity.CzzZyaq;
import com.thinkgem.jeesite.modules.zyaq.service.CzzZyaqService;

/**
 * 数据查询Controller
 * @author qyd
 * @version 2018-11-19
 */
@Controller
@RequestMapping(value = "${adminPath}/sjcx/czzSjcx")
public class CzzSjcxController extends BaseController {

	@Autowired
	private CzzSjcxService czzSjcxService;
	@Autowired
	private CzzAqkhService czzAqkhService;
	@Autowired
	private CzzAqsgbgService czzAqsgbgService;
	@Autowired
	private CzzWxyglService czzWxyglService;
	@Autowired
	private CzzYhpcService czzYhpcService;
	@Autowired
	private CzzZyaqService czzZyaqService;
	
  /**安全检查报表统计
   *
   * @param czzSjcx
   * @return ModelAndView()
   */
  @RequiresPermissions("sjcx:czzSjcx:show")
  @RequestMapping(value = "countdata")
  public ModelAndView countaqjc(CzzSjcx czzSjcx,CzzAqkh czzAqkh,CzzAqsgbg czzAqsgbg,CzzWxygl czzWxygl,CzzYhpc czzYhpc,CzzZyaq czzZyaq) {
	  List countList = new ArrayList<>();
	  //安全检查管理
	  List countAqjc = new ArrayList<>();

      int countzx00 = czzSjcxService.countzx00(czzSjcx);
      int countzx01 = czzSjcxService.countzx01(czzSjcx);
      int countqm10 = czzSjcxService.countqm10(czzSjcx);
      int countqm11 = czzSjcxService.countqm11(czzSjcx);
      int countqm20 = czzSjcxService.countqm20(czzSjcx);
      int countqm21 = czzSjcxService.countqm21(czzSjcx);
      int countqm30 = czzSjcxService.countqm30(czzSjcx);
      int countqm31 = czzSjcxService.countqm31(czzSjcx);
      int countqm40 = czzSjcxService.countqm40(czzSjcx);
      int countqm41 = czzSjcxService.countqm41(czzSjcx);
      int total0 = countzx00 + countzx01;
      int total1 = countqm10 + countqm11;
      int total2 = countqm20 + countqm21;
      int total3 = countqm30 + countqm31;
      int total4 = countqm40 + countqm41;
      
      countAqjc.add(total0);
      countAqjc.add(countzx00);
      countAqjc.add(countzx01);
      countAqjc.add(total1);
      countAqjc.add(countqm10);
      countAqjc.add(countqm11);
      countAqjc.add(total2);
      countAqjc.add(countqm20);
      countAqjc.add(countqm21);
      countAqjc.add(total3);
      countAqjc.add(countqm30);
      countAqjc.add(countqm31);
      countAqjc.add(total4);
      countAqjc.add(countqm40);
      countAqjc.add(countqm41);
      countList.add(countAqjc);
      //安全考核
      czzAqkh.setBeginDate(czzSjcx.getBeginDate());
      czzAqkh.setEndDate(czzSjcx.getEndDate());
      List countAqkh = new ArrayList<>();
      int countkh00 = czzAqkhService.firstCount(czzAqkh);
      int countkh01 = czzAqkhService.secondCount(czzAqkh);
      int countkh02 = czzAqkhService.thirdCount(czzAqkh);
      int countkh03 = czzAqkhService.fourthCount(czzAqkh);
      int countkh04 = czzAqkhService.fifthCount(czzAqkh);
      int countkh05 = czzAqkhService.sixthCount(czzAqkh);
      int countkh06 = czzAqkhService.seventhCount(czzAqkh);
      int totalKh = countkh00 + countkh01 + countkh02 + countkh03 + countkh04 + countkh05 + countkh06;
      countAqkh.add(totalKh);
      countAqkh.add(countkh00);
      countAqkh.add(countkh01);
      countAqkh.add(countkh02);
      countAqkh.add(countkh03);
      countAqkh.add(countkh04);
      countAqkh.add(countkh05);
      countAqkh.add(countkh06);
      countList.add(countAqkh);
      //安全事故报告
      czzAqsgbg.setBeginDate(czzSjcx.getBeginDate());
      czzAqsgbg.setEndDate(czzSjcx.getEndDate());
      List countAqsg = new ArrayList<>();
      int countsg00 = czzAqsgbgService.firstCount(czzAqsgbg);
      int countsg01 = czzAqsgbgService.secondCount(czzAqsgbg);
      int totalSg = countsg00 + countsg01;
      countAqsg.add(totalSg);
      countAqsg.add(countsg00);
      countAqsg.add(countsg01);
      countList.add(countAqsg);
      //危险源管理
//      int countgl00 = czzWxyglService.firstCount(czzWxygl);
//      int countgl01 = czzWxyglService.secondCount(czzWxygl);
//      countList.add(countgl00);
//      countList.add(countgl01);
      //隐患排查
      czzYhpc.setBeginDate(czzSjcx.getBeginDate());
      czzYhpc.setEndDate(czzSjcx.getEndDate());
      List countYhpc = new ArrayList<>();
      int firstCount = czzYhpcService.firstCount(czzYhpc);
	  int secondCount = czzYhpcService.secondCount(czzYhpc);
	  int thirdCount = czzYhpcService.thirdCount(czzYhpc);
	  int fourthCount = czzYhpcService.fourthCount(czzYhpc);
	  int totalYh00 = firstCount + secondCount;
	  int totalYh01 = thirdCount + fourthCount;
	  countYhpc.add(totalYh00);
	  countYhpc.add(firstCount);
	  countYhpc.add(secondCount);
	  countYhpc.add(totalYh01);
	  countYhpc.add(thirdCount);
	  countYhpc.add(fourthCount);
	  countList.add(countYhpc);
	  //作业安全
	  czzZyaq.setBeginDate(czzSjcx.getBeginDate());
	  czzZyaq.setEndDate(czzSjcx.getEndDate());
	  List countZyaq = new ArrayList<>();
	  int countzy00 = czzZyaqService.firstCount(czzZyaq);
	  int countzy01 = czzZyaqService.secondCount(czzZyaq);
	  int countzy02 = czzZyaqService.thirdCount(czzZyaq);
      int countzy03 = czzZyaqService.fourthCount(czzZyaq);
      int countzy04 = czzZyaqService.fifthCount(czzZyaq);
      int countzy05 = czzZyaqService.sixthCount(czzZyaq);
      int totalZy = countzy00 + countzy01 + countzy02 + countzy03 + countzy04 + countzy05;
      countZyaq.add(totalZy);
      countZyaq.add(countzy00);
      countZyaq.add(countzy01);
      countZyaq.add(countzy02);
      countZyaq.add(countzy03);
      countZyaq.add(countzy04);
      countZyaq.add(countzy05);
      countList.add(countZyaq);
      return new ModelAndView("modules/aqjc/czzAqjcCount","count",countList);
  }
}