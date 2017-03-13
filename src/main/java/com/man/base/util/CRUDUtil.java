package com.man.base.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class CRUDUtil {

	/**
	 * 整理文件
	 * 
	 * @param packege
	 * @param targetName
	 * @param context
	 * @throws IOException
	 */
	public static ReadEntity o(ReadEntity context,KeyPoints points)
			throws IOException {
		List<String> readlines = context.getLines();
		List<String> lines = new ArrayList<String>();
		for(String line : readlines){
			for(KeyPoints.Point point : points.getPoints()){
				line = line.replace(point.k, point.v);
			}
			lines.add(line);
		}
		context.setLines(lines);
		return context;
	}
	static String src = "/home/zhuwj/git/base_ssm/src/main/java/com/man/base/template/defaultversion/controller/methodController";
	
	
	public static void a(ReadEntity context,ClassBuilder cb,boolean flag)
			throws IOException {
		KeyPoints k = new KeyPoints(cb);
		a(context, flag);
	}
	/**
	 * 追加新方法
	 * 
	 * @param fileName
	 * @return
	 * @throws IOException
	 */
	public static void a(ReadEntity context,boolean flag)
			throws IOException {
		File file = new File(context.getTargetFile());
		if (!file.exists()) {
			file.createNewFile();
		}
		FileWriter fw =  new FileWriter(context.getTargetFile(),true&&flag);  
		BufferedWriter writer = null;
		try {
			writer = new BufferedWriter(fw);
			for (String s : context.getLines()) {
				if("//context end".equals(s.toString())){
					ReadEntity c = r(src);
					a(c,true);
					System.out.println(s.toString());
				}
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
	 * 替换参数
	 * @param context
	 * @param cb
	 * @throws IOException
	 */
	public static void w(ReadEntity context,ClassBuilder cb)
			throws IOException {
		KeyPoints k = new KeyPoints(cb);
		o(context, k);
	}
	/**
	 * 写入文件信息
	 * 
	 * @param fileName
	 * @return
	 * @throws IOException
	 */
	public static void w(ReadEntity context)
			throws IOException {
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
	public static ReadEntity r(String fileName) throws IOException {
		List<String> lines = new ArrayList<String>();
		ReadEntity ret = new ReadEntity();
		BufferedReader br = new BufferedReader(new InputStreamReader(
				new FileInputStream(fileName), "UTF-8"));
		String line = null;
		StringBuilder sb = new StringBuilder();
		while ((line = br.readLine()) != null) {
			lines.add(line);
			sb.append(line);
			sb.append("\r\n");
		}
		br.close();
		ret.sb = sb;
		ret.lines = lines;
		return ret;
	}


}
