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
 
    public static void main(String[] args) throws InterruptedException {
    	ExecuteCommond.executePrintResult(SystemCommond.backupDateBase());
    }
}

