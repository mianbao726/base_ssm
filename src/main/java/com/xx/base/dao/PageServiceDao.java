package com.xx.base.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;


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
		paramsMap = filterMap(paramsMap);
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
	public Map filterMap(Map param){
		String filter = getFilter(param.get("filter"));
		if(filter!=null && filter!="" &&!"".equals(filter)){
			param.put("filter", filter);
		}else{
			param.put("filter", null);
		}
		return param;
	}
	
	public String getFilter(Object obj){
		if(obj == null){
			return null;
		}
		JSONArray array = (JSONArray)obj;
		if(array.size()<1){
			return null;
		}
		StringBuffer str = new StringBuffer();
		for(Iterator<Object> it = array.iterator();it.hasNext();){
			JSONObject object = (JSONObject) it.next();
			String key = object.getString("key");
			Object value = object.get("value");
			if(value==null){
				continue;
			}
			String mode = "";
			if(object.get("mode")==null){
				mode = null;
			}else{
				mode = object.getString("mode");
			}
			String type = "";
			if(object.get("type")==null){
				type = "string";
			}else{
				type = object.getString("type");
			}
			if(mode!=null){
				if("=,>,>=,<,<=,<>,%".indexOf(mode)==-1){
					mode = null;
				}
			}
			str.append(key);
			if(type.equals("string")){
				if(mode==null){
					str.append("=");
					str.append("'").append(value.toString()).append("'");
				}else if("%".equals(mode)){
					str.append(" like ");
					str.append("'%").append(value.toString()).append("%'");
				}else{
					str.append(" like ");
					str.append("'%").append(value.toString()).append("%'");
				}
			}else if(type.equals("number")){
				if (mode == null){
			          str.append("=");
				}else{
			        	str.append(mode);
			    }
				str.append(value.toString());
			}else if(type.equals("time")){

				String format = ((object.get("format") == null) || ("".equals(object.getString("format")))) ? "%Y-%m-%d %H:%i:%s" : object.getString("format");
					if (mode == null){
				          str.append("=");
					}else{
				        	str.append(mode);
				    }					
					str.append("date_format('").append(value.toString()).append("','").append(format).append("')");
			}else{
			}
			str.append(" and ");
		}
		if(str.length()>=5){
			return str.substring(0, str.length() - 5);
		}
		return "";
	}

}
