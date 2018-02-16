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
package com.xx.backend.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xx.base.util.IBaseService;

/**
 * @author generate by www.whatgoogle.com (ps : some question? contact
 *         zhuwj726@gmail.com)
 */
public interface CriditService extends IBaseService {

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	public Map<String, Object> index(Map<String, Object> map);
	
	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	public Map<String, Object> detail(Map<String, Object> map);

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	public String pay(Map<String, Object> map);
	
	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	public Map<String, List> getCreditInfos(Map<String, Object> map);
	

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj726@gmail.com)
	 */
	public String setBillInfo(Map<String, Object> map);
}
