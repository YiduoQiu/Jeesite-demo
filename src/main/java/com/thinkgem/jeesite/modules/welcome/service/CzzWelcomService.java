/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.welcome.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.welcome.entity.CzzWelcom;
import com.thinkgem.jeesite.modules.welcome.dao.CzzWelcomDao;

/**
 * 欢迎页面Service
 * @author qyd
 * @version 2018-11-20
 */
@Service
@Transactional(readOnly = true)
public class CzzWelcomService extends CrudService<CzzWelcomDao, CzzWelcom> {

	public CzzWelcom get(String id) {
		return super.get(id);
	}
	
	public List<CzzWelcom> findList(CzzWelcom czzWelcom) {
		return super.findList(czzWelcom);
	}
	
	public Page<CzzWelcom> findPage(Page<CzzWelcom> page, CzzWelcom czzWelcom) {
		return super.findPage(page, czzWelcom);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzWelcom czzWelcom) {
		super.save(czzWelcom);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzWelcom czzWelcom) {
		super.delete(czzWelcom);
	}
	
}