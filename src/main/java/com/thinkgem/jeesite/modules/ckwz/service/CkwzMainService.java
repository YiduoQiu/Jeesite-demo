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
import com.thinkgem.jeesite.modules.ckwz.entity.CkwzChild;
import com.thinkgem.jeesite.modules.ckwz.dao.CkwzChildDao;

/**
 * 仓库物资管理Service
 * @author qyd
 * @version 2018-06-19
 */
@Service
@Transactional(readOnly = true)
public class CkwzMainService extends CrudService<CkwzMainDao, CkwzMain> {

	@Autowired
	private CkwzChildDao ckwzChildDao;
	
	public CkwzMain get(String id) {
		CkwzMain ckwzMain = super.get(id);
		ckwzMain.setCkwzChildList(ckwzChildDao.findList(new CkwzChild(ckwzMain)));
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
		for (CkwzChild ckwzChild : ckwzMain.getCkwzChildList()){
			if (ckwzChild.getId() == null){
				continue;
			}
			if (CkwzChild.DEL_FLAG_NORMAL.equals(ckwzChild.getDelFlag())){
				if (StringUtils.isBlank(ckwzChild.getId())){
					ckwzChild.setTestDataMainId(ckwzMain);
					ckwzChild.preInsert();
					ckwzChildDao.insert(ckwzChild);
				}else{
					ckwzChild.preUpdate();
					ckwzChildDao.update(ckwzChild);
				}
			}else{
				ckwzChildDao.delete(ckwzChild);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(CkwzMain ckwzMain) {
		super.delete(ckwzMain);
		ckwzChildDao.delete(new CkwzChild(ckwzMain));
	}
	
}