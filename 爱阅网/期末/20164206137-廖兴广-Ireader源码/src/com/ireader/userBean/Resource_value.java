package com.ireader.userBean;

public class Resource_value {
private int resource_id;
private int value;

public Resource_value(int resource_id, int value) {
	super();
	this.resource_id = resource_id;
	this.value = value;
}

public int getResource_id() {
	return resource_id;
}

public void setResource_id(int resource_id) {
	this.resource_id = resource_id;
}

public int getValue() {
	return value;
}

public void setValue(int value) {
	this.value = value;
}

}
