package com.xx.base.util;

import java.util.Map;

public interface IBaseService {
	/**
	 * 添加一条数据
	 * @param map
	 * @return
	 */
	public int add(Map<String,Object> map);
	/**
	 * 根据条件更新一条数据
	 * @param map
	 * @return
	 */
	public int update(Map<String,Object> map);
	/**
	 * 根据ID删除数据,可以同时删除多条,map参数为一个名为ids的集合
	 * @param map
	 * @return
	 */
	public int del(Map<String,Object> map);
	/**
	 * 根据条件查询一条数据
	 * @param id
	 * @return
	 */
	public Map<String,Object> selectOne(Map<String,Object> map);
	/**
	 * 返回分页查询列表
	 * @param map
	 * @return
	 */
	public Map<String,Object> queryPageForMap(Map<String,Object> map);
}
