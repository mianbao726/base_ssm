package com.xx.base.util;

import javax.annotation.Resource;

import com.xx.base.dao.SingleBaseDao;

public class TestThread {
	@Resource
	private static SingleBaseDao baseDao;

	public static void insert() {
		baseDao = new SingleBaseDao();
		baseDao.insert("baseFrame_Cridit.getCreditInfos");
	}

	public static void main(String[] args) throws InterruptedException {
		System.out.println(1);
		TestThread.insert();
		for (int i = 0; i < 10; i++) {
			Thread.sleep(1000);
			System.err.println("do it... ...");
			if (i == 5) {
				break;
			}
		}
		System.out.println(2);
	}
}
