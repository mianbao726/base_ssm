package com.xx.base.util;

import java.util.List;


/**
 * 读取的模板信息
 * 
 * 目标文件路径
 * 
 * 目标文件类信息
 * 
 * @author zhuwj
 *
 */
public class XXEntity {
	//目标文件 绝对路径
	String targetFile;
	List<String> lines;
	StringBuilder sb;
	String count;
	ClassBuilder cb;
	
	public ClassBuilder getCb() {
		return cb;
	}
	public void setCb(ClassBuilder cb) {
		this.cb = cb;
	}
	public String getTargetFile() {
		return targetFile;
	}
	public void setTargetFile(String targetFile) {
		this.targetFile = targetFile;
	}
	public List<String> getLines() {
		return lines;
	}
	public StringBuilder getSb() {
		return sb;
	}
	public String getCount() {
		return count;
	}
	public void setLines(List<String> lines) {
		this.lines = lines;
	}
	
}
