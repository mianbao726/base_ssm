package com.xx.base.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.RandomAccessFile;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

public class CRUDUtil {

	private static final String SOURCE_PACKAGE_01 = "src";
	private static final String SOURCE_PACKAGE_02 = "main";
	private static final String SOURCE_PACKAGE_03 = "java";

	public static final String COM = "com";

	public static final String XX = "xx";
	public static final String CONTROLLER = "controller";
	public static final String SERVICE = "service";
	public static final String SERVICE_IMPL = "impl";
	public static final String SERVICE_FILENAME = "Service.java";
	public static final String SERVICE_FILENAME_IMPL = "ServiceImpl.java";

	/**
	 * 先添加系统分割符再添加字符串
	 * 
	 * WSF => with Separator first
	 * 
	 * @param sb
	 * @param context
	 * @return
	 */
	public static StringBuilder appendWSF(StringBuilder sb, String context) {
		sb = appendSeparator(sb);
		sb.append(context);
		return sb;

	}

	/**
	 * 添加一个分隔符号
	 * 
	 * @param sb
	 * @return
	 */
	public static StringBuilder appendSeparator(StringBuilder sb) {
		sb.append(File.separator);
		return sb;
	}

	/**
	 * 获取定制的模板 模板规则 至少四位数字： 1.千位及以上是大模板编号 ，个十百位是模板下的子模板代号
	 * 2.cotroller为000，controll的方法000+1 3.千位大模板枚举 1.默认springmvc模板
	 * 
	 * @param c
	 *            000 => controller 000+1 => controller method
	 * @return
	 */
	public static String getTemplate(int c) {
		
		System.out.println(c);
		File directory = new File("");// 设定为当前文件夹
		StringBuilder sb = new StringBuilder(directory.getAbsolutePath());
		
		sb = appendWSF(sb, SOURCE_PACKAGE_01);
		sb = appendWSF(sb, SOURCE_PACKAGE_02);
		sb = appendWSF(sb, SOURCE_PACKAGE_03);
		sb = appendWSF(sb, COM);
		sb = appendWSF(sb, XX);
		sb = appendWSF(sb, "base");
		sb = appendWSF(sb, "template");
		sb = appendWSF(sb, "defaultversion");
		
		switch (c) {
		case 1000:// controller
			sb = appendWSF(sb, "controller");
			sb = appendWSF(sb, "DefaultController");
			break;
		case 1001://controller method
			sb = appendWSF(sb, "controller");
			sb = appendWSF(sb, "methodController");
			break;
		case 1002:// service
			sb = appendWSF(sb, "service");
			sb = appendWSF(sb, "DefaultService");
			break;
		case 1005:// service method
			sb = appendWSF(sb, "service");
			sb = appendWSF(sb, "methodService");
			break;
		default:
			break;
		}
		return sb.toString();
	}

	/**
	 * 生成目标文件路径
	 * 
	 * 0默认springmvc模板
	 * 
	 * @param c
	 *            类型
	 * @param infos
	 *            用户前段填写的参数
	 * @return
	 */
	public static String getTemplate(int c, String[] infos) {
		System.out.println(c);
		File directory = new File("");// 设定为当前文件夹
		File folder ;
		StringBuilder sb = new StringBuilder(directory.getAbsolutePath());
		sb = appendWSF(sb, SOURCE_PACKAGE_01);
		sb = appendWSF(sb, SOURCE_PACKAGE_02);
		sb = appendWSF(sb, SOURCE_PACKAGE_03);
		sb = appendWSF(sb, COM);
		sb = appendWSF(sb, infos[0]);
		sb = appendWSF(sb, infos[1]);
		switch (c) {
		case 1000:// controller
			sb = appendWSF(sb, CONTROLLER);
			folder = new File(sb.toString());
			if (!folder.exists()) {
				folder.mkdirs();
			}
			sb = appendWSF(sb, upperCaseFirstCharacter(infos[2]) + "Controller.java");
			break;
		case 1001:// service
			sb = appendWSF(sb, SERVICE);
			folder = new File(sb.toString());
			if (!folder.exists()) {
				folder.mkdirs();
			}
			sb = appendWSF(sb, upperCaseFirstCharacter(infos[2]) + SERVICE_FILENAME);
			break;
		case 1002:// service
			sb = appendWSF(sb, SERVICE);
			folder = new File(sb.toString());
			if (!folder.exists()) {
				folder.mkdirs();
			}
			sb = appendWSF(sb, upperCaseFirstCharacter(infos[2]) + SERVICE_FILENAME);
			break;
		default:
			break;
		}
		return sb.toString();
	}
	
	/**
	 * 首字母大写
	 * 
	 * @return
	 */
	public static String upperCaseFirstCharacter(String str) {
		return str.substring(0, 1).toUpperCase() + str.substring(1);
	}
	
	

	
	/**
	 * 首字母小写
	 * 
	 * @return
	 */
	public static String lowerCaseFirstCharacter(String str) {
		return str.substring(0, 1).toLowerCase() + str.substring(1);
	}


	/**
	 * 整理文件
	 * 
	 * @param packege
	 * @param targetName
	 * @param context
	 * @throws IOException
	 */
	public static XXEntity o(XXEntity context, KeyPoints points) throws IOException {
		List<String> readlines = context.getLines();
		List<String> lines = new ArrayList<String>();
		for (String line : readlines) {
			for (KeyPoints.Point point : points.getPoints()) {
				line = line.replace(point.k, point.v);
			}
			lines.add(line);
		}
		context.setLines(lines);
		return context;
	}

	static String src = "/home/zhuwj/git/base_ssm/src/main/java/com/man/base/template/defaultversion/controller/methodController";

	/**
	 * 
	 * @param context
	 * @throws IOException
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws InvocationTargetException
	 * @throws NoSuchMethodException
	 * @throws SecurityException
	 */
	public static void a(XXEntity context) throws IOException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {
		ClassBuilder cb = context.getCb();
		KeyPoints k = new KeyPoints(cb);
		for (String s : o(context, k).getLines()) {
			System.out.println(s);
			a(s + System.getProperty("line.separator"), context.getTargetFile());
		}
	}

	/**
	 * 
	 * @param target
	 *            跳过多少过字节进行插入数据
	 * @param str
	 *            要插入的字符串
	 * @param fileName
	 *            文件路径
	 */
	public static void a(String str, String fileName) {
		long target = 0l;
		try {
			RandomAccessFile raf = new RandomAccessFile(fileName, "rw");
			if (target < 0 || target > raf.length()) {
				System.out.println("跳过字节数无效");
				return;
			}
			target = raf.length() - 2;
			byte[] b = str.getBytes();
			raf.setLength(raf.length() + b.length);
			for (long i = raf.length() - 1; i > b.length + target - 1; i--) {
				raf.seek(i - b.length);
				byte temp = raf.readByte();
				raf.seek(i);
				raf.writeByte(temp);
			}
			raf.seek(target);
			// raf.writeBytes("\r\n");
			// raf.seek(target+"\r\n".getBytes().length);
			raf.write(b);
			raf.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 追加新方法
	 * 
	 * @param fileName
	 * @return
	 * @throws IOException
	 */
	// public static BufferedWriter a(ReadEntity context,boolean
	// flag,BufferedWriter p_writer)
	// throws IOException {
	// File file = new File(context.getTargetFile());
	// if (!file.exists()) {
	// file.createNewFile();
	// }
	// FileWriter fw = new FileWriter(context.getTargetFile(),true&&flag);
	// BufferedWriter writer = null;
	// try {
	// writer = !flag ? new BufferedWriter(fw) : p_writer;
	// for (String s : context.getLines()) {
	// if("//context end".equals(s.toString())){
	// ReadEntity c = r(src);
	// writer = a(c,true,writer);
	// System.out.println(s.toString());
	// }
	// writer.write(s.toString());
	// writer.newLine();// 换行
	// }
	// writer.flush();
	// } catch (FileNotFoundException e) {
	// e.printStackTrace();
	// } catch (IOException e) {
	// e.printStackTrace();
	// } finally {
	// try {
	// writer.close();
	// fw.close();
	// } catch (IOException e) {
	// e.printStackTrace();
	// }
	// }
	// }

	/**
	 * 替换参数
	 * 
	 * @param context
	 * @param cb
	 * @throws IOException
	 * @throws SecurityException
	 * @throws NoSuchMethodException
	 * @throws InvocationTargetException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	public static void pw(XXEntity context) throws IOException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {
		ClassBuilder cb = context.getCb();
		KeyPoints k = new KeyPoints(cb);
		w(o(context, k));
	}

	/**
	 * 写入文件信息
	 * 
	 * @param fileName
	 * @return
	 * @throws IOException
	 */
	private static void w(XXEntity context) throws IOException {
		File file = new File(context.getTargetFile());
		if (!file.exists()) {
			file.createNewFile();
		}
		FileWriter fw = null;
		BufferedWriter writer = null;
		try {
			fw = new FileWriter(file);
			writer = new BufferedWriter(fw);
			for (String s : context.getLines()) {
				writer.write(s.toString());
				writer.newLine();// 换行
			}
			writer.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				writer.close();
				fw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 读取文件信息
	 * 
	 * @param fileName
	 * @return
	 * @throws IOException
	 */
	public static XXEntity r(int templateNo) throws IOException {
		
		String fileName = CRUDUtil.getTemplate(templateNo);
		
		List<String> lines = new ArrayList<String>();
		XXEntity ret = new XXEntity();
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(fileName), "UTF-8"));
		String line = null;
		StringBuilder sb = new StringBuilder();
		while ((line = br.readLine()) != null) {
			lines.add(line);
			sb.append(line);
			sb.append(System.getProperty("line.separator"));
		}
		br.close();
		ret.sb = sb;
		ret.lines = lines;
		return ret;
	}

	/**
	 * 读取文件信息并设置目标文件路径
	 * 
	 * @param fileName
	 * @return
	 * @throws IOException
	 */
	public static XXEntity rs(int templateNo,String[] infos) throws IOException {
		
		XXEntity ret = r(templateNo);//读取模板文件
		String tar = CRUDUtil.getTemplate(templateNo, infos).toString();
		ret.setTargetFile(tar);//设置目标文件路径
		ret.setCb(Claxx.getClaxx(templateNo,infos));// 类信息（包名、import、requestmapping 等）
		return ret;
	}
	
	/**
	 * 读取文件信息并设置目标文件路径
	 * 
	 * 方法
	 * 
	 * @param fileName
	 * @return
	 * @throws IOException
	 */
	public static XXEntity rs(int templateNo,int swift,String[] infos,String functionName) throws IOException {
		System.out.println(templateNo + "  " +swift);
		XXEntity ret = r(templateNo+swift);//读取模板文件
		String tar = CRUDUtil.getTemplate(templateNo, infos).toString();
		ret.setTargetFile(tar);//设置目标文件路径
		ClassBuilder cb = XX_Method.getInstance(templateNo+swift,
				functionName,//method_name
				"String", //return_name
				"", //param_name
				functionName, //request_name
				CRUDUtil.lowerCaseFirstCharacter(infos[2]), //pack_name
				functionName//page_name
				);
		ret.setCb(cb);// 类信息（包名、import、requestmapping 等）
		return ret;
	}
	
}
