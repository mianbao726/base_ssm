package com.xx.base.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class testAUTOlogin {
	public static void main(String[] args) throws Exception {
		testAUTOlogin loginDemo = new testAUTOlogin();
		loginDemo.login("your account", "password");// 输入CSDN的用户名，和密码
		
		// https://www.cnblogs.com/cha1r/archive/2013/11/06/3410966.html
	}

	/**
	 * 模拟登陆CSDN
	 * 
	 * @param userName
	 *            用户名
	 * @param pwd
	 *            密码
	 * 
	 * **/
	public void login(String userName, String pwd) throws Exception {
		  java.io.InputStream  in;
	      java.net.URL url = new java.net.URL("http://www.zoowj.com/");
	      java.net.HttpURLConnection connection = (java.net.HttpURLConnection)
	          url.openConnection();
	      connection = (java.net.HttpURLConnection) url.openConnection();
	     //模拟成IE
	      connection.setRequestProperty("User-Agent","Mozilla/4.0 (compatible; MSIE 6.0; Windows 2000)");
	      connection.connect();
	      in = connection.getInputStream();
	      java.io.BufferedReader breader =
	          new BufferedReader(new InputStreamReader(in , "UTF8"));
	      String str=breader.readLine();
	      while(str != null){
	        System.out.println(str);
	        str=breader.readLine();
	      }
	}
}
