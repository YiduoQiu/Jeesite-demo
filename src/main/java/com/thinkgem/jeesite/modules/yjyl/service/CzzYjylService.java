/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.yjyl.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.yjyl.entity.CzzYjyl;
import com.thinkgem.jeesite.modules.yjyl.dao.CzzYjylDao;

/**
 * 应急演练Service
 * @author qyd
 * @version 2018-08-08
 */
@Service
@Transactional(readOnly = true)
public class CzzYjylService extends CrudService<CzzYjylDao, CzzYjyl> {

	public CzzYjyl get(String id) {
		return super.get(id);
	}
	
	public List<CzzYjyl> findList(CzzYjyl czzYjyl) {
		return super.findList(czzYjyl);
	}
	
	public Page<CzzYjyl> findPage(Page<CzzYjyl> page, CzzYjyl czzYjyl) {
		return super.findPage(page, czzYjyl);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzYjyl czzYjyl) {
		super.save(czzYjyl);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzYjyl czzYjyl) {
		super.delete(czzYjyl);
	}
	
}