package com.ireader.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ireader.db.GetResource;
import com.ireader.mapper.MenuMapper;
import com.ireader.userBean.Menu;

/**
 * Servlet implementation class showMenu
 */
@WebServlet("/Admin_ShowMenu")
public class Admin_ShowMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_ShowMenu() {
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
			System.out.println("jinru  show");
			MenuMapper mapper = new MenuMapper();
			 request.setAttribute("menus", mapper.showMenu());
			 HttpSession session = request.getSession();
			 session .setAttribute("userinfos", mapper.showUserinfos());
			 session.setAttribute("resource_list", new GetResource().getResource());
			 request.getRequestDispatcher("Admin_index.jsp").forward(request, response);
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
