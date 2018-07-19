/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.yjjy.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.yjjy.entity.CzzYjjy;
import com.thinkgem.jeesite.modules.yjjy.dao.CzzYjjyDao;

/**
 * 应急救援Service
 * @author qyd
 * @version 2018-07-04
 */
@Service
@Transactional(readOnly = true)
public class CzzYjjyService extends CrudService<CzzYjjyDao, CzzYjjy> {

	public CzzYjjy get(String id) {
		return super.get(id);
	}
	
	public List<CzzYjjy> findList(CzzYjjy czzYjjy) {
		return super.findList(czzYjjy);
	}
	
	public Page<CzzYjjy> findPage(Page<CzzYjjy> page, CzzYjjy czzYjjy) {
		return super.findPage(page, czzYjjy);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzYjjy czzYjjy) {
		super.save(czzYjjy);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzYjjy czzYjjy) {
		super.delete(czzYjjy);
	}
	
}