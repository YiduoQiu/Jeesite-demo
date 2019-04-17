/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqsgbg.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.aqsgbg.entity.CzzAqsgbg;
import com.thinkgem.jeesite.modules.aqkh.entity.CzzAqkh;
import com.thinkgem.jeesite.modules.aqsgbg.dao.CzzAqsgbgDao;

/**
 * DROP TABLE IF EXISTS czz_aqsgbg;Service
 * @author qyd
 * @version 2018-08-13
 */
@Service
@Transactional(readOnly = true)
public class CzzAqsgbgService extends CrudService<CzzAqsgbgDao, CzzAqsgbg> {

	public CzzAqsgbg get(String id) {
		return super.get(id);
	}
	
	public List<CzzAqsgbg> findList(CzzAqsgbg czzAqsgbg) {
		return super.findList(czzAqsgbg);
	}
	
	public Page<CzzAqsgbg> findPage(Page<CzzAqsgbg> page, CzzAqsgbg czzAqsgbg) {
		return super.findPage(page, czzAqsgbg);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzAqsgbg czzAqsgbg) {
		super.save(czzAqsgbg);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzAqsgbg czzAqsgbg) {
		super.delete(czzAqsgbg);
	}
	
	//统计报表用
//	public int firstCount(CzzAqsgbg czzAqsgbg) {
//		return super.firstCount(czzAqsgbg);
//	}
//	public int secondCount(CzzAqsgbg czzAqsgbg) {
//		return super.secondCount(czzAqsgbg);
//	}
	
}