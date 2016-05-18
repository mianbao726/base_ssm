package com.man.base.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

@SuppressWarnings("rawtypes")
public interface IUserService {
	public Map index(Map param);
	public int update(Map param);
	public Map insert(Map param);
	public Map selectOne(Map param);
	
	public int register(Map param);	
	public Long checkUniqueEmail(Map param);
	public Long checkUniqueUsername(Map param);
	
	public Map login(Map param,HttpServletRequest request);
	
}

