package com.xx.base.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class SystemCommond {
	
	/**
	 * 默认方式备份数据库
	 * @return
	 */
	public static String backupDateBase() {
		String cmd = "mysqldump -h127.0.0.1 -uwb -pwb wb  --result-file=" + PathUtil.getSourcesPath() + DateUtil.getDateTitle() + ".sql";
		return cmd;
	}

	/**
	 * 使用ip,username,password,databasename,path备份数据库
	 * @param ip
	 * @param username
	 * @param pwd
	 * @param db
	 * @param path
	 * @return
	 */
	public static String backupDateBase(String ip, String username, String pwd, String db, String path) {
		String cmd = "mysqldump -h"+ip+" -u"+username+" -p"+pwd+" "+db+"  --result-file=" + path + ".sql";
		return cmd;
	}
}
