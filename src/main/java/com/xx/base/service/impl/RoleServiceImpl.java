package com.xx.base.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xx.base.dao.BaseDao;
import com.xx.base.dao.PageServiceDao;
import com.xx.base.service.IRoleService;
import com.xx.base.util.TimestampTool;
@Service
public class RoleServiceImpl extends PageServiceDao implements IRoleService{
	@Resource
	private BaseDao baseDao;
	private static Logger log = Logger.getLogger(RoleServiceImpl.class);
	
	
	private void raRoleInfo(List<Map> arList ,Map<String, Object> map){
		this.baseDao.delete("baseFrame_sys_role.del_related_ar", map);
		
		for(Map item : arList){
			item.put("role_id", map.get("id"));
			item.put("create_user", map.get("create_user"));
			item.put("create_date", map.get("create_date"));
			item.put("data_id", '1');//因无需数据域  写死为1
			
			this.baseDao.insert("baseFrame_sys_role.insert_ra", item);
		}
	}
	
	@Override
	@Transactional
	public int add(Map<String, Object> map) {
		map.put("create_date", TimestampTool.parseDateYYYYMMDDHHMMSS(new Date()));
		map.put("del_state", "0");
		this.baseDao.insert("baseFrame_sys_role.insert", map);
		List<Map> arList = (List<Map>) map.get("nodes");
		raRoleInfo(arList,map);
		return Integer.parseInt(map.get("id").toString());
	}
	
	public List<Map<String,Object>> getRoleActions(Map<String,Object> map){
		return this.baseDao.selectList("baseFrame_sys_role.getRoleActions", map);
	}

	@Override
	public int update(Map<String, Object> map) {
		Map<String,Object> m = this.baseDao.selectOne("baseFrame_sys_role.selectOne", map);
		if(m!=null){
			m.putAll(map);
			m.put("update_date", TimestampTool.parseDateYYYYMMDDHHMMSS(new Date()));
			List<Map> arList = (List<Map>) map.get("nodes");
			raRoleInfo(arList,map);
			return this.baseDao.update("baseFrame_sys_role.updateOne", m);
		}
		return 0;

	}

	@Override
	public int del(Map<String, Object> map) {
		if(map.get("ids")!=null){
			List list = (List) map.get("ids");
			//删除角色菜单关联表
			for(Iterator<Integer> it=list.iterator();it.hasNext();){
				Integer id = it.next();
				Map<String,Object> m = new HashMap<String, Object>();
				m.put("role_id", id);
				this.baseDao.delete("baseFrame_sys_action_role.delete",m);
			}
			//删除角色表
			return this.baseDao.delete("baseFrame_sys_role.delete",map);
		}
		return 0;
	}

	@Override
	public Map<String, Object> selectOne(Map<String,Object> map) {

		return this.baseDao.selectOne("baseFrame_sys_role.selectOne", map);
	}

	@Override
	public Map<String, Object> queryPageForMap(Map<String, Object> map) {
//		return queryPageResult("baseFrame_sys_role.selectAll", map);
		return index("baseFrame_sys_role.index", map);
	}

	@Override
	public int addRoleModule(Map<String, Object> map) {
		if(map.get("role_id")!=null){
			this.baseDao.delete("baseFrame_sys_action_role.delete", map);
			List<Integer> list = (List<Integer>) map.get("action_id_list");
			for(Iterator<Integer> it = list.iterator();it.hasNext();){
				Integer action_id =  it.next();
				map.put("action_id", action_id);
				map.put("create_date", TimestampTool.parseDateYYYYMMDDHHMMSS(new Date()));
				this.baseDao.insert("baseFrame_sys_action_role.insert",map);
			}
			return 1;
		}
		return 0;
	}
	@Override
	public List<Map<String, Object>> selectRoleForUser(Map<String, Object> map) {
		List<Map<String,Object>> role_list = new ArrayList<Map<String,Object>>();
		if(map.get("id")!=null){
			 role_list = this.baseDao.selectList("baseFrame_sys_user_role.selectRoleForUserId", map);
		}
		return role_list;
	}

	@Override
	public List<Map<String, Object>> getAllRole(Map<String, Object> map) {
		return this.baseDao.selectList("baseFrame_sys_role.getAllRole");
	}

}
