package com.experts.TransAssist.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.experts.TransAssist.entities.Doctor;
import com.experts.TransAssist.entities.User;
import com.experts.TransAssist.extraClasses.Comment;
import com.experts.TransAssist.services.DoctorService;
import com.experts.TransAssist.services.SaveEntityService;

@SuppressWarnings("serial")
public class RateController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession s=req.getSession(false);
		Doctor doc=new DoctorService().checkCredentials(req.getParameter("docId"));
		if(doc.review.size()>5){
			doc.review.remove(0); 
		}
		doc.review.add(new Comment((User)s.getAttribute("curr_user"), req.getParameter("rev")));
		doc.rate[1]=(doc.rate[0]*doc.rate[1]+Integer.parseInt(req.getParameter("1")))/(doc.rate[0]+1);
		doc.rate[2]=(doc.rate[0]*doc.rate[2]+Integer.parseInt(req.getParameter("2")))/(doc.rate[0]+1);
		doc.rate[3]=(doc.rate[0]*doc.rate[3]+Integer.parseInt(req.getParameter("3")))/(doc.rate[0]+1);
		doc.rate[4]=(doc.rate[0]*doc.rate[4]+Integer.parseInt(req.getParameter("4")))/(doc.rate[0]+1);
		doc.rate[5]=(doc.rate[0]*doc.rate[5]+Integer.parseInt(req.getParameter("5")))/(doc.rate[0]+1);
		doc.rate[0]=doc.rate[0]+1;
		s.setAttribute("DocToOpen", doc);
		SaveEntityService.saveDoc(doc);
		res.sendRedirect("/user-profile(layout-1).jsp");
	}

}
