package com.ireader.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ireader.db.GetResource;
import com.ireader.userBean.Resource;

/**
 * Servlet implementation class ToSearchServlet
 */
@WebServlet("/ToSearchServlet")
public class ToSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToSearchServlet() {
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
		String find_name = (String)request.getParameter("to_search");
		ArrayList<Resource> resources;
		try {
			resources = new GetResource().getResource();
			ArrayList<Resource> search_result = new ArrayList<>();
			System.out.println("搜索名字：[" + find_name+"]");
			for(int i=0;i<resources.size();i++) {
				System.out.println("遍历：[" + resources.get(i).getResource_name()+"]");
				if(resources.get(i).getResource_name().equals(find_name)) {
					search_result.add(resources.get(i));
					System.out.println("进入");
				}
			}
			request.setAttribute("searchResources",search_result);
			request.getRequestDispatcher("SearchResult.jsp").forward(request, response);
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
