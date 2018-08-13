/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqsgbg.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.aqsgbg.entity.CzzAqsgbg;

/**
 * DROP TABLE IF EXISTS czz_aqsgbg;DAO接口
 * @author qyd
 * @version 2018-08-13
 */
@MyBatisDao
public interface CzzAqsgbgDao extends CrudDao<CzzAqsgbg> {
	
}