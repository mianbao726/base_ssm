package com.xx.base.util;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;
 
/**
 * MySQL数据库备份
 * 
 */
public class testBackups {
 
    /**
     * Java代码实现MySQL数据库导出
     * 
     * @author GaoHuanjie
     * @param hostIP MySQL数据库所在服务器地址IP
     * @param userName 进入数据库所需要的用户名
     * @param password 进入数据库所需要的密码
     * @param savePath 数据库导出文件保存路径
     * @param fileName 数据库导出文件文件名
     * @param databaseName 要导出的数据库名
     * @return 返回true表示导出成功，否则返回false。
     */
    public static boolean exportDatabaseTool(String hostIP, String userName, String password, String savePath, String fileName, String databaseName) {
        
    	File saveFile = new File(savePath);
       
        if (!saveFile.exists()) {// 如果目录不存在
           
        	saveFile.mkdirs();// 创建文件夹
        }
        
        if (!savePath.endsWith(File.separator)) {
           
        	savePath = savePath + File.separator;
        }
        StringBuilder stringBuilder = new StringBuilder();
        
        /*windows 环境*/
//        stringBuilder.append("cmd.exe /c E:\\DB\\mysql-5.6.17-winx64\\bin\\mysqldump.exe").append(" -h").append(hostIP);
      
        /*linux 环境*/
        stringBuilder.append("mysqldump").append(" -h").append(hostIP);
        
        stringBuilder.append(" -u").append(userName) .append(" -p").append(password).append(" "+databaseName);
        
        stringBuilder.append(" > ").append(savePath + fileName);
        
        try {
        	Process process = Runtime.getRuntime().exec(stringBuilder.toString());
        	
        	System.out.println(stringBuilder.toString()+"@"+process.waitFor());

//			Process process = Runtime.getRuntime().exec("regedit.exe");
			
        	if (process.waitFor() == 0) {// 0 表示线程正常终止。
			
        		return true;
			}	
		}catch (InterruptedException e) {
			
			e.printStackTrace();
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
    	return false;
    }
 
    public static void main(String[] args) throws InterruptedException {
    	Date date=new Date();
    	SimpleDateFormat df=new SimpleDateFormat("yyyy.MM.dd|hh:mm:ss");
    	String cmd = "mysqldump -h127.0.0.1 -uwb -pwb wb  --result-file="+PathUtil.getSourcesPath()+df.format(date)+".sql";
    	ExecuteCommond.executePrintResult(cmd);
		
    }
}

