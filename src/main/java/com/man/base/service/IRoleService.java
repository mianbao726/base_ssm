package com.man.base.service;

import java.util.List;
import java.util.Map;

import com.man.base.util.IBaseService;

public interface IRoleService  extends IBaseService {
	public int addRoleModule(Map<String, Object> map);

	public List<Map<String, Object>> selectRoleForUser(Map<String, Object> map);

	public List<Map<String, Object>> getAllRole(Map<String, Object> map);

	public List<Map<String, Object>> getRoleActions(Map<String, Object> map);

}
