package com.ireader.userBean;

public class User {
private String account;
private String name;
private String password;
private String status;
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
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public User(String account, String name, String password, String status) {
	super();
	this.account = account;
	this.name = name;
	this.password = password;
	this.status = status;
}
}
