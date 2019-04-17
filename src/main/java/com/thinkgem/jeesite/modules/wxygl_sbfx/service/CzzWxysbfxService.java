/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wxygl_sbfx.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.wxygl_sbfx.entity.CzzWxysbfx;
import com.thinkgem.jeesite.modules.wxygl_sbfx.dao.CzzWxysbfxDao;
import com.thinkgem.jeesite.modules.wxygl_sbfx.entity.CzzWxysbfxDt1;
import com.thinkgem.jeesite.modules.wxygl_sbfx.dao.CzzWxysbfxDt1Dao;

/**
 * 重大危险源管理Service
 * @author qyd
 * @version 2019-01-08
 */
@Service
@Transactional(readOnly = true)
public class CzzWxysbfxService extends CrudService<CzzWxysbfxDao, CzzWxysbfx> {

	@Autowired
	private CzzWxysbfxDt1Dao czzWxysbfxDt1Dao;
	
	public CzzWxysbfx get(String id) {
		CzzWxysbfx czzWxysbfx = super.get(id);
		czzWxysbfx.setCzzWxysbfxDt1List(czzWxysbfxDt1Dao.findList(new CzzWxysbfxDt1(czzWxysbfx)));
		return czzWxysbfx;
	}
	
	public List<CzzWxysbfx> findList(CzzWxysbfx czzWxysbfx) {
		return super.findList(czzWxysbfx);
	}
	
	public Page<CzzWxysbfx> findPage(Page<CzzWxysbfx> page, CzzWxysbfx czzWxysbfx) {
		return super.findPage(page, czzWxysbfx);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzWxysbfx czzWxysbfx) {
		super.save(czzWxysbfx);
		for (CzzWxysbfxDt1 czzWxysbfxDt1 : czzWxysbfx.getCzzWxysbfxDt1List()){
			if (czzWxysbfxDt1.getId() == null){
				continue;
			}
			if (CzzWxysbfxDt1.DEL_FLAG_NORMAL.equals(czzWxysbfxDt1.getDelFlag())){
				if (StringUtils.isBlank(czzWxysbfxDt1.getId())){
					czzWxysbfxDt1.setTestDataMain(czzWxysbfx);
					czzWxysbfxDt1.preInsert();
					czzWxysbfxDt1Dao.insert(czzWxysbfxDt1);
				}else{
					czzWxysbfxDt1.preUpdate();
					czzWxysbfxDt1Dao.update(czzWxysbfxDt1);
				}
			}else{
				czzWxysbfxDt1Dao.delete(czzWxysbfxDt1);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzWxysbfx czzWxysbfx) {
		super.delete(czzWxysbfx);
		czzWxysbfxDt1Dao.delete(new CzzWxysbfxDt1(czzWxysbfx));
	}
	
}