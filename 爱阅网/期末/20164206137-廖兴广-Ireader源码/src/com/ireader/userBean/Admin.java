package com.ireader.userBean;

public class Admin {
	private int account;
	private String password;
	public Admin(int account, String password) {
		super();
		this.account = account;
		this.password = password;
	}
	public int getAccount() {
		return account;
	}
	public void setAccount(int account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
