/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqpx.service.pxqk;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.aqpx.entity.pxqk.CzzAqpxPxqk;
import com.thinkgem.jeesite.modules.aqpx.dao.pxqk.CzzAqpxPxqkDao;
import com.thinkgem.jeesite.modules.aqpx.entity.pxqk.CzzAqpxPxqkdt1;
import com.thinkgem.jeesite.modules.aqpx.dao.pxqk.CzzAqpxPxqkdt1Dao;

/**
 * 培训情况Service
 * @author qyd
 * @version 2018-07-20
 */
@Service
@Transactional(readOnly = true)
public class CzzAqpxPxqkService extends CrudService<CzzAqpxPxqkDao, CzzAqpxPxqk> {

	@Autowired
	private CzzAqpxPxqkdt1Dao czzAqpxPxqkdt1Dao;
	
	public CzzAqpxPxqk get(String id) {
		CzzAqpxPxqk czzAqpxPxqk = super.get(id);
		czzAqpxPxqk.setCzzAqpxPxqkdt1List(czzAqpxPxqkdt1Dao.findList(new CzzAqpxPxqkdt1(czzAqpxPxqk)));
		return czzAqpxPxqk;
	}
	
	public List<CzzAqpxPxqk> findList(CzzAqpxPxqk czzAqpxPxqk) {
		return super.findList(czzAqpxPxqk);
	}
	
	public Page<CzzAqpxPxqk> findPage(Page<CzzAqpxPxqk> page, CzzAqpxPxqk czzAqpxPxqk) {
		return super.findPage(page, czzAqpxPxqk);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzAqpxPxqk czzAqpxPxqk) {
		super.save(czzAqpxPxqk);
		for (CzzAqpxPxqkdt1 czzAqpxPxqkdt1 : czzAqpxPxqk.getCzzAqpxPxqkdt1List()){
			if (czzAqpxPxqkdt1.getId() == null){
				continue;
			}
			if (CzzAqpxPxqkdt1.DEL_FLAG_NORMAL.equals(czzAqpxPxqkdt1.getDelFlag())){
				if (StringUtils.isBlank(czzAqpxPxqkdt1.getId())){
					czzAqpxPxqkdt1.setTestDataMain(czzAqpxPxqk);
					czzAqpxPxqkdt1.preInsert();
					czzAqpxPxqkdt1Dao.insert(czzAqpxPxqkdt1);
				}else{
					czzAqpxPxqkdt1.preUpdate();
					czzAqpxPxqkdt1Dao.update(czzAqpxPxqkdt1);
				}
			}else{
				czzAqpxPxqkdt1Dao.delete(czzAqpxPxqkdt1);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzAqpxPxqk czzAqpxPxqk) {
		super.delete(czzAqpxPxqk);
		czzAqpxPxqkdt1Dao.delete(new CzzAqpxPxqkdt1(czzAqpxPxqk));
	}
	
}