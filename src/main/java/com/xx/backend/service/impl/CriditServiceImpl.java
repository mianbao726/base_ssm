 /*
 * Copyright (c) 2017, 2017, WHATGOOGLE and/or its affiliates. All rights reserved.
 * WHATGOOGLE PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 */
 package com.xx.backend.service.impl;

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
import com.xx.base.util.map.QMap;
import com.xx.base.util.TimestampTool;

import com.xx.backend.service.CriditService;
/**
 * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj726@gmail.com)
 */
@Transactional
@Service
public class CriditServiceImpl extends PageServiceDao implements CriditService{

	@Resource
	private BaseDao baseDao;
	@Resource
	private PageServiceDao pageServiceDao;
	private static Logger log = Logger.getLogger(CriditServiceImpl.class);

	@Override
	public int add(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int del(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, Object> selectOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> queryPageForMap(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj726@gmail.com)
	 */
	public Map<String, Object>  index(Map<String, Object> map){
		return pageServiceDao.index("baseFrame_Cridit.cridit_page", map);
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj726@gmail.com)
	 */
	public String pay(){
		return null;
	}
}
