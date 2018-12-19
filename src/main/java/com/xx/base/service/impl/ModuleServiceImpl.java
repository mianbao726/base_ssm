package com.xx.base.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xx.base.dao.BaseDao;
import com.xx.base.dao.PageServiceDao;
import com.xx.base.service.IModuleService;
import com.xx.base.util.TimestampTool;
import com.xx.base.util.map.QMap;
@Transactional
@Service
public class ModuleServiceImpl extends PageServiceDao implements IModuleService{

	@Resource
	private BaseDao baseDao;
	private static Logger log = Logger.getLogger(ModuleServiceImpl.class);
	
	
	public Map getPermissonInfo(Map m){
		return baseDao.selectOne("baseFrame_sys_action.selectSingle", m); 
	}
	@Override
	public int add(Map<String, Object> map) {
		if(map.get("w_action_level").equals("0")){//根结点
			map.put("w_action_level","1");
			map.put("is_leaf", "0");
			map.put("pid" , "0");
		}else{
			map.remove("w_action_pic");
			map.put("is_leaf", "0");
		}
		map.put("create_date", TimestampTool.parseDateYYYYMMDDHHMMSS(new Date()));
		map.put("del_state", "0");
		this.baseDao.insert("baseFrame_sys_action.insert", map);
		int id = Integer.parseInt(map.get("id").toString());
//		List<Map<String,Object>> child_list = (List<Map<String,Object>>) map.get("children");
//		if(child_list!=null&&child_list.size()>0){
//			for(Iterator<Map<String,Object>> it = child_list.iterator();it.hasNext();){
//				Map<String,Object> child_map = it.next();
//				child_map.put("action_level", map.get("action_level"));
//				child_map.put("action_pic", map.get("action_pic"));
//				child_map.put("action_level", "3");
//				child_map.put("is_leaf", "0");
//				child_map.put("del_state", "0");
//				child_map.put("create_date", TimestampTool.parseDateYYYYMMDDHHMMSS(new Date()));
//				child_map.put("pid", map.get("pid"));
//				this.baseDao.insert("baseFrame_sys_action.insert", child_map);
//			}
//		}				
//		//添加资源数据域关联
//		List data_list = (List) map.get("data_name");
//		if(data_list!=null&&data_list.size()>0){
//			for(Iterator it = data_list.iterator();it.hasNext();){
//				String data_name = (String) it.next();
//				Map<String,Object> map_ = new HashMap<String, Object>();
//				map_.clear();
//				map_.put("data_name", data_name);
//				Map<String,Object> data_map = this.baseDao.selectOne("baseFrame.sys_data.selectSysData", map_);
//				Map<String,Object> m = new HashMap<String, Object>();
//				m.put("action_id", map.get("id"));
//				m.put("data_id", data_map.get("id"));
//				this.baseDao.insert("baseFrame.sys_action_data.insert", m);
//			}
//		}
		return id;
	}

	@Override
	public int update(Map<String, Object> map) {
		Map<String,Object> m = this.baseDao.selectOne("baseFrame_sys_action.selectSingle", map);
		if(m!=null){
			m.putAll(map);
			m.put("action_name", map.get("w_action_name"));
			m.put("action_url", map.get("w_action_url"));
			m.put("sort_num", map.get("w_sort_num"));
			m.put("help", map.get("w_help"));
			m.put("action_pic", map.get("w_action_pic"));
			m.put("update_date", TimestampTool.parseDateYYYYMMDDHHMMSS(new Date()));
			return this.baseDao.update("baseFrame_sys_action.updateOne",m );
		}
		return 0;
		
	}

	@Override
	public int del(Map<String, Object> map) {
		if(map.get("ids")!=null){
			//先删除子资源
			this.baseDao.delete("baseFrame_sys_action.deleteForPid",map);
			//删除资源
			return this.baseDao.delete("baseFrame_sys_action.delete",map);
		}		
		return 0;
	}

	@Override
	public Map<String, Object> selectOne(Map<String,Object> map) {
		return this.baseDao.selectOne("baseFrame_sys_action.selectOne", map);
	}

	@Override
	public Map<String, Object> queryPageForMap(Map<String, Object> map) {
//		return queryPageResult("baseFrame_sys_action.selectAll", map);
		return null;
	}

