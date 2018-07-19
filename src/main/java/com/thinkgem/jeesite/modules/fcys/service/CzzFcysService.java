/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.fcys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.fcys.entity.CzzFcys;
import com.thinkgem.jeesite.modules.fcys.dao.CzzFcysDao;

/**
 * 复查验收Service
 * @author qyd
 * @version 2018-07-06
 */
@Service
@Transactional(readOnly = true)
public class CzzFcysService extends CrudService<CzzFcysDao, CzzFcys> {

	public CzzFcys get(String id) {
		return super.get(id);
	}
	
	public List<CzzFcys> findList(CzzFcys czzFcys) {
		return super.findList(czzFcys);
	}
	
	public Page<CzzFcys> findPage(Page<CzzFcys> page, CzzFcys czzFcys) {
		return super.findPage(page, czzFcys);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzFcys czzFcys) {
		super.save(czzFcys);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzFcys czzFcys) {
		super.delete(czzFcys);
	}
	
}