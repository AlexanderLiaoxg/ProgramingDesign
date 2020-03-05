package com.ireader.db;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ireader.userBean.BelongValue;
import com.ireader.userBean.Resource_value;

public class GetResource_value {
	public ArrayList<Resource_value> getResource_value() throws Exception {
		DbConnection d = DbConnection.getInstance();
		ArrayList<Resource_value> resource_values = new ArrayList<>();
		String sql = "select * from resource_value";
		String t[] = new String[2];
		Statement stmt = d.getStatement();
		ResultSet rs = stmt.executeQuery(sql);
		int colCount = rs.getMetaData().getColumnCount();
		
		while (rs.next()) {
			for(int i= 1;i<=colCount;i++) {
				t[i-1] = rs.getString(i);
			}
			Resource_value r = new Resource_value(Integer.parseInt(t[0]),  Integer.parseInt(t[1]));
			resource_values.add(r);
		}
		return resource_values;
		
	}
	
	public int getResourceValue(int id) throws Exception {
		ArrayList<Resource_value> resource_values = this.getResource_value();
		for(int i= 1;i<=resource_values.size();i++) {
			if(id==resource_values.get(i-1).getResource_id()) {
	
				return resource_values.get(i-1).getValue();
			}
		}
		return 0;
	}
	
	
}
