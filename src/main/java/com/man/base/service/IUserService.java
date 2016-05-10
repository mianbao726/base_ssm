package com.man.base.service;

import java.util.Map;

public interface IUserService {
//	public Map getUserById(Map param);
	public Map index(Map param);
	public Map update(Map param);
	public Map insert(Map param);
	public Map selectOne(Map param);
}
