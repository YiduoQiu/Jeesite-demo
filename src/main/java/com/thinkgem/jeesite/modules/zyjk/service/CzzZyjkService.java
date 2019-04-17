/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zyjk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.zyjk.entity.CzzZyjk;
import com.thinkgem.jeesite.modules.zyjk.dao.CzzZyjkDao;
import com.thinkgem.jeesite.modules.zyjk.entity.CzzZyjkDt1;
import com.thinkgem.jeesite.modules.zyjk.dao.CzzZyjkDt1Dao;

/**
 * 职业健康Service
 * @author qyd
 * @version 2018-12-17
 */
@Service
@Transactional(readOnly = true)
public class CzzZyjkService extends CrudService<CzzZyjkDao, CzzZyjk> {

	@Autowired
	private CzzZyjkDt1Dao czzZyjkDt1Dao;
	
	public CzzZyjk get(String id) {
		CzzZyjk czzZyjk = super.get(id);
		czzZyjk.setCzzZyjkDt1List(czzZyjkDt1Dao.findList(new CzzZyjkDt1(czzZyjk)));
		return czzZyjk;
	}
	
	public List<CzzZyjk> findList(CzzZyjk czzZyjk) {
		return super.findList(czzZyjk);
	}
	
	public Page<CzzZyjk> findPage(Page<CzzZyjk> page, CzzZyjk czzZyjk) {
		return super.findPage(page, czzZyjk);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzZyjk czzZyjk) {
		super.save(czzZyjk);
		for (CzzZyjkDt1 czzZyjkDt1 : czzZyjk.getCzzZyjkDt1List()){
			if (czzZyjkDt1.getId() == null){
				continue;
			}
			if (CzzZyjkDt1.DEL_FLAG_NORMAL.equals(czzZyjkDt1.getDelFlag())){
				if (StringUtils.isBlank(czzZyjkDt1.getId())){
					czzZyjkDt1.setTestDataMain(czzZyjk);
					czzZyjkDt1.preInsert();
					czzZyjkDt1Dao.insert(czzZyjkDt1);
				}else{
					czzZyjkDt1.preUpdate();
					czzZyjkDt1Dao.update(czzZyjkDt1);
				}
			}else{
				czzZyjkDt1Dao.delete(czzZyjkDt1);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzZyjk czzZyjk) {
		super.delete(czzZyjk);
		czzZyjkDt1Dao.delete(new CzzZyjkDt1(czzZyjk));
	}
	
}