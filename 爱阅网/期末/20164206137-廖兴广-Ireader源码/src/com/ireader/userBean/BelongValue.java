package com.ireader.userBean;

public class BelongValue {
private int account;
private int point;
private int	down_volume;
public int getAccount() {
	return account;
}
public void setAccount(int account) {
	this.account = account;
}
public int getPoint() {
	return point;
}
public void setPoint(int point) {
	this.point = point;
}
public int getDown_volume() {
	return down_volume;
}
public void setDown_volume(int down_volume) {
	this.down_volume = down_volume;
}
public BelongValue(int account, int point, int down_volume) {
	super();
	this.account = account;
	this.point = point;
	this.down_volume = down_volume;
}
}
