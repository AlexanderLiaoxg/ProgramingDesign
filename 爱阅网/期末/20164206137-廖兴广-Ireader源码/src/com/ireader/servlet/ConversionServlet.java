package com.ireader.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ireader.db.DbConnection;
import com.ireader.db.GetBelongValue;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class ConversionServlet
 */
@WebServlet("/ConversionServlet")
public class ConversionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConversionServlet() {
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
		String sql;
		int account = Integer.parseInt((String)session.getAttribute("account")) ;
		int down = Integer.parseInt(request.getParameter("down_value"));
		try {
			/*dwon是受到的,down_value是db里面的*/
			GetBelongValue g =new GetBelongValue();
			int point = g.getPoint(account);
			int down_value = g.getDown_volume(account);
			sql = "update belong_value set point = ? , down_volume = ? where account = ?";
			PreparedStatement ps = (PreparedStatement) DbConnection.getInstance().getConnection().prepareStatement(sql);
			ps.setInt(1, point-down*10);  //这里设计不好，应当改为宏变量
			ps.setInt(2, down_value+down);
			ps.setInt(3, account);
			System.out.println(point+"**** is pointer");
			System.out.println(down+"**** is down");
			System.out.println(down_value+"**** is down_value");
			request.setAttribute("message", "转换成功");
			ps.executeUpdate();
			request.getRequestDispatcher("ConversionSuceess.jsp").forward(request, response);
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
