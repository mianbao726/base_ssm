package com.xx.base.util;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class ExecuteCommond {
	/**
	 * 执行命令
	 * @param cmd
	 * @return
	 */
	public static Process execute(String cmd){
		Process proc = null;
		try{
			proc = Runtime.getRuntime().exec(cmd);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
		}
		return proc;
	}
	
	/**
	 * 执行并打印执行结果
	 * @param cmd
	 * @return
	 */
	public static Object executePrintResult(String cmd){
		Process proc = null;
		try{
			proc = ExecuteCommond.execute(cmd);
			String cmdResult = new ProcessOutputReader().read(proc);
			System.out.println(proc.waitFor());
			System.out.println(cmd);
			System.out.println(cmdResult);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
		}
		return null;
	}
}

class ProcessOutputReader {
	private int lineCnt = 0;

	/**
	 * 返回输出到控制台的行数
	 * 
	 * @return
	 */
	public int getOutputLineCnt() {
		return lineCnt;
	}

	/**
	 * 读出控制台的输出
	 * 
	 * @param proc
	 * @return
	 */
	public String read(final Process proc) {
		final StringBuffer sb = new StringBuffer();

		final String lineSep = System.getProperty("os.name").toLowerCase().startsWith("windows") ? "\n\r" : "\n";

		Thread outputThread = new Thread() {
			public void run() {
				String line = "";
				BufferedReader reader = null;
				InputStream is = proc.getInputStream();
				InputStreamReader bis = null;
				try {
					bis = new InputStreamReader(new BufferedInputStream(is), System.getProperty("file.encoding"));
					reader = new BufferedReader(bis);
					while ((line = reader.readLine()) != null) {
						sb.append(line);
						sb.append(lineSep);
						lineCnt++;
					}
				} catch (IOException e) {
				} finally {
					try {
						reader.close();
					} catch (IOException e) {
					}
					try {
						bis.close();
					} catch (IOException e) {
					}
					try {
						is.close();
					} catch (IOException e) {
					}
				}
			}
		};

		Thread errorputThread = new Thread() {
			public void run() {
				String line = "";
				BufferedReader reader = null;
				InputStream is = proc.getErrorStream();
				InputStreamReader bis = null;
				try {
					bis = new InputStreamReader(new BufferedInputStream(is), System.getProperty("file.encoding"));
					reader = new BufferedReader(bis);
					while ((line = reader.readLine()) != null) {
						sb.append(line);
						sb.append(lineSep);
					}
				} catch (IOException e) {
				} finally {
					try {
						reader.close();
					} catch (IOException e) {
					}
					try {
						bis.close();
					} catch (IOException e) {
					}
					try {
						is.close();
					} catch (IOException e) {
					}
				}
			}
		};

		outputThread.start();
		errorputThread.start();

		try { // 等待进程执行结束
			proc.waitFor();
		} catch (InterruptedException e) {

		}

		try { // 在进程结束后，确保proc的输出流都被读入到sb中
			outputThread.join();
			errorputThread.join();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		return new String(sb);
	}
}