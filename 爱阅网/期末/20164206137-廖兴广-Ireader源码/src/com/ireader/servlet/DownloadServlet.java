package com.ireader.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ireader.db.DbConnection;
import com.ireader.db.GetBelongValue;
import com.ireader.db.GetResource;
import com.ireader.db.GetResource_value;
import com.ireader.userBean.Resource;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class DownloadServlet
 */
@WebServlet("/DownloadServlet")
public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadServlet() {
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
		System.out.println("进入下载:" + request.getParameter("resource_id"));
		int id =Integer.parseInt((String)request.getParameter("resource_id"));
		String filepath = (String)request.getParameter("filepath");
		int account = Integer.parseInt((String)session.getAttribute("account"));

		GetBelongValue g = new GetBelongValue();
		GetResource_value gv = new GetResource_value();
//		ArrayList<Resource> rs;
//		try {
//			rs = new GetResource().getResource();
//
//		for(int i=0;i<rs.size();i++) {
//			if(rs.get(i).getId()==id) {
//				 filepath = rs.get(i).getFile_path();/*完整的下载路径*/
//			}
//		}
		try {
		
		/*扣除下载费用并下载*/
		String sql = "update belong_value set down_volume = ? where account = ?";
			int balance = g.getDown_volume(account);//banlance有余额的意思
			int value = gv.getResourceValue(id);
			PreparedStatement ps =(PreparedStatement) DbConnection.getInstance().getConnection().prepareStatement(sql);
			ps.setInt(1, balance - value);
			ps.setInt(2, account);
			ps.executeUpdate();
		
		
		/*下载，流的方式，还有转发的方式*/
	
	    response.setContentType("applicaiton/x-download"); 
	    response.addHeader("Content-Disposition", "attachment;filename="+filepath); 
	      
	    InputStream is = null; 
	    OutputStream os = null; 
	    BufferedInputStream bis = null; 
	    BufferedOutputStream bos = null; 
	      
	    is = new FileInputStream(new File(filepath)); 
	    bis = new BufferedInputStream(is); 
	    os = response.getOutputStream();  
	    bos = new BufferedOutputStream(os); 
	      
	    byte[] b = new byte[1024]; 
	    int len = 0; 
	    while((len = bis.read(b)) != -1){ 
	      bos.write(b,0,len); 
	    } 
	      
	    bis.close(); 
	    is.close(); 
	    bos.close(); 
	    os.close();
	    
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
