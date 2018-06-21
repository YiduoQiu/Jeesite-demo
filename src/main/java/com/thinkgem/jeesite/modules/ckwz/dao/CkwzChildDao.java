/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.ckwz.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.ckwz.entity.CkwzChild;

/**
 * 仓库物资管理DAO接口
 * @author qyd
 * @version 2018-06-19
 */
@MyBatisDao
public interface CkwzChildDao extends CrudDao<CkwzChild> {
	
}