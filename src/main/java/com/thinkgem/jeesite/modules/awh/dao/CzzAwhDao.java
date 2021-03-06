/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.awh.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.awh.entity.CzzAwh;

/**
 * 安委会DAO接口
 * @author qyd
 * @version 2018-08-18
 */
@MyBatisDao
public interface CzzAwhDao extends CrudDao<CzzAwh> {
	
}