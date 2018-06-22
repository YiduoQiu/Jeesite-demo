/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mbgl.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.mbgl.entity.Mbgl;
import com.thinkgem.jeesite.modules.mbgl.dao.MbglDao;

/**
 * 目标管理Service
 * @author qyd
 * @version 2018-06-22
 */
@Service
@Transactional(readOnly = true)
public class MbglService extends CrudService<MbglDao, Mbgl> {

	public Mbgl get(String id) {
		return super.get(id);
	}
	
	public List<Mbgl> findList(Mbgl mbgl) {
		return super.findList(mbgl);
	}
	
	public Page<Mbgl> findPage(Page<Mbgl> page, Mbgl mbgl) {
		return super.findPage(page, mbgl);
	}
	
	@Transactional(readOnly = false)
	public void save(Mbgl mbgl) {
		super.save(mbgl);
	}
	
	@Transactional(readOnly = false)
	public void delete(Mbgl mbgl) {
		super.delete(mbgl);
	}
	
}