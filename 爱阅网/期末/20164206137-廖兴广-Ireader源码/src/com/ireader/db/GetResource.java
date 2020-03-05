package com.ireader.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.ireader.userBean.Resource;

public class GetResource {

	public GetResource() throws Exception {
		
	}
	
	public ArrayList<Resource> getResource() throws Exception {
		DbConnection d = DbConnection.getInstance();
		ArrayList<Resource> resources = new ArrayList<>();
		String sql = "select * from resource";
		String t[] = new String[10];
		Statement stmt = d.getStatement();
		ResultSet rs = stmt.executeQuery(sql);
		int colCount = rs.getMetaData().getColumnCount();
		SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		while (rs.next()) {
			for(int i= 1;i<=colCount;i++) {
				t[i-1] = rs.getString(i);
			}
			Date up_date = (Date) formatter.parse(t[9]);
			Resource r = new Resource(Integer.parseInt(t[0]), t[1], t[2], Integer.parseInt(t[3]), t[4], t[5],t[6], t[7],t[8],up_date);
			resources.add(r);
		}
		
		return resources;
		
	}
}
