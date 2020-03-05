package com.ireader.userBean;

import java.util.Date;

public class Resource {
private int id;
private String resource_name;
private String type;
private int value;
private String part_file_path;
private String file_path;
private String img_path;
private String uper_account;
private String uper_name;
public String getPart_file_path() {
	return part_file_path;
}
public void setPart_file_path(String part_file_path) {
	this.part_file_path = part_file_path;
}
private Date up_time;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getResource_name() {
	return resource_name;
}
public void setResource_name(String resource_name) {
	this.resource_name = resource_name;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public int getValue() {
	return value;
}
public void setValue(int value) {
	this.value = value;
}
public String getFile_path() {
	return file_path;
}
public void setFile_path(String file_path) {
	this.file_path = file_path;
}
public String getImg_path() {
	return img_path;
}
public void setImg_path(String img_path) {
	this.img_path = img_path;
}
public String getUper_account() {
	return uper_account;
}
public void setUper_account(String uper_account) {
	this.uper_account = uper_account;
}
public String getUper_name() {
	return uper_name;
}
public void setUper_name(String uper_name) {
	this.uper_name = uper_name;
}
public Date getUp_time() {
	return up_time;
}
public void setUp_time(Date up_time) {
	this.up_time = up_time;
}
public Resource(int id, String resource_name, String type, int value, String part_file_path, String file_path,
		String img_path, String uper_account, String uper_name, Date up_time) {
	super();
	this.id = id;
	this.resource_name = resource_name;
	this.type = type;
	this.value = value;
	this.part_file_path = part_file_path;
	this.file_path = file_path;
	this.img_path = img_path;
	this.uper_account = uper_account;
	this.uper_name = uper_name;
	this.up_time = up_time;
}


}
