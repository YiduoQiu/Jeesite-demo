/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqkh.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.aqkh.entity.AqpxPxjh;
import com.thinkgem.jeesite.modules.aqkh.dao.AqpxPxjhDao;

/**
 * 安全考核Service
 * @author qyd
 * @version 2018-07-16
 */
@Service
@Transactional(readOnly = true)
public class AqpxPxjhService extends CrudService<AqpxPxjhDao, AqpxPxjh> {

	public AqpxPxjh get(String id) {
		return super.get(id);
	}
	
	public List<AqpxPxjh> findList(AqpxPxjh aqpxPxjh) {
		return super.findList(aqpxPxjh);
	}
	
	public Page<AqpxPxjh> findPage(Page<AqpxPxjh> page, AqpxPxjh aqpxPxjh) {
		return super.findPage(page, aqpxPxjh);
	}
	
	@Transactional(readOnly = false)
	public void save(AqpxPxjh aqpxPxjh) {
		super.save(aqpxPxjh);
	}
	
	@Transactional(readOnly = false)
	public void delete(AqpxPxjh aqpxPxjh) {
		super.delete(aqpxPxjh);
	}
	
}