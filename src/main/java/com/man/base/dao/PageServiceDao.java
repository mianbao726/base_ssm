package com.man.base.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;


public class PageServiceDao {
	
	@Resource
	public BaseDao baseDao;
	
	/**
	 * 
	 * @param command  			ibatis执行mapper
	 * @param paramsMap			sql执行参数
	 * @return
	 */
	public Map<String,Object> index(String command,Map<String,Object> paramsMap){
		Map<String,Object> map = new HashMap<String, Object>();
		List<Map<String,Object>> data = this.baseDao.selectList(command,paramsMap);
		data = (data == null) ? new ArrayList() : data;
		map.put("data", data);
	    int Total = 0;
	    Object TotalObj = this.baseDao.selectOne(command + "Count", paramsMap); 
	    if (TotalObj != null){
	    	Total = ((Integer)TotalObj).intValue();
	    }
	    map.put("recordsTotal", Integer.valueOf(Total));
	    map.put("recordsFiltered", Integer.valueOf(Total));
		return map;
		
	}

}
