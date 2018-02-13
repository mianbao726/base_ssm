package com.xx.base.util;

 
/**
 * MySQL数据库备份
 * 
 */
public class testBackups {
 
    public static void main(String[] args) throws InterruptedException {
    	ExecuteCommond.executePrintResult(SystemCommond.backupDateBase());
    }
}

