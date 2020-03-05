package com.ireader.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ireader.db.GetResource;
import com.ireader.userBean.Resource;

/**
 * Servlet implementation class ToMyResourceServlet
 */
@WebServlet("/ToMyResourceServlet")
public class ToMyResourceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToMyResourceServlet() {
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
			HttpSession session = request.getSession();
			String account = (String) session.getAttribute("account");
			ArrayList<Resource> resources = new GetResource().getResource();
			ArrayList<Resource> my = new ArrayList<>();
			System.out.println("账户跳转完成[" + account+"]");
			for(int i=0;i<resources.size();i++) {
				if(resources.get(i).getUper_account().equals(account)) {
					my.add(resources.get(i));
				}
			}
			request.setAttribute("myResources",my);
			request.getRequestDispatcher("MyResource.jsp").forward(request, response);
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
