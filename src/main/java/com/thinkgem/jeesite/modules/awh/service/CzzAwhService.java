/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.awh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.awh.entity.CzzAwh;
import com.thinkgem.jeesite.modules.awh.dao.CzzAwhDao;
import com.thinkgem.jeesite.modules.awh.entity.CzzAwhDt1;
import com.thinkgem.jeesite.modules.awh.dao.CzzAwhDt1Dao;
import com.thinkgem.jeesite.modules.awh.entity.CzzAwhDt2;
import com.thinkgem.jeesite.modules.awh.dao.CzzAwhDt2Dao;

/**
 * 安委会Service
 * @author qyd
 * @version 2018-08-08
 */
@Service
@Transactional(readOnly = true)
public class CzzAwhService extends CrudService<CzzAwhDao, CzzAwh> {

	@Autowired
	private CzzAwhDt1Dao czzAwhDt1Dao;
	@Autowired
	private CzzAwhDt2Dao czzAwhDt2Dao;
	
	public CzzAwh get(String id) {
		CzzAwh czzAwh = super.get(id);
		czzAwh.setCzzAwhDt1List(czzAwhDt1Dao.findList(new CzzAwhDt1(czzAwh)));
		czzAwh.setCzzAwhDt2List(czzAwhDt2Dao.findList(new CzzAwhDt2(czzAwh)));
		return czzAwh;
	}
	
	public List<CzzAwh> findList(CzzAwh czzAwh) {
		return super.findList(czzAwh);
	}
	
	public Page<CzzAwh> findPage(Page<CzzAwh> page, CzzAwh czzAwh) {
		return super.findPage(page, czzAwh);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzAwh czzAwh) {
		super.save(czzAwh);
		for (CzzAwhDt1 czzAwhDt1 : czzAwh.getCzzAwhDt1List()){
			if (czzAwhDt1.getId() == null){
				continue;
			}
			if (CzzAwhDt1.DEL_FLAG_NORMAL.equals(czzAwhDt1.getDelFlag())){
				if (StringUtils.isBlank(czzAwhDt1.getId())){
					czzAwhDt1.setTestDataMain(czzAwh);
					czzAwhDt1.preInsert();
					czzAwhDt1Dao.insert(czzAwhDt1);
				}else{
					czzAwhDt1.preUpdate();
					czzAwhDt1Dao.update(czzAwhDt1);
				}
			}else{
				czzAwhDt1Dao.delete(czzAwhDt1);
			}
		}
		for (CzzAwhDt2 czzAwhDt2 : czzAwh.getCzzAwhDt2List()){
			if (czzAwhDt2.getId() == null){
				continue;
			}
			if (CzzAwhDt2.DEL_FLAG_NORMAL.equals(czzAwhDt2.getDelFlag())){
				if (StringUtils.isBlank(czzAwhDt2.getId())){
					czzAwhDt2.setTestDataMain(czzAwh);
					czzAwhDt2.preInsert();
					czzAwhDt2Dao.insert(czzAwhDt2);
				}else{
					czzAwhDt2.preUpdate();
					czzAwhDt2Dao.update(czzAwhDt2);
				}
			}else{
				czzAwhDt2Dao.delete(czzAwhDt2);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzAwh czzAwh) {
		super.delete(czzAwh);
		czzAwhDt1Dao.delete(new CzzAwhDt1(czzAwh));
		czzAwhDt2Dao.delete(new CzzAwhDt2(czzAwh));
	}
	
}