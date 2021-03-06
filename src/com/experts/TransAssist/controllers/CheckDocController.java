package com.experts.TransAssist.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.experts.TransAssist.entities.Doctor;
import com.experts.TransAssist.entities.User;

@SuppressWarnings("serial")
public class CheckDocController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String doc=req.getParameter("docId");
		HttpSession s=req.getSession(false);
		int mode=0;
		Doctor d=(Doctor)s.getAttribute("curr_doc");
		if(d!=null){
			for(int i=0; i<d.friends.size(); i++){
				if(d.friends.get(i).equals(doc)){
					mode=1;
				}
			}
			if(doc.equals(d.emailId)){
				mode=2;
			}
		}
		else{
			User u=(User)s.getAttribute("curr_user");
			for(int i=0; i<u.friends.size(); i++){
				if(u.friends.get(i).equals(doc)){
					mode=1;
				}
			}
			if(doc.equals(u.email)){
				mode=2;
			}
		}
		if(mode==0){
			res.sendRedirect("/user-profile(layout-1)4.jsp?docId="+doc);
		}
		else if(mode==1){
			res.sendRedirect("/user-profile(layout-1).jsp?docId="+doc);
		}
		else{
			res.sendRedirect("/my-profile.jsp");
		}
	}

}
