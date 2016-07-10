package com.man.wb.course.service;

import java.util.List;
import java.util.Map;

import com.man.base.util.IBaseService;

public interface ICourseService extends IBaseService {

	public List<Map<String, Object>> getCoursesCount(Map<String, Object> map);
	public int add(Map<String, Object> map);
	
}
