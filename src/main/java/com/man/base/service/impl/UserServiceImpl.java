package com.man.base.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.man.base.dao.BaseDao;
import com.man.base.dao.PageServiceDao;
import com.man.base.service.IUserService;
import com.man.base.util.MD5Util;
import com.man.base.util.QMap;

@Service("userService")
public class UserServiceImpl extends PageServiceDao implements IUserService {
	@Resource
	private BaseDao baseDao;

	public Map login(Map param) {
		Map ret = null;
		Map userinfo = this.baseDao.selectOne("base_user.login", param);
		if (userinfo.get("password").equals(MD5Util.MD5(param.get("username").toString() + param.get("password")))) {
			ret = new QMap(200);
		} else {
			ret = new QMap(202,"密码不正确");
		}
		return ret;
	}

	public Long checkUniqueEmail(Map param) {
		return (Long) ((Map) this.baseDao.selectOne("base_user.checkUniqueEmail", param)).get("count");
	}

	public Long checkUniqueUsername(Map param) {
		return (Long) ((Map) this.baseDao.selectOne("base_user.checkUniqueUsername", param)).get("count");
	}

	@Override
	public int register(Map param) {
		param.put("password", MD5Util.MD5(param.get("username").toString() + param.get("password")));
		int count = baseDao.insert("base_user.insert", param);
		return count;
	}

	public Map selectOne(Map param) {
		Map ret = this.baseDao.selectOne("base_user.selectOne", param);
		return ret;
	}

	@Override
	public Map index(Map param) {
		return index("base_user.index", param);
	}

	public Map update(Map param) {
		int count = baseDao.update("base_user.updateByPrimaryKey", param);
		return null;
	}

	public Map insert(Map param) {
		int count = baseDao.insert("base_user.insert", param);
		return null;
	}

}