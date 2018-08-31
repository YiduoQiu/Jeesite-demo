package com.thinkgem.jeesite.modules.aqtrzj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.aqtrzj.entity.CzzAqtrzj;
import com.thinkgem.jeesite.modules.aqtrzj.dao.CzzAqtrzjDao;
import com.thinkgem.jeesite.modules.aqtrzj.entity.CzzAqtrzjDt1;
import com.thinkgem.jeesite.modules.aqtrzj.dao.CzzAqtrzjDt1Dao;

/**
 * 安全投入资金计划Service
 * @author qyd
 * @version 2018-08-27
 */
@Service
@Transactional(readOnly = true)
public class CzzAqtrzjService extends CrudService<CzzAqtrzjDao, CzzAqtrzj> {

	@Autowired
	private CzzAqtrzjDt1Dao czzAqtrzjDt1Dao;
	
	public CzzAqtrzj get(String id) {
		CzzAqtrzj czzAqtrzj = super.get(id);
		czzAqtrzj.setCzzAqtrzjDt1List(czzAqtrzjDt1Dao.findList(new CzzAqtrzjDt1(czzAqtrzj)));
		return czzAqtrzj;
	}
	
	public List<CzzAqtrzj> findList(CzzAqtrzj czzAqtrzj) {
		return super.findList(czzAqtrzj);
	}
	
	public Page<CzzAqtrzj> findPage(Page<CzzAqtrzj> page, CzzAqtrzj czzAqtrzj) {
		return super.findPage(page, czzAqtrzj);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzAqtrzj czzAqtrzj) {
		super.save(czzAqtrzj);
		for (CzzAqtrzjDt1 czzAqtrzjDt1 : czzAqtrzj.getCzzAqtrzjDt1List()){
			if (czzAqtrzjDt1.getId() == null){
				continue;
			}
			if (CzzAqtrzjDt1.DEL_FLAG_NORMAL.equals(czzAqtrzjDt1.getDelFlag())){
				if (StringUtils.isBlank(czzAqtrzjDt1.getId())){
					czzAqtrzjDt1.setTestDataMain(czzAqtrzj);
					czzAqtrzjDt1.preInsert();
					czzAqtrzjDt1Dao.insert(czzAqtrzjDt1);
				}else{
					czzAqtrzjDt1.preUpdate();
					czzAqtrzjDt1Dao.update(czzAqtrzjDt1);
				}
			}else{
				czzAqtrzjDt1Dao.delete(czzAqtrzjDt1);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzAqtrzj czzAqtrzj) {
		super.delete(czzAqtrzj);
		czzAqtrzjDt1Dao.delete(new CzzAqtrzjDt1(czzAqtrzj));
	}
	
}