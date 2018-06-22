/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.yjya.service.jbxx;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.yjya.entity.jbxx.YjyaJbxx;
import com.thinkgem.jeesite.modules.yjya.dao.jbxx.YjyaJbxxDao;

/**
 * 应急预案_基本信息表生成Service
 * @author qyd
 * @version 2018-06-22
 */
@Service
@Transactional(readOnly = true)
public class YjyaJbxxService extends CrudService<YjyaJbxxDao, YjyaJbxx> {

	public YjyaJbxx get(String id) {
		return super.get(id);
	}
	
	public List<YjyaJbxx> findList(YjyaJbxx yjyaJbxx) {
		return super.findList(yjyaJbxx);
	}
	
	public Page<YjyaJbxx> findPage(Page<YjyaJbxx> page, YjyaJbxx yjyaJbxx) {
		return super.findPage(page, yjyaJbxx);
	}
	
	@Transactional(readOnly = false)
	public void save(YjyaJbxx yjyaJbxx) {
		super.save(yjyaJbxx);
	}
	
	@Transactional(readOnly = false)
	public void delete(YjyaJbxx yjyaJbxx) {
		super.delete(yjyaJbxx);
	}
	
}