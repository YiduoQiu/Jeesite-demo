/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqpx.service.khqk;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.aqpx.entity.khqk.CzzAqpxKhqk;
import com.thinkgem.jeesite.modules.aqpx.dao.khqk.CzzAqpxKhqkDao;
import com.thinkgem.jeesite.modules.aqpx.entity.khqk.CzzAqpxKhqkdt1;
import com.thinkgem.jeesite.modules.aqpx.dao.khqk.CzzAqpxKhqkdt1Dao;

/**
 * 安全培训_考核情况Service
 * @author qyd
 * @version 2018-07-20
 */
@Service
@Transactional(readOnly = true)
public class CzzAqpxKhqkService extends CrudService<CzzAqpxKhqkDao, CzzAqpxKhqk> {

	@Autowired
	private CzzAqpxKhqkdt1Dao czzAqpxKhqkdt1Dao;
	
	public CzzAqpxKhqk get(String id) {
		CzzAqpxKhqk czzAqpxKhqk = super.get(id);
		czzAqpxKhqk.setCzzAqpxKhqkdt1List(czzAqpxKhqkdt1Dao.findList(new CzzAqpxKhqkdt1(czzAqpxKhqk)));
		return czzAqpxKhqk;
	}
	
	public List<CzzAqpxKhqk> findList(CzzAqpxKhqk czzAqpxKhqk) {
		return super.findList(czzAqpxKhqk);
	}
	
	public Page<CzzAqpxKhqk> findPage(Page<CzzAqpxKhqk> page, CzzAqpxKhqk czzAqpxKhqk) {
		return super.findPage(page, czzAqpxKhqk);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzAqpxKhqk czzAqpxKhqk) {
		super.save(czzAqpxKhqk);
		for (CzzAqpxKhqkdt1 czzAqpxKhqkdt1 : czzAqpxKhqk.getCzzAqpxKhqkdt1List()){
			if (czzAqpxKhqkdt1.getId() == null){
				continue;
			}
			if (CzzAqpxKhqkdt1.DEL_FLAG_NORMAL.equals(czzAqpxKhqkdt1.getDelFlag())){
				if (StringUtils.isBlank(czzAqpxKhqkdt1.getId())){
					czzAqpxKhqkdt1.setTestDataMain(czzAqpxKhqk);
					czzAqpxKhqkdt1.preInsert();
					czzAqpxKhqkdt1Dao.insert(czzAqpxKhqkdt1);
				}else{
					czzAqpxKhqkdt1.preUpdate();
					czzAqpxKhqkdt1Dao.update(czzAqpxKhqkdt1);
				}
			}else{
				czzAqpxKhqkdt1Dao.delete(czzAqpxKhqkdt1);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzAqpxKhqk czzAqpxKhqk) {
		super.delete(czzAqpxKhqk);
		czzAqpxKhqkdt1Dao.delete(new CzzAqpxKhqkdt1(czzAqpxKhqk));
	}
	
}