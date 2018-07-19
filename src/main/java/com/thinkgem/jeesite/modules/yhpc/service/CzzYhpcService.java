/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.yhpc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.yhpc.entity.CzzYhpc;
import com.thinkgem.jeesite.modules.yhpc.dao.CzzYhpcDao;

/**
 * 隐患排查Service
 * @author qyd
 * @version 2018-07-06
 */
@Service
@Transactional(readOnly = true)
public class CzzYhpcService extends CrudService<CzzYhpcDao, CzzYhpc> {

	public CzzYhpc get(String id) {
		return super.get(id);
	}
	
	public List<CzzYhpc> findList(CzzYhpc czzYhpc) {
		return super.findList(czzYhpc);
	}
	
	public Page<CzzYhpc> findPage(Page<CzzYhpc> page, CzzYhpc czzYhpc) {
		return super.findPage(page, czzYhpc);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzYhpc czzYhpc) {
		super.save(czzYhpc);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzYhpc czzYhpc) {
		super.delete(czzYhpc);
	}
	
}