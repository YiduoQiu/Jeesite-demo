/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.common.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.modules.aqjc.entity.CzzAqjc;

/**
 * Service基类
 * @author ThinkGem
 * @version 2014-05-16
 */
@Transactional(readOnly = true)
public abstract class CrudService<D extends CrudDao<T>, T extends DataEntity<T>> extends BaseService {
	
	/**
	 * 持久层对象
	 */
	@Autowired
	protected D dao;
	
	/**
	 * 获取单条数据
	 * @param id
	 * @return
	 */
	public T get(String id) {
		return dao.get(id);
	}
	
	/**
	 * 获取单条数据
	 * @param entity
	 * @return
	 */
	public T get(T entity) {
		return dao.get(entity);
	}
	
	/**
	 * 查询列表数据
	 * @param entity
	 * @return
	 */
	public List<T> findList(T entity) {
		return dao.findList(entity);
	}
	
	/**
	 * 查询分页数据
	 * @param page 分页对象
	 * @param entity
	 * @return
	 */
	public Page<T> findPage(Page<T> page, T entity) {
		entity.setPage(page);
		page.setList(dao.findList(entity));
		return page;
	}

	/**
	 * 保存数据（插入或更新）
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public void save(T entity) {
		if (entity.getIsNewRecord()){
			entity.preInsert();
			dao.insert(entity);
		}else{
			entity.preUpdate();
			dao.update(entity);
		}
	}
	
	/**
	 * 删除数据
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public void delete(T entity) {
		dao.delete(entity);
	}
	
	/**
	 * 查询目标数据
	 * @param entity
	 * @return
	 */
	public List<T> findGoalData(T entity) {
		return dao.findGoalData(entity);
	}

	/**
	 * 统计总量（报表方法）
	 * @param entity
	 * @return
	 */
	public int firstCount(T entity) {
		return dao.firstCount(entity);
	}
	public int secondCount(T entity) {
		return dao.secondCount(entity);
	}
	public int thirdCount(T entity) {
		return dao.thirdCount(entity);
	}
	public int fourthCount(T entity) {
		return dao.fourthCount(entity);
	}
	public int fifthCount(T entity) {
		return dao.fifthCount(entity);
	}
	public int sixthCount(T entity) {
		return dao.sixthCount(entity);
	}
	public int seventhCount(T entity) {
		return dao.seventhCount(entity);
	}
	public int eightCount(T entity) {
		return dao.eightCount(entity);
	}
	public int nineCount(T entity) {
		return dao.nineCount(entity);
	}
	public int tenCount(T entity) {
		return dao.tenCount(entity);
	}
}
