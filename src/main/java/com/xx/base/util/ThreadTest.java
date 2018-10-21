package com.xx.base.util;

import java.util.Scanner;

public class ThreadTest {
public static void main(String[] args) throws InterruptedException {
	for(int i =0 ;i <100;i++){
		System.out.println("start --- --- ");
		
		Thread.sleep(5000);
		 Scanner sc = new Scanner(System.in);
		 System.out.println("input code ... ...");
		 String scoreRtry = sc.nextLine();
		 System.out.println("重新输入后需要加分的成绩为："+scoreRtry+"分");
	        
	        System.out.println("end --- --- ");
	}
}
}
