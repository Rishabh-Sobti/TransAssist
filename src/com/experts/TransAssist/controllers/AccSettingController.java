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
public class AccSettingController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession s=req.getSession(false);
		Doctor doc=(Doctor)s.getAttribute("curr_doc");
		String pass=req.getParameter("pass");
		if(doc!=null){
			if(doc.password.equals(pass)){
				res.sendRedirect("/acc-setting2.jsp");
			}
			else{
				res.sendRedirect("/signOut");
			}
		}
		else{
			User us=(User)s.getAttribute("curr_user");
			if(us.password.equals(pass)){
				res.sendRedirect("/acc-setting1.jsp");
			}
			else{
				res.sendRedirect("/signOut");
			}
		}
	}

}
