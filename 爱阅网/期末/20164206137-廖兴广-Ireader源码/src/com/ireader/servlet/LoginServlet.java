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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String account = request.getParameter("account");
		String password = request.getParameter("login_password");
		HttpSession session = request.getSession();
		try {
			if(session.getAttribute("account")==null&&session.getAttribute("password")==null) {
				DbConnection d = DbConnection.getInstance();
				Statement stmt = d.getStatement();
				/*account*/
					if(d.is_exit(account, stmt,"account")) {
						if(d.password_is_right(d.getStatement(),account,password)) {
							String name = d.getName(account);
							session.setAttribute("name", name);
							System.out.print("set name" + name);
							session.setAttribute("account", account);
							System.out.print("set account" + account);
							response.getWriter().print("<font color='red'/>欢迎您，亲爱的，<font/>"+name+"?true");

						}else {
							response.getWriter().print("<img src='img/Register/no.png' style='margin:auto;float:left;padding-top:5px;padding-right:5px'/><div style='float:left'><font size='2'>密码错误！</font></div>?false");
						}
						
					}else {
						response.getWriter().print("<img src='img/Register/no.png' style='margin:auto;float:left;padding-top:3px;padding-right:4px'/><div style='float:left'><font size='2'>账户错误！</font></div>?false");
					}
			}else {
				String name;
				name = (String) session.getAttribute("name");
				response.getWriter().print("<font color='red'/>欢迎您，亲爱的，<font/>"+name+"?true");
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
