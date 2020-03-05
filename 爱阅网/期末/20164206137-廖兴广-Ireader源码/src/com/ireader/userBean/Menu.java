package com.ireader.userBean;

public class Menu {
	private int id;
	private String text;
	private int pid;
	private int is_parent;
	private String fileName;
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int isIs_parent() {
		return is_parent;
	}
	public void setIs_parent(int is_parent) {
		this.is_parent = is_parent;
	}

}
