package com.man.wb.course.service.impl;

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

import com.man.base.dao.BaseDao;
import com.man.base.dao.PageServiceDao;
import com.man.base.service.IRoleService;
import com.man.base.service.impl.RoleServiceImpl;
import com.man.base.util.TimestampTool;
import com.man.wb.course.service.ICourseService;
@Service
public class CourseServiceImpl  extends PageServiceDao implements ICourseService {
	@Resource
	private BaseDao baseDao;
	private static Logger log = Logger.getLogger(RoleServiceImpl.class);
	
	
	public List<Map<String, Object>> getCoursesCount(Map<String, Object> map){
		return this.baseDao.selectList("wb_course.getCoursesCount", map);
	}
	
	private void raRoleInfo(List<Map> arList ,Map<String, Object> map){
		this.baseDao.delete("baseFrame_wb_course.del_related_ar", map);
		
		for(Map item : arList){
			item.put("role_id", map.get("id"));
			item.put("create_user", map.get("create_user"));
			item.put("create_date", map.get("create_date"));
			item.put("data_id", '1');//因无需数据域  写死为1
			
			this.baseDao.insert("baseFrame_wb_course.insert_ra", item);
		}
	}
	
	@Override
	@Transactional
	public int add(Map<String, Object> map) {
		this.baseDao.insert("wb_course.insert", map);
		return Integer.parseInt(map.get("id").toString());
	}
	
	public List<Map<String,Object>> getRoleActions(Map<String,Object> map){
		return this.baseDao.selectList("baseFrame_wb_course.getRoleActions", map);
	}

	@Override
	public int update(Map<String, Object> map) {
		Map<String,Object> m = this.baseDao.selectOne("baseFrame_wb_course.selectOne", map);
		if(m!=null){
			m.putAll(map);
			m.put("update_date", TimestampTool.parseDateYYYYMMDDHHMMSS(new Date()));
			List<Map> arList = (List<Map>) map.get("nodes");
			raRoleInfo(arList,map);
			return this.baseDao.update("baseFrame_wb_course.updateOne", m);
		}
		return 0;

	}

	@Override
	public int del(Map<String, Object> map) {
		if(map.get("ids")!=null){
			List list = (List) map.get("ids");
			//删除角色表
			return this.baseDao.delete("wb_course.delete",map);
		}
		return 0;
	}

	@Override
	public Map<String, Object> selectOne(Map<String,Object> map) {

		return this.baseDao.selectOne("baseFrame_wb_course.selectOne", map);
	}

	@Override
	public Map<String, Object> queryPageForMap(Map<String, Object> map) {
//		return queryPageResult("baseFrame_wb_course.selectAll", map);
		return index("wb_course.index", map);
	}

}