	@Override
	public List<Map<String, Object>> selectMenuForUser(HttpServletRequest request,Map<String, Object> map) {
	    HttpSession session = request.getSession();
		//用户所有角色集合
		List<Map<String,Object>> role_list = (List<Map<String, Object>>) map.get("userRoles");
		//用户对应所有菜单集合
		List<Map<String,Object>> user_menu_list = new ArrayList<Map<String,Object>>();
		//用户所有角色对应菜单集合,格式为角色编码为key,角色对应菜单为values
		Map<String,Object> role_map = new HashMap<String, Object>();
		//用户所有角色集合,格式为action的url为key,整个一条数据为values
		Map<String,Object> userMenusMap = new HashMap<String, Object>();
		//用户所有角色集合
		List<Map<String,Object>> userMenus = new ArrayList<Map<String,Object>>();
		if(role_list!=null){
			for (Map<String,Object> role : role_list)
		    {
				//角色所属用户对应的所有菜单集合
		      List<Map<String,Object>> user_role_menu = new ArrayList<Map<String,Object>>();
		      Integer role_id = Integer.parseInt(role.get("role_id").toString());
		      Map<String,Object> RoleMenus = new HashMap<String, Object>();
		      RoleMenus.put("role_id", role_id);
		      List<Map<String,Object>> role_menu_list = this.baseDao.selectList("baseFrame_sys_action_role.selectForRoleId", RoleMenus);
		      for (Iterator<Map<String,Object>> it = role_menu_list.iterator(); it.hasNext(); ) {
		        Map<String,Object> role_menu_map = it.next();
		        Integer action_id = Integer.parseInt(role_menu_map.get("action_id").toString());
		        Map<String,Object> menu_map = new HashMap<String, Object>();
		        menu_map.put("id", action_id);
		        //XXX
		        //menu_map.put("action_level", map.get("action_level"));
		        menu_map.put("action_level", "1");
		        Map<String,Object> Menu = this.baseDao.selectOne("baseFrame_sys_action.selectOne", menu_map);
		        if(Menu!=null){
			        //把数据域放入菜单中
			        Menu.put("data_id", role_menu_map.get("data_id"));
			        user_menu_list.add(Menu);
			        user_role_menu.add(Menu);
		        }else{
		        }
		      }
		      role_map.put(role.get("role_id").toString(), user_role_menu);
		    }
		}
		
		StringBuilder sb = new StringBuilder(role_list.get(0).get("role_id").toString());
		boolean f_flag = true;
		for(Map rm : role_list){
			if(f_flag){
				f_flag = false;
				continue;
			}
			sb.append(rm.get("role_id")+",");
		}
		session.setAttribute("role_info", sb.toString());
		
		session.setAttribute("userRoleMenus", role_map);

	    for (Map<String,Object> menu : user_menu_list) {
	      userMenusMap.put((String)menu.get("action_url"), menu);
	      userMenus.add(menu);
	    }
	    session.setAttribute("userMenus", userMenus);
	    session.setAttribute("userMenusMap", userMenusMap);
		return user_menu_list;
	}
	/**
	 * 
	 */
	public List<Map<String,Object>> loadMenuData(List<Map<String,Object>> list){
        Collections.sort(list, new Comparator<Map<String,Object>>(){
			@Override
			public int compare(Map<String, Object> o1, Map<String, Object> o2) {
				int a = 0;
				int b = 0;
				if(o1.get("sort_num")!=null&&o1.get("sort_num")!="null"&&!o1.get("sort_num").equals("")){
					a = Integer.parseInt(o1.get("sort_num").toString());
				}
				if(o2.get("sort_num")!=null&&o2.get("sort_num")!="null"&&!o2.get("sort_num").equals("")){
					b = Integer.parseInt(o2.get("sort_num").toString());
				}
				return a -b;
			}
        	
        });
		List<Map<String,Object>> menudata = new ArrayList<Map<String,Object>>();
		if(list!=null&&list.size()>0){
			for(Iterator<Map<String,Object>> it = list.iterator();it.hasNext();){
				Map<String,Object> map_1 = it.next();
				Integer pid_1 =Integer.parseInt(map_1.get("pid").toString());
				if(pid_1==0&&"1".equals(map_1.get("action_level"))){//取得一级菜单,必须为菜单资源
					Map<String,Object> menu_map = new HashMap<String, Object>();
					menu_map.put("id", map_1.get("id"));
					menu_map.put("pid", map_1.get("pid"));
					menu_map.put("name", map_1.get("action_name"));
					menu_map.put("url", map_1.get("action_url"));
					menu_map.put("action_pic", map_1.get("action_pic"));
					List<Map<String,Object>> children = new ArrayList<Map<String,Object>>();
					for(Iterator<Map<String,Object>> i = list.iterator();i.hasNext();){
						Map<String,Object> map_2 = i.next();
						Integer pid_2 =Integer.parseInt(map_2.get("pid").toString());
						if(map_1.get("id") == pid_2&&"1".equals(map_2.get("action_level"))){//取得二级菜单,必须为菜单资源
							Map<String,Object> m = new HashMap<String, Object>();
							m.put("id", map_2.get("id"));
							m.put("pid", map_2.get("pid"));
							m.put("name", map_2.get("action_name"));
							m.put("url", map_2.get("action_url"));
							m.put("action_pic", map_2.get("action_pic"));
							children.add(m);
						}

					}
					menu_map.put("children", children);
					menudata.add(menu_map);
				}

			}
		}
		return menudata;
	}


	@Override
	public List<Map<String, Object>> getSysData() {		
		return this.baseDao.selectList("baseFrame.sys_data.getSysData");
	}

	@Override
	public List<Map<String, Object>> getWebModuleTree(Map<String, Object> map) {
		
		List l = new ArrayList();
		if(!(null == map.get("roleid") || "".equals(map.get("roleid")))){
			l = this.baseDao.selectList("baseFrame.sys_data.getRole_action",map);
		}
		
		if(map.get("pid")==null||map.get("pid")==""){//web端分配权限树列表,最根级为1
			map.put("pid", 0);
		}
		List<Map<String,Object>> list = this.baseDao.selectList("baseFrame_sys_action.getWebModuleTree",map);
		for(int i=0;i<list.size();i++){
			Map<String,Object> m = list.get(i);
			String is_leaf = m.get("is_leaf").toString();
		      if ((is_leaf == "0") || ("0".equals(is_leaf)))
		          	m.put("isParent", "false");
		        else {
		        	m.put("isParent", "true");
		        }
		      if(l.contains(m.get("id").toString())){
		    	  m.put("checked", "true");
		      }
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> getPadModuleTree(Map<String, Object> map) {
		if(map.get("pid")==null||map.get("pid")==""){//pad端分配权限树列表,最根级为98
			map.put("pid", 9999);
		}
		List<Map<String,Object>> list = this.baseDao.selectList("baseFrame_sys_action.getPadModuleTree",map);
		for(int i=0;i<list.size();i++){
			Map<String,Object> m = list.get(i);
			String is_leaf = m.get("is_leaf").toString();
		      if ((is_leaf == "0") || ("0".equals(is_leaf)))
		          	m.put("isParent", "false");
		        else {
		        	m.put("isParent", "true");
		        }
		}
		return list;
	} 

}
