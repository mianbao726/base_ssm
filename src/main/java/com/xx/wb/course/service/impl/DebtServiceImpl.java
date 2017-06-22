package com.xx.wb.course.service.impl;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.xx.base.dao.BaseDao;
import com.xx.base.dao.PageServiceDao;
import com.xx.base.service.IModuleService;
import com.xx.base.service.IRoleService;
import com.xx.base.util.C;
import com.xx.base.util.MD5Util;
import com.xx.base.util.map.QMap;
import com.xx.wb.course.service.IDebtService;

@Service("debtService")
@SuppressWarnings({ "unchecked", "rawtypes" })
public class DebtServiceImpl extends PageServiceDao implements IDebtService {
	@Resource
	private BaseDao baseDao;
	@Resource
	private IRoleService roleService;
	@Resource
	private IModuleService moduleService;
	
	public Map uploadFile(Map param){
		param.put("rid", baseDao.insert("sys_file.insert_file", param)) ;
		return param;
	}
	
	public Map loadMore(Map param){
		Map ret = new HashMap();
		
		//build query 
		StringBuilder sb = new StringBuilder();
		if(null != param.get("query001") && !("".equals(param.get("query001")))){
			String query = param.get("query001").toString();
			if(query.equals("query001_2")){
				param.put("query001_2", "not null");
				sb.append(" and TO_DAYS(now()) - TO_DAYS(craeted_at) >= 30 ");
			}else if(query.equals("query001_3")){
				sb.append(" and TO_DAYS(now()) - TO_DAYS(craeted_at) <= 90 ");
			}else if(query.equals("query001_4")){
				sb.append(" and TO_DAYS(now()) - TO_DAYS(craeted_at) <= 120 ");
			}else if(query.equals("query001_5")){
				sb.append(" and TO_DAYS(now()) - TO_DAYS(craeted_at) <= 365 ");
			}else if(query.equals("query001_6")){
				sb.append(" and TO_DAYS(now()) - TO_DAYS(craeted_at) > 365 ");
			}
			
		}
		if(null != param.get("query002") && !("".equals(param.get("query002")))){
			String query = param.get("query002").toString();
			if(query.equals("query001_2")){
				sb.append(" and amount <= 3 ");
			}else if(query.equals("query001_3")){
				sb.append(" and amount >= 3 and amount <= 5 ");
			}else if(query.equals("query001_4")){
				sb.append(" and amount >= 5 and amount <= 7 ");
			}else if(query.equals("query001_5")){
				sb.append(" and amount => 7 and amount <= 10 ");
			}else if(query.equals("query001_6")){
				sb.append(" and amount >= 10 ");
			}
			
		}
		if(null != param.get("query003") && !("".equals(param.get("query003")))){
			String query = param.get("query003").toString();
			if(query.equals("query001_2")){
				sb.append(" and area = 0 ");
			}else if(query.equals("query001_3")){
				sb.append(" and area = 2 ");
			}else if(query.equals("query001_4")){
				sb.append(" and area = 1 ");
			}else if(query.equals("query001_5")){
				sb.append(" and area = 3 ");
			}else if(query.equals("query001_6")){
				sb.append(" and area = 4 ");
			}else if(query.equals("query001_7")){
				sb.append(" and area not in ( 0,2,1,3,4 ) ");
			}
			
		}
		param.put("querys", sb.toString());
		
		
		if(null == param.get("uuid") || "".equals(param.get("uuid").toString()))
			param.remove("uuid");
		System.out.println(param);
		ret.put("data", baseDao.selectList("sjlr_debt.loadMore", param));
		return ret;
	}
	public Map target(Map param){
		Map ret = null;
		param.put("target", param.get("CURRENT_USER_ID"));
		String person = param.get("CURRENT_USER_NAME").toString();
		String person_name =person.substring(0, 1) + "***"+person.substring(person.length()-1); 
		param.put("person_name", person_name);
		param.put("status", "1");
		int count = baseDao.update("sjlr_debt.updateByPrimaryKey", param);
		if(1== count){
			ret = new QMap(200);
		}else{
			ret = new QMap(202);
			Map one = baseDao.selectOne("sjlr_debt.selectOneCheck", param);
			
			if(param.get("CURRENT_USER_ID").toString().equals(one.get("target").toString())){
				one.put("same", "y");
			}else{
				one.put("same", "n");	
			}
			one.remove("target");
			ret.put("tarinfo", one);
		}
		return ret;
	}
	
	
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
		
		param.put("status", "0");
		param.put("uuid", UUID.randomUUID().toString());
		Calendar c= Calendar.getInstance();
		param.put("serial_id", "SYGR"+c.YEAR+c.MONTH+c.DAY_OF_MONTH+c.getTimeInMillis());
		int id = baseDao.insert("sjlr_debt.insert", param);
		return null;
	}
	
}
