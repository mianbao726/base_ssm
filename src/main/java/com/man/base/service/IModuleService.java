package com.man.base.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.man.base.util.IBaseService;

public interface IModuleService extends IBaseService{
	public List<Map<String,Object>> selectMenuForUser(HttpServletRequest request,Map<String,Object> map);
	public List<Map<String,Object>> loadMenuData(List<Map<String,Object>> list);
	public List<Map<String,Object>> getSysData();
	public List<Map<String,Object>> getWebModuleTree(Map<String,Object> map);
	public List<Map<String,Object>> getPadModuleTree(Map<String,Object> map);
	public Map getPermissonInfo(Map m);
	

}
