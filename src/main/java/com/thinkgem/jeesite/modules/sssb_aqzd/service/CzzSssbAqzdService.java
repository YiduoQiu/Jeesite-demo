/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sssb_aqzd.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sssb_aqzd.entity.CzzSssbAqzd;
import com.thinkgem.jeesite.modules.sssb_aqzd.dao.CzzSssbAqzdDao;

/**
 * 设备安全制度Service
 * @author qyd
 * @version 2019-03-20
 */
@Service
@Transactional(readOnly = true)
public class CzzSssbAqzdService extends CrudService<CzzSssbAqzdDao, CzzSssbAqzd> {

	public CzzSssbAqzd get(String id) {
		return super.get(id);
	}
	
	public List<CzzSssbAqzd> findList(CzzSssbAqzd czzSssbAqzd) {
		return super.findList(czzSssbAqzd);
	}
	
	public Page<CzzSssbAqzd> findPage(Page<CzzSssbAqzd> page, CzzSssbAqzd czzSssbAqzd) {
		return super.findPage(page, czzSssbAqzd);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzSssbAqzd czzSssbAqzd) {
		super.save(czzSssbAqzd);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzSssbAqzd czzSssbAqzd) {
		super.delete(czzSssbAqzd);
	}
	
}