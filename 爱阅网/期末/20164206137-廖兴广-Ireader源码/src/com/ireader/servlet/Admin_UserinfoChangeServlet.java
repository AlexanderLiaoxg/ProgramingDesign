package com.ireader.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ireader.db.DbConnection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class Admin_ChangeServlet
 */
@WebServlet("/Admin_UserinfoChangeServlet")
public class Admin_UserinfoChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_UserinfoChangeServlet() {
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
		int account = Integer.parseInt(request.getParameter("account"));
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String idcard = request.getParameter("idcard");
		String email = request.getParameter("email");
		String shengfen = request.getParameter("shengfen");
		request.setAttribute("message", name);
		String sql = "update userinfo set name = ?,sex = ?,idcard= ?,email = ?,shengfen = ? where account = ?";
		try {
			PreparedStatement ps = (PreparedStatement) DbConnection.getInstance().getConnection().prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, sex);
			ps.setString(3, idcard);
			ps.setString(4, email);
			ps.setString(5, shengfen);
			ps.setInt(6, account);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//request.getRequestDispatcher("message.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
