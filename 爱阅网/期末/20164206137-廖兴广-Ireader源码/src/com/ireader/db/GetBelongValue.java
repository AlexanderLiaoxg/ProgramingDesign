package com.ireader.db;

import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.ireader.userBean.BelongValue;

public class GetBelongValue {
	public ArrayList<BelongValue> getBelongValue() throws Exception {
		DbConnection d = DbConnection.getInstance();
		ArrayList<BelongValue> belongValues = new ArrayList<>();
		String sql = "select * from belong_value";
		String t[] = new String[3];
		Statement stmt = d.getStatement();
		ResultSet rs = stmt.executeQuery(sql);
		int colCount = rs.getMetaData().getColumnCount();
		
		while (rs.next()) {
			for(int i= 1;i<=colCount;i++) {
				t[i-1] = rs.getString(i);
			}
			BelongValue r = new BelongValue(Integer.parseInt(t[0]),  Integer.parseInt(t[1]), Integer.parseInt(t[2]));
			belongValues.add(r);
		}
		return belongValues;
		
	}
	
	public int getDown_volume(int account) throws Exception {
		ArrayList<BelongValue> belongValues = this.getBelongValue();
		for(int i= 1;i<=belongValues.size();i++) {
			if(account==belongValues.get(i-1).getAccount()) {
	
				return belongValues.get(i-1).getDown_volume();
			}
		}
		return 0;
		
	}
	
	public int getPoint(int account) throws Exception {
		ArrayList<BelongValue> belongValues = this.getBelongValue();
		for(int i= 1;i<=belongValues.size();i++) {
			if(account==belongValues.get(i-1).getAccount()) {
	
				return belongValues.get(i-1).getPoint();
			}
		}
		return 0;
		
	}
}
