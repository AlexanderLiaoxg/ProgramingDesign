package com.ireader.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ireader.db.DbConnection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class UpSaveServlet
 */
@WebServlet("/UpSaveServlet")
public class UpSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpSaveServlet() {
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
		/*me*/
        HttpSession session = request.getSession();
        String name = (String) request.getAttribute("file_name");
        String type = (String) request.getAttribute("type");
        String uploadPath = (String) request.getAttribute("uploadPath");
 
        String fileName = (String) request.getAttribute("fileName");
        int value =1;
        String file_path = uploadPath + "/down_resource/" +fileName;
        /*修改为图片格式,手动。。。。到时候进一步上传文件自动化就好了,图片必须放到项目路径下面*/
        String img_path=request.getContextPath()  +"/img/Download/"+ name + ".jpg";
        String part_file_path=request.getContextPath()  +"/part/"+ fileName;
    
        System.out.println("********************"+uploadPath);
        int userAccount =Integer.valueOf((String) session.getAttribute("account"));
        String userName =(String) session.getAttribute("name");
        String sql = "insert into resource(resource_name,type,value,part_file_path,file_path,img_path,uper_account,uper_name,up_time) values('"+name+"','"+type+"',?,'"+part_file_path+"','"+file_path+"','"+img_path+"',?,'"+userName+"',?)" ;
        try {
			DbConnection d = DbConnection.getInstance();
		        Date now = new Date();
				Timestamp timeStamp = new Timestamp(now.getTime());
				PreparedStatement ps = (PreparedStatement) DbConnection.getInstance().getConnection().prepareStatement(sql);
				ps.setInt(1, value);
				ps.setInt(2, userAccount);
				ps.setTimestamp(3, timeStamp);
				ps.executeUpdate();
				System.out.println("插入到数据库");
				request.getRequestDispatcher("UpSuceess.jsp").forward(request, response);
				
				/*积分*/
//				sql = "update belong_value set point = old.point+10 where account = ?";
//				PreparedStatement p2 = (PreparedStatement) DbConnection.getInstance().getConnection().prepareStatement(sql);
//				p2.setInt(1, userAccount);
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
