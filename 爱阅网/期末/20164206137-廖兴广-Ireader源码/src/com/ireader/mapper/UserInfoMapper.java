package com.ireader.mapper;

import java.util.List;

import com.ireader.db.DbConnection;
import com.ireader.userBean.Menu;
import com.ireader.userBean.UserInfo;

public class UserInfoMapper {
	   List<UserInfo> userInfos;
	   DbConnection d = new DbConnection();
		public 	UserInfoMapper() throws Exception{			
			d = DbConnection.getInstance();
			userInfos = d.seeAlluserInfo(d.getStatement());
		}
		public List showUserInfos() {
			return userInfos;
			
		}
}
