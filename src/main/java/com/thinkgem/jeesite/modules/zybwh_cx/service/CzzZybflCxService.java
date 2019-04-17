/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zybwh_cx.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.zybwh_cx.entity.CzzZybflCx;
import com.thinkgem.jeesite.modules.zybwh_cx.dao.CzzZybflCxDao;

/**
 * 职业病危害因素分类目录查询Service
 * @author qyd
 * @version 2018-09-17
 */
@Service
@Transactional(readOnly = true)
public class CzzZybflCxService extends CrudService<CzzZybflCxDao, CzzZybflCx> {

	public CzzZybflCx get(String id) {
		return super.get(id);
	}
	
	public List<CzzZybflCx> findList(CzzZybflCx czzZybflCx) {
		return super.findList(czzZybflCx);
	}
	
	public Page<CzzZybflCx> findPage(Page<CzzZybflCx> page, CzzZybflCx czzZybflCx) {
		return super.findPage(page, czzZybflCx);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzZybflCx czzZybflCx) {
		super.save(czzZybflCx);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzZybflCx czzZybflCx) {
		super.delete(czzZybflCx);
	}
	
}