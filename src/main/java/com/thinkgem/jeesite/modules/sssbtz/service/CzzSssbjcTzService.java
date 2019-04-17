/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sssbtz.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sssbtz.entity.CzzSssbjcTz;
import com.thinkgem.jeesite.modules.sssbtz.dao.CzzSssbjcTzDao;

/**
 * 设施设备台账Service
 * @author qyd
 * @version 2018-09-17
 */
@Service
@Transactional(readOnly = true)
public class CzzSssbjcTzService extends CrudService<CzzSssbjcTzDao, CzzSssbjcTz> {

	public CzzSssbjcTz get(String id) {
		return super.get(id);
	}
	
	public List<CzzSssbjcTz> findList(CzzSssbjcTz czzSssbjcTz) {
		return super.findList(czzSssbjcTz);
	}
	
	public Page<CzzSssbjcTz> findPage(Page<CzzSssbjcTz> page, CzzSssbjcTz czzSssbjcTz) {
		return super.findPage(page, czzSssbjcTz);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzSssbjcTz czzSssbjcTz) {
		super.save(czzSssbjcTz);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzSssbjcTz czzSssbjcTz) {
		super.delete(czzSssbjcTz);
	}
	
}