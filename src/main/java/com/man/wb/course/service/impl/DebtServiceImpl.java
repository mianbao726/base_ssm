package com.man.wb.course.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.man.base.dao.BaseDao;
import com.man.base.dao.PageServiceDao;
import com.man.base.service.IModuleService;
import com.man.base.service.IRoleService;
import com.man.base.util.C;
import com.man.base.util.MD5Util;
import com.man.base.util.QMap;
import com.man.wb.course.service.IDebtService;

@Service("debtService")
@SuppressWarnings({ "unchecked", "rawtypes" })
public class DebtServiceImpl extends PageServiceDao implements IDebtService {
	@Resource
	private BaseDao baseDao;
	@Resource
	private IRoleService roleService;
	@Resource
	private IModuleService moduleService;
	public Map login(Map param, HttpServletRequest request) {
		Map ret = null;
		Map userinfo = this.baseDao.selectOne("sjlr_user.login", param);
		if (null != userinfo && userinfo.get("password").equals(MD5Util.MD5(param.get("password")+""))) {
			ret = new QMap(200);
			userinfo.remove("password");
			login_success(request, userinfo);
		} else {
			ret = new QMap(202, "用户不存在或密码不正确");
		}
		return ret;
	}

	
	private void login_success(HttpServletRequest request, Map userinfo) {
		HttpSession session = request.getSession();
		List<Map<String,Object>> role_list = roleService.selectRoleForUser(userinfo);
		userinfo.put("userRoles", role_list);
		List<Map<String,Object>> menu_list = moduleService.selectMenuForUser(request,userinfo);
		
		if(null != role_list && role_list.size()>0){//用户默认主页
			userinfo.put("main_page", role_list.get(0).containsKey("role_main") && !("".equals(role_list.get(0).get("role_main").toString().trim())) ? role_list.get(0).get("role_main").toString().trim() : C.DEFAULT_DASHBOARD);
		}
		userinfo.put("data_list", menu_list);
		session.setAttribute("userInfo", userinfo);
	}

	public Long checkUniqueEmail(Map param) {
		return (Long) ((Map) this.baseDao.selectOne("sjlr_user.checkUniqueEmail", param)).get("count");
	}

	public Long checkUniqueUsername(Map param) {
		return (Long) ((Map) this.baseDao.selectOne("sjlr_user.checkUniqueUsername", param)).get("count");
	}

	@Override
	public int register(Map param) {
		param.put("password", MD5Util.MD5(param.get("username").toString() + param.get("password")));
		int count = baseDao.insert("sjlr_user.insert", param);
		
		param.put("id" ,param.get("ID")); 
        param.put("role_id",C.DEFAULT_ROLE_ID); 
        param.put("au_flag","add");
		baseDao.update("sjlr_user.insert_user_role", param);
		return count;
	}

	public Map selectOne(Map param) {
		Map ret = this.baseDao.selectOne("sjlr_debt.selectOne", param);
		return ret;
	}

	public Map editpwd(Map param) {
		param.put("id", param.get("CURRENT_USER_ID"));
		Map ret = this.baseDao.selectOne("sjlr_user.selectOne", param);
		if(ret.get("password").toString().equals(MD5Util.MD5(param.get("pwd_ori").toString()))){
			param.put("password", MD5Util.MD5(param.get("pwd_new").toString()));
			this.baseDao.update("sjlr_user.updateByPrimaryKey", param);
			ret.put("status_code", "200");
		}else{
			ret.put("status_code", "400");
		}
		return ret;
	}
	
	@Override
	public Map index(Map param) {
		return index("sjlr_debt.index", param);
	}

	public int update(Map param) {
		int count = baseDao.update("sjlr_debt.updateByPrimaryKey", param);
		return count;
	}
	
	public int pass(Map param) {
		int count = baseDao.update("sjlr_user.updateByPrimaryKey", param);
		return count;
	}
	
	public int delete(Map param) {
		int count = baseDao.update("sjlr_debt.updateByPrimaryKey", param);
		return count;
	}

	public Map insert(Map param) {
		
//		List<String> roles = (ArrayList<String>)param.get("role");
		param.put("type", "0");
		param.put("status", "0");
		int id = baseDao.insert("sjlr_debt.insert", param);
		return null;
	}

}
