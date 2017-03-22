package com.xx.base.util;

import java.util.List;

public class ReadEntity {
	//目标文件 绝对路径
	String targetFile;
	List<String> lines;
	StringBuilder sb;
	String count;
	
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
