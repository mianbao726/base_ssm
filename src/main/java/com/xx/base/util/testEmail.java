package com.xx.base.util;

import javax.mail.*;
import java.io.IOException;
import java.util.Properties;

public class testEmail {
	public static void main(String args[]) {
		// 邮件服务器参数
		final String user = "zhuwj2012@163.com"; // 邮箱验证用户名，一般第三方的POP，smtp服务，用户名为发送邮箱地址
		final String password = "sunny()***726"; // 邮箱验证授权码
		String host = "pop.163.com"; // 发送邮箱服务器
		// 第三方POP服务器可以不用设置port参数

		// 设置邮件服务器参数、服务器端口等参数
		Properties props = new Properties();
		props.put("mail.pop3.host", host);
		props.put("mail.pop3.auth", "true");
		props.put("mail.transport.protocol", "pop3");

		// 设置Session对象，同时配置验证方法
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		try {
			// 创建本地储存对象，并进行配置
			Store store = session.getStore("pop3s");
			store.connect(host, user, password);

			// 创建文件夹对象，用于读取本地邮件列表
			Folder folder = store.getFolder("INBOX");
			folder.open(Folder.READ_ONLY);

			// 从文件夹对象中获取每封邮件的Message对象
			Message[] messages = folder.getMessages();
			System.out.println("The count of the Email is :" + messages.length);

			// 输出所有邮件的信息
			int count = 1;
			Message message =  messages[messages.length-2];
//			for (Message message : messages) {
				System.out.println("---------------------------------------");
				System.out.println("Email No." + count++);
				System.out.println("Subject: " + message.getSubject());
				System.out.println("From: " + message.getFrom()[0]);
				System.out.println("Text: " + message.getContent().toString());
//				break;
//			}

			// 释放相关资源
			folder.close(false);
			store.close();

		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
