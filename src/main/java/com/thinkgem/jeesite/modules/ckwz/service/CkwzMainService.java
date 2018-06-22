/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.ckwz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.ckwz.entity.CkwzMain;
import com.thinkgem.jeesite.modules.ckwz.dao.CkwzMainDao;
import com.thinkgem.jeesite.modules.ckwz.entity.CkwzChild1;
import com.thinkgem.jeesite.modules.ckwz.dao.CkwzChild1Dao;
import com.thinkgem.jeesite.modules.ckwz.entity.CkwzChild2;
import com.thinkgem.jeesite.modules.ckwz.dao.CkwzChild2Dao;

/**
 * 仓库物资管理Service
 * @author qyd
 * @version 2018-06-22
 */
@Service
@Transactional(readOnly = true)
public class CkwzMainService extends CrudService<CkwzMainDao, CkwzMain> {

	@Autowired
	private CkwzChild1Dao ckwzChild1Dao;
	@Autowired
	private CkwzChild2Dao ckwzChild2Dao;
	
	public CkwzMain get(String id) {
		CkwzMain ckwzMain = super.get(id);
		ckwzMain.setCkwzChild1List(ckwzChild1Dao.findList(new CkwzChild1(ckwzMain)));
		ckwzMain.setCkwzChild2List(ckwzChild2Dao.findList(new CkwzChild2(ckwzMain)));
		return ckwzMain;
	}
	
	public List<CkwzMain> findList(CkwzMain ckwzMain) {
		return super.findList(ckwzMain);
	}
	
	public Page<CkwzMain> findPage(Page<CkwzMain> page, CkwzMain ckwzMain) {
		return super.findPage(page, ckwzMain);
	}
	
	@Transactional(readOnly = false)
	public void save(CkwzMain ckwzMain) {
		super.save(ckwzMain);
		for (CkwzChild1 ckwzChild1 : ckwzMain.getCkwzChild1List()){
			if (ckwzChild1.getId() == null){
				continue;
			}
			if (CkwzChild1.DEL_FLAG_NORMAL.equals(ckwzChild1.getDelFlag())){
				if (StringUtils.isBlank(ckwzChild1.getId())){
					ckwzChild1.setTestDataMain(ckwzMain);
					ckwzChild1.preInsert();
					ckwzChild1Dao.insert(ckwzChild1);
				}else{
					ckwzChild1.preUpdate();
					ckwzChild1Dao.update(ckwzChild1);
				}
			}else{
				ckwzChild1Dao.delete(ckwzChild1);
			}
		}
		for (CkwzChild2 ckwzChild2 : ckwzMain.getCkwzChild2List()){
			if (ckwzChild2.getId() == null){
				continue;
			}
			if (CkwzChild2.DEL_FLAG_NORMAL.equals(ckwzChild2.getDelFlag())){
				if (StringUtils.isBlank(ckwzChild2.getId())){
					ckwzChild2.setTestDataMain(ckwzMain);
					ckwzChild2.preInsert();
					ckwzChild2Dao.insert(ckwzChild2);
				}else{
					ckwzChild2.preUpdate();
					ckwzChild2Dao.update(ckwzChild2);
				}
			}else{
				ckwzChild2Dao.delete(ckwzChild2);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(CkwzMain ckwzMain) {
		super.delete(ckwzMain);
		ckwzChild1Dao.delete(new CkwzChild1(ckwzMain));
		ckwzChild2Dao.delete(new CkwzChild2(ckwzMain));
	}
	
}