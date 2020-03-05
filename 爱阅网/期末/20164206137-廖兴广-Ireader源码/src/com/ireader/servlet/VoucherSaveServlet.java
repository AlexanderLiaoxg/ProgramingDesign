package com.ireader.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ireader.db.DbConnection;
import com.ireader.db.GetBelongValue;
import com.ireader.userBean.BelongValue;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class VocherSaveServlet
 */
@WebServlet("/VoucherSaveServlet")
public class VoucherSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoucherSaveServlet() {
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
		String voucher_type = request.getParameter("voucher_type");  /*充值类型*/
		String down_value = request.getParameter("down_value");  	/*下载卷*/
		//String money_time = request.getParameter("money_time");  	/*充VIP*/

		String sql;
		int account = Integer.parseInt((String)session.getAttribute("account")) ;
		int down = Integer.parseInt(down_value);
		int down_volume;        /*用户已有的下载卷*/
		try {
			down_volume = new GetBelongValue().getDown_volume(account);
			if(voucher_type.equals("voucher_down")) {
				sql = "update belong_value set down_volume = ? where account = ? ";
		
					System.out.println("This: " + down);
					System.out.println(down_volume);
					PreparedStatement ps = (PreparedStatement) DbConnection.getInstance().getConnection().prepareStatement(sql);
					ps.setInt(1, down_volume+down);
					ps.setInt(2, account);
					ps.executeUpdate();

				
			}
//			if(voucher_type=="voucher_vip") {
//				
//			}
			request.setAttribute("message", "充值成功");
			request.getRequestDispatcher("VoucherSuceess.jsp").forward(request, response);
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
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
