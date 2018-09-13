/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.yhpczd.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.yhpczd.entity.CzzYhpcXgzd;
import com.thinkgem.jeesite.modules.yhpczd.dao.CzzYhpcXgzdDao;

/**
 * 隐患排查相关制度Service
 * @author qyd
 * @version 2018-09-13
 */
@Service
@Transactional(readOnly = true)
public class CzzYhpcXgzdService extends CrudService<CzzYhpcXgzdDao, CzzYhpcXgzd> {

	public CzzYhpcXgzd get(String id) {
		return super.get(id);
	}
	
	public List<CzzYhpcXgzd> findList(CzzYhpcXgzd czzYhpcXgzd) {
		return super.findList(czzYhpcXgzd);
	}
	
	public Page<CzzYhpcXgzd> findPage(Page<CzzYhpcXgzd> page, CzzYhpcXgzd czzYhpcXgzd) {
		return super.findPage(page, czzYhpcXgzd);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzYhpcXgzd czzYhpcXgzd) {
		super.save(czzYhpcXgzd);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzYhpcXgzd czzYhpcXgzd) {
		super.delete(czzYhpcXgzd);
	}
	
}