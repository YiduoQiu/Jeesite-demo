/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqpx.service.ndpxjh;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.aqpx.entity.ndpxjh.CzzAqpxNdjh;
import com.thinkgem.jeesite.modules.aqpx.dao.ndpxjh.CzzAqpxNdjhDao;

/**
 * 年度培训计划Service
 * @author qyd
 * @version 2019-03-12
 */
@Service
@Transactional(readOnly = true)
public class CzzAqpxNdjhService extends CrudService<CzzAqpxNdjhDao, CzzAqpxNdjh> {

	public CzzAqpxNdjh get(String id) {
		return super.get(id);
	}
	
	public List<CzzAqpxNdjh> findList(CzzAqpxNdjh czzAqpxNdjh) {
		return super.findList(czzAqpxNdjh);
	}
	
	public Page<CzzAqpxNdjh> findPage(Page<CzzAqpxNdjh> page, CzzAqpxNdjh czzAqpxNdjh) {
		return super.findPage(page, czzAqpxNdjh);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzAqpxNdjh czzAqpxNdjh) {
		super.save(czzAqpxNdjh);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzAqpxNdjh czzAqpxNdjh) {
		super.delete(czzAqpxNdjh);
	}
	
}