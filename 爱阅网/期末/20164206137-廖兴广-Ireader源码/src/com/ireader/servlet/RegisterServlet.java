package com.ireader.servlet;

import java.io.IOException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ireader.db.DbConnection;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		HttpSession session = request.getSession();
		String name = request.getParameter("name");
		String idcard = request.getParameter("idcard");
		try {
			DbConnection d = DbConnection.getInstance();
			Statement stmt = d.getStatement();
			/*name*/
			if(name!=null) {
				if(d.is_exit(name, stmt,"name")) {
					System.out.println("has saved");
					response.getWriter().print("<img src='img/Register/no.png' style='margin:auto;float:left;padding-top:5px;padding-right:5px'/><div style='float:left'><font size='2'>用户已存在</font></div>?false");
				}else {
					response.getWriter().print("<img src='img/Register/ok.png' style='margin:auto;float:left;padding-top:3px;padding-right:4px'/><div style='float:left'><font size='2'>用户名可以用</font></div>?true");
				}
			}
			/*idcard*/
			if(idcard!=null) {
				if(d.is_exit(idcard, stmt, "idcard")) {
					response.getWriter().print("<img src='img/Register/no.png' style='margin:auto;float:left;padding-top:5px;padding-right:5px'/><div style='float:left'><font size='2'>一个身份证只能注册一次</font></div>?false");
				}else {
					response.getWriter().print("<img src='img/Register/ok.png' style='margin:auto;float:left;padding-top:3px;padding-right:4px'/><div style='float:left'><font size='2'></font></div>?true");
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
