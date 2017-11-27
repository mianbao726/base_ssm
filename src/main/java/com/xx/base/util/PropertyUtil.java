package com.xx.base.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PropertyUtil {
    private static final Logger logger = LoggerFactory.getLogger(PropertyUtil.class);
    private static Properties props;
    static{
    	logger.info("初始化加载... ...");
        loadProps("jdbc.properties");
        loadProps("switch.properties");
    }

    synchronized static private void loadProps(String  targetfilename){
        logger.info("开始加载properties文件内容.......");
        props = new Properties();
        InputStream in = null;
        try {
        	//第一种，通过类加载器进行获取properties文件流
            in = PropertyUtil.class.getClassLoader().getResourceAsStream(targetfilename);
            //第二种，通过类进行获取properties文件流
            //in = PropertyUtil.class.getResourceAsStream("/jdbc.properties");
            props.load(in);
        } catch (FileNotFoundException e) {
            logger.error("jdbc.properties文件未找到");
        } catch (IOException e) {
            logger.error("出现IOException");
        } finally {
            try {
                if(null != in) {
                    in.close();
                }
            } catch (IOException e) {
                logger.error("jdbc.properties文件流关闭出现异常");
            }
        }
        logger.info("加载properties文件内容完成...........");
        logger.info("properties文件内容：" + props);
    }

    public static String getProperty(String key){
        if(null == props) {
            loadProps("jdbc.properties");
        }
        return props.getProperty(key);
    }
    
    public static String getProperty(String filename,String key){
        if(null == props) {
            loadProps(filename);
        }
        return props.getProperty(key);
    }

//    public static String getProperty(String key, String defaultValue) {
//        if(null == props) {
//            loadProps("jdbc.properties");
//            loadProps("switch.properties");
//        }
//        return props.getProperty(key, defaultValue);
//    }
    public static void main(String[] args) {
    	System.out.println(PropertyUtil.getProperty("username"));
    	System.out.println(PropertyUtil.getProperty("interceptor"));
	}
}