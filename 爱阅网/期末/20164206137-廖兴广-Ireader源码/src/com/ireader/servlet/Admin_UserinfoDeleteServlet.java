package com.ireader.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ireader.db.DbConnection;
import com.ireader.userBean.UserInfo;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class Admin_UerinfoDeleteServlet
 */
@WebServlet("/Admin_UserinfoDeleteServlet")
public class Admin_UserinfoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_UserinfoDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int account = Integer.parseInt((String)request.getParameter("account"));
		String sql = "delete from userinfo where account = ?";
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) DbConnection.getInstance().getConnection().prepareStatement(sql);
			ps.setInt(1, account);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
