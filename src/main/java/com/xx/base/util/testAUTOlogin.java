package com.xx.base.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

public class testAUTOlogin {
	public static void main(String[] args) throws Exception {
		testAUTOlogin loginDemo = new testAUTOlogin();
		loginDemo.login("your account", "password");// 输入CSDN的用户名，和密码
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
		try {
			HttpClient client = new DefaultHttpClient();                //构建一个Client
			HttpPost post = new HttpPost("http://192.168.1.199:8080/cmcms");    //构建一个POST请求
			//构建表单参数
			List<NameValuePair> formParams = new ArrayList<NameValuePair>();
			formParams.add(new BasicNameValuePair("user_name", "admin"));
			formParams.add(new BasicNameValuePair("password", "111111"));
			UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formParams, "UTF-8");//将表单参数转化为“实体”
			post.setEntity(entity);        //将“实体“设置到POST请求里
			HttpResponse response = client.execute(post);//提交POST请求
			HttpEntity result = response.getEntity();//拿到返回的HttpResponse的"实体"
			String content = EntityUtils.toString(result);;            //用httpcore.jar提供的工具类将"实体"转化为字符串打印到控制台
			System.out.println(content);
			if(content.contains("登陆成功")){
				System.out.println("登陆成功！！！");
			}
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
}
