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
 * Servlet implementation class Admin_ResourceChangeServlet
 */
@WebServlet("/Admin_ResourceChangeServlet")
public class Admin_ResourceChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_ResourceChangeServlet() {
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
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String value = request.getParameter("value");
		String part_file_path = request.getParameter("part_file_path");
		String file_path = request.getParameter("file_path");
		String img_path = request.getParameter("img_path");
		int account = Integer.parseInt(request.getParameter("up_account"));
		String user = request.getParameter("up_user");
		request.setAttribute("message", name);
		System.out.print(name+type+value+part_file_path+file_path+img_path+account+user);
		String sql = "update resource set uper_account = ?,resource_name = ? ,type = ?,value= ?,part_file_path = ? ,file_path = ?,img_path = ?,uper_name = ? where id = ?";
		try {
			PreparedStatement ps = (PreparedStatement) DbConnection.getInstance().getConnection().prepareStatement(sql);
			ps.setInt(1, account);
			ps.setString(2, name);
			ps.setString(3, type);
			ps.setString(4, value);
			ps.setString(5, part_file_path);
			ps.setString(6, file_path);
			ps.setString(7, img_path);
			ps.setString(8, user);
			ps.setInt(9, id);
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
