/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.yhpcys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.yhpcys.entity.CzzYhpcYs;
import com.thinkgem.jeesite.modules.yhpcys.dao.CzzYhpcYsDao;

/**
 * 隐患排查验收Service
 * @author qyd
 * @version 2018-07-06
 */
@Service
@Transactional(readOnly = true)
public class CzzYhpcYsService extends CrudService<CzzYhpcYsDao, CzzYhpcYs> {

	public CzzYhpcYs get(String id) {
		return super.get(id);
	}
	
	public List<CzzYhpcYs> findList(CzzYhpcYs czzYhpcYs) {
		return super.findList(czzYhpcYs);
	}
	
	public Page<CzzYhpcYs> findPage(Page<CzzYhpcYs> page, CzzYhpcYs czzYhpcYs) {
		return super.findPage(page, czzYhpcYs);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzYhpcYs czzYhpcYs) {
		super.save(czzYhpcYs);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzYhpcYs czzYhpcYs) {
		super.delete(czzYhpcYs);
	}
	
}