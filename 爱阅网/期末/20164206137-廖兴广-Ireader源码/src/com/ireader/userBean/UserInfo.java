package com.ireader.userBean;

import java.util.Date;

public class UserInfo {
private String account;
private String name;
private String password;
private String phone;
private String sex;
private String idcard;
private String email;
private String shengfen;
private String is_vip;
private Date vipdate;
private String txt;
private Date creadt_time;

public UserInfo(String account, String name, String password, String phone, String sex, String idcard, String email,
		String shengfen, String is_vip, Date vipdate, String txt, Date creadt_time) {
	super();
	this.account = account;
	this.name = name;
	this.password = password;
	this.phone = phone;
	this.sex = sex;
	this.idcard = idcard;
	this.email = email;
	this.shengfen = shengfen;
	this.is_vip = is_vip;
	this.vipdate = vipdate;
	this.txt = txt;
	this.creadt_time = creadt_time;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public Date getCreadt_time() {
	return creadt_time;
}

public void setCreadt_time(Date creadt_time) {
	this.creadt_time = creadt_time;
}

public UserInfo() {
	// TODO Auto-generated constructor stub
}

public String getAccount() {
	return account;
}
public void setAccount(String account) {
	this.account = account;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
public String getIdcard() {
	return idcard;
}
public void setIdcard(String idcard) {
	this.idcard = idcard;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getShengfen() {
	return shengfen;
}
public void setShengfen(String shengfen) {
	this.shengfen = shengfen;
}
public String getIs_vip() {
	return is_vip;
}
public void setIs_vip(String is_vip) {
	this.is_vip = is_vip;
}
public Date getVipdate() {
	return vipdate;
}
public void setVipdate(Date vipdate) {
	this.vipdate = vipdate;
}
public String getTxt() {
	return txt;
}
public void setTxt(String txt) {
	this.txt = txt;
}
}
