package com.ireader.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ireader.db.DbConnection;
import com.ireader.userBean.User;
import com.ireader.userBean.UserInfo;

/**
 * Servlet implementation class RegisterSvaeServlet
 */
@WebServlet("/RegisterSvaeServlet")
public class RegisterSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterSaveServlet() {
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
		try {
			System.out.print("JINGRU***********************************************************");
			DbConnection d = DbConnection.getInstance();
			String sql;
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String idcard = request.getParameter("idcard");
			String sex = request.getParameter("sex");
			String shengfen = request.getParameter("shengfen");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			//Date vipdate = new Date();
			String txt = request.getParameter("txt");
			Date create_time = new Date();
			Timestamp timeStamp = new Timestamp(create_time.getTime()); 
			/*注意SQL语句添加变量的格式*/
			sql = "insert into userinfo(name,password,idcard,sex,shengfen,is_vip,vipdate,email,phone,txt,creat_time)values('"+name+"','"+password+"','"+idcard+"','"+sex+"','"+shengfen+"',?,?,'"+email+"','"+phone+"','"+txt+"',?)";
			//sql = "insert into userinfo(name) values ('"+name+"')";
			System.out.println(sql);
			d.insert(d.getStatement(), sql);
			
			/*获得账户*/
			ArrayList<UserInfo> users = d.seeAlluserInfo(d.getStatement());
			HttpSession session = request.getSession();
			session.setAttribute("name", name);
			session.setAttribute("account", users.get(users.size()-1).getAccount());
			request.getRequestDispatcher("RegisterSuceess.jsp").forward(request, response);
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
