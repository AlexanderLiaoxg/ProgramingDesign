package com.ireader.mapper;

import java.util.List;

import javax.xml.ws.RespectBinding;

import com.ireader.db.DbConnection;
import com.ireader.userBean.Menu;
import com.ireader.userBean.UserInfo;

public class MenuMapper {
	   List<Menu> menus;
	   List<UserInfo> userinfos;
	   DbConnection d = new DbConnection();
		public 	MenuMapper() throws Exception{			
			d = DbConnection.getInstance();
			menus = d.seeAllMenus(d.getStatement());
			userinfos =  d.seeAlluserInfo(d.getStatement());
		}
		public List showMenu() {
			return menus;
		}
		
		public List showUserinfos() {
			return userinfos;
		}
}
