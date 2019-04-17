/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.welcome.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.welcome.entity.CzzWelcom;

/**
 * 欢迎页面DAO接口
 * @author qyd
 * @version 2018-11-20
 */
@MyBatisDao
public interface CzzWelcomDao extends CrudDao<CzzWelcom> {
	
}