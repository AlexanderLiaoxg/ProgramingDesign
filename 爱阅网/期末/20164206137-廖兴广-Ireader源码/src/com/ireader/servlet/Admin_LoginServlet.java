package com.ireader.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ireader.db.GetAdmin;
import com.ireader.userBean.Admin;

/**
 * Servlet implementation class Admin_LoginServlet
 */
@WebServlet("/Admin_LoginServlet")
public class Admin_LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_LoginServlet() {
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
		String password = request.getParameter("password");
		try {
			ArrayList<Admin> admins = new GetAdmin().getAdmin();
			for(int i=0;i<admins.size();i++) {
				if(account==admins.get(i).getAccount()&&password.equals(admins.get(i).getPassword())) {
					System.out.println("ok");
					request.getRequestDispatcher("Admin_ShowMenu").forward(request, response);
				}else {
					System.out.println("fail");
					request.getRequestDispatcher("Admin_Login.jsp").forward(request, response);;
				}
			}
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
