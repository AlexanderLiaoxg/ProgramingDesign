package com.ireader.service;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class OnLineListenner implements HttpSessionListener{
	private int onLineNum;
	
	 public OnLineListenner() {
	        // TODO Auto-generated constructor stub
		 onLineNum=0;
	    	System.out.println("在线人数监听器创建成功");
	    }

	
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		onLineNum++;
    	arg0.getSession().setAttribute("onLineNum", new Integer(onLineNum));
	}


	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent arg0)  { 
         // TODO Auto-generated method stub
    	onLineNum--;
    	arg0.getSession().setAttribute("onLineNum", onLineNum);
    }
}
