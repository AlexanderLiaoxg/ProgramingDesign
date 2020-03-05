package com.ireader.db;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.ireader.userBean.Admin;
import java.sql.Statement;

public class GetAdmin {
	public ArrayList<Admin> getAdmin() throws Exception {
		ArrayList<Admin> admins = new ArrayList<>();
		String[] t = new String[2];
		DbConnection d = DbConnection.getInstance();
		Statement stmt = (Statement) d.getStatement();
		ResultSet rs = stmt.executeQuery("select * from Admin_Manager");
		int colCount = rs.getMetaData().getColumnCount();
		while(rs.next()) {
			for(int i= 1;i<=colCount;i++) {
				t[i-1] = rs.getString(i);
			}
			Admin a = new Admin(Integer.parseInt(t[0]), t[1]);
			admins.add(a);
		}
		return admins;
		
	}
}
