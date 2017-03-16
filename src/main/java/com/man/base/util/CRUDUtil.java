package com.man.base.util;

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

	/**
	 * 整理文件
	 * 
	 * @param packege
	 * @param targetName
	 * @param context
	 * @throws IOException
	 */
	public static ReadEntity o(ReadEntity context, KeyPoints points)
			throws IOException {
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

	public static void a(ReadEntity context, ClassBuilder cb)
			throws IOException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {
		 KeyPoints k = new KeyPoints(cb);
		 for (String s : o(context, k).getLines()) {
			 System.out.println(s);
			 a(s+System.getProperty("line.separator"), context.getTargetFile());
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
//			raf.writeBytes("\r\n");
//			raf.seek(target+"\r\n".getBytes().length);
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
	public static void w(ReadEntity context, ClassBuilder cb)
			throws IOException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {
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
	public static void w(ReadEntity context) throws IOException {
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
			sb.append(System.getProperty("line.separator"));
		}
		br.close();
		ret.sb = sb;
		ret.lines = lines;
		return ret;
	}

}
