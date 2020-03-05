package com.ireader.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ireader.userBean.Menu;
import com.ireader.userBean.User;
import com.ireader.userBean.UserInfo;
import com.mysql.jdbc.PreparedStatement;

public class DbConnection {
	public static DbConnection onlyOne;
	private static Connection con;
	private Statement stmt;

	public DbConnection() {

	}

	public static DbConnection getInstance() throws Exception {
		String Driver = "com.mysql.jdbc.Driver";
		String Url = "jdbc:mysql://localhost:3306/ireader";
		String User = "root";
		String Password = "123456";
		Class.forName(Driver);
		if (onlyOne == null) {
			onlyOne = new DbConnection();
			onlyOne.con = DriverManager.getConnection(Url, User, Password);
			onlyOne.stmt = con.createStatement();
			System.out.println("连接数据库成功");
		} else {
			System.out.println("只能由一个数据库连接实例! ");
		}
		return onlyOne;
	}

	public Statement getStatement() {
		return stmt;

	}
	
	public Connection getConnection() {
		return con;
	}

	public List<Menu> seeAllMenus(Statement stmt) throws Exception {
		List<Menu> menus = new ArrayList();
		String amenu[] = new String[5];
		String sql = "select * from menu";
		ResultSet rs = stmt.executeQuery(sql);
		int colCount = rs.getMetaData().getColumnCount();
		while (rs.next()) {
			Menu m = new Menu();
			for (int i = 1; i <= colCount; i++) {
				amenu[i - 1] = rs.getString(i);
			}
			m.setId(Integer.valueOf(amenu[0]));
			m.setText(amenu[1]);
			m.setPid(Integer.valueOf(amenu[2]));
			m.setIs_parent(Integer.valueOf(amenu[3]));
			m.setFileName(amenu[4]);
			menus.add(m);
		}
		return menus;
	}

	
	public ArrayList<UserInfo> seeAlluserInfo(Statement stmt) throws Exception {
		ArrayList<UserInfo> userinfos = new ArrayList();
		String users[] = new String[12];
		String sql = "select * from userinfo";
		ResultSet rs = stmt.executeQuery(sql);
		int colCount = rs.getMetaData().getColumnCount();
		SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		while (rs.next()) {
			for (int i = 1; i <= colCount; i++) {
				users[i - 1] = rs.getString(i);
				System.out.print(users[i - 1]);
			}
			Date vipDate = (Date) formatter.parse(users[9]);
			Date createDate = (Date) formatter.parse(users[11]);
			UserInfo userinfo = new UserInfo(users[0], users[1], users[2], users[3], users[4], users[5], users[6],
					users[7], users[8], vipDate, users[10], createDate);
			userinfos.add(userinfo);
		}
		return userinfos;
	}


	public boolean is_exit(String value, Statement stmt2, String type) throws Exception {
		// TODO Auto-generated method stub
		ArrayList<UserInfo> lists = new ArrayList<>();
		lists = (ArrayList<UserInfo>) seeAlluserInfo(stmt2);
		if (type.equals("name")) {
			for (int i = 0; i < lists.size(); i++) {
				if (value.equals(lists.get(i).getName())) {
					return true;
				}
			}
		}
		if (type.equals("idcard")) {
			for (int i = 0; i < lists.size(); i++) {
				if (value.equals(lists.get(i).getIdcard())) {
					return true;
				}
			}
		}
		if (type.equals("account")) {
			for (int i = 0; i < lists.size(); i++) {
				if (value.equals(lists.get(i).getAccount())) {
					return true;
				}
			}
		}
		return false;
	}

	public void insert(Statement stmt, String sql) {
		try {
			Date now = new Date();
			Timestamp timeStamp = new Timestamp(now.getTime());
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
			ps.setString(1, "false");
			ps.setTimestamp(2, timeStamp);
			ps.setTimestamp(3, timeStamp);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean password_is_right(Statement stmt,String account,String password) throws Exception {
		
		ArrayList<User> lists = new ArrayList<>();
		lists = (ArrayList<User>) seeAlluser(stmt);

			for (int i = 0; i < lists.size(); i++) {
				if (account.equals(lists.get(i).getAccount())&&password.equals(lists.get(i).getPassword())) {
					return true;
				}
			}

		return false;
		
	}
	
	
	public ArrayList<User> seeAlluser(Statement stmt) throws Exception {
		ArrayList<User> user = new ArrayList();
		String users[] = new String[4];
		String sql = "select * from users";
		ResultSet rs = stmt.executeQuery(sql);
		int colCount = rs.getMetaData().getColumnCount();
		while (rs.next()) {
			for (int i = 1; i <= colCount; i++) {
				users[i - 1] = rs.getString(i);
				System.out.print(users[i - 1]);
			}
			User u = new User(users[0], users[1], users[2], users[3]);
			user.add(u);
		}
		return user;
	}
	
	public String getName(String account) throws Exception {
		ArrayList<User> lists = new ArrayList<>();
		lists = (ArrayList<User>) seeAlluser(stmt);
		System.out.println("This account"+account);
			for (int i = 0; i < lists.size(); i++) {
				if(lists.get(i).getAccount().equals(account)) {
					return lists.get(i).getName();
				}
			}
		return "欢迎您！";
		
	}

}
