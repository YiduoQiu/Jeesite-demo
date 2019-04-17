/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sssbjc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sssbjc.entity.CzzSssbjc;
import com.thinkgem.jeesite.modules.sssbjc.dao.CzzSssbjcDao;

/**
 * 设施设备安全检查Service
 * @author qyd
 * @version 2019-03-07
 */
@Service
@Transactional(readOnly = true)
public class CzzSssbjcService extends CrudService<CzzSssbjcDao, CzzSssbjc> {

	public CzzSssbjc get(String id) {
		return super.get(id);
	}
	
	public List<CzzSssbjc> findList(CzzSssbjc czzSssbjc) {
		return super.findList(czzSssbjc);
	}
	
	public Page<CzzSssbjc> findPage(Page<CzzSssbjc> page, CzzSssbjc czzSssbjc) {
		return super.findPage(page, czzSssbjc);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzSssbjc czzSssbjc) {
		super.save(czzSssbjc);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzSssbjc czzSssbjc) {
		super.delete(czzSssbjc);
	}
	
}