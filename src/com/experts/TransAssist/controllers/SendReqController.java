package com.experts.TransAssist.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.experts.TransAssist.entities.Doctor;
import com.experts.TransAssist.entities.User;
import com.experts.TransAssist.services.DoctorService;
import com.experts.TransAssist.services.SaveEntityService;
import com.experts.TransAssist.services.UserService;

@SuppressWarnings("serial")
public class SendReqController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession s=req.getSession(false);
		String reqTo=new String();
		int accept=0;
		int ignore=0;
		if(req.getParameter("userId").equals("null")){
			reqTo=req.getParameter("docId");
			Doctor requestTo=new DoctorService().checkCredentials(reqTo);
			Doctor d=(Doctor)s.getAttribute("curr_doc");
			if(d!=null){
				for(int i=0; i<d.friendsPending.size(); i++){
					if(d.friendsPending.get(i).equals(reqTo)){
						d.friendsPending.remove(i);
						d.friends.add(reqTo);
						requestTo.reqSent.remove(d.emailId);
						requestTo.friends.add(d.emailId);
						accept=1;
					}
				}
				for(int i=0; i<d.reqSent.size(); i++){
					if(d.reqSent.get(i).equals(reqTo)){
						ignore=1;
					}
				}
				if(accept==0 && ignore==0){
					requestTo.friendsPending.add(d.emailId);
					d.reqSent.add(reqTo);
				}
				s.setAttribute("curr_doc", d);
				SaveEntityService.saveDoc(d);
			}
			else{
				User u=(User)s.getAttribute("curr_user");
				for(int i=0; i<u.friendsPending.size(); i++){
					if(u.friendsPending.get(i).equals(reqTo)){
						u.friendsPending.remove(i);
						u.friends.add(reqTo);
						requestTo.reqSent.remove(u.email);
						requestTo.friends.add(u.email);
						accept=1;
					}
				}
				for(int i=0; i<u.reqSent.size(); i++){
					if(u.reqSent.get(i).equals(reqTo)){
						ignore=1;
					}
				}
				if(accept==0 && ignore==0){
					requestTo.friendsPending.add(u.email);
					u.reqSent.add(reqTo);
				}
				s.setAttribute("curr_user", u);
				SaveEntityService.saveUser(u);
			}
			SaveEntityService.saveDoc(requestTo);
			res.sendRedirect("/checkDoc?docId="+reqTo);
		}
		else{
			reqTo=req.getParameter("userId");
			User requestTo=new UserService().checkCredentials(reqTo);
			Doctor d=(Doctor)s.getAttribute("curr_doc");
			if(d!=null){
				for(int i=0; i<d.friendsPending.size(); i++){
					if(d.friendsPending.get(i).equals(reqTo)){
						d.friendsPending.remove(i);
						d.friends.add(reqTo);
						requestTo.reqSent.remove(d.emailId);
						requestTo.friends.add(d.emailId);
						accept=1;
					}
				}
				for(int i=0; i<d.reqSent.size(); i++){
					if(d.reqSent.get(i).equals(reqTo)){
						ignore=1;
					}
				}
				if(accept==0 && ignore==0){
					requestTo.friendsPending.add(d.emailId);
					d.reqSent.add(reqTo);
				}
				s.setAttribute("curr_doc", d);
				SaveEntityService.saveDoc(d);
			}
			else{
				User u=(User)s.getAttribute("curr_user");
				for(int i=0; i<u.friendsPending.size(); i++){
					if(u.friendsPending.get(i).equals(reqTo)){
						u.friendsPending.remove(i);
						u.friends.add(reqTo);
						requestTo.reqSent.remove(u.email);
						requestTo.friends.add(u.email);
						accept=1;
					}
				}
				for(int i=0; i<u.reqSent.size(); i++){
					if(u.reqSent.get(i).equals(reqTo)){
						ignore=1;
					}
				}
				if(accept==0 && ignore==0){
					requestTo.friendsPending.add(u.email);
					u.reqSent.add(reqTo);
				}
				s.setAttribute("curr_user", u);
				SaveEntityService.saveUser(u);
			}
			SaveEntityService.saveUser(requestTo);
			res.sendRedirect("/checkUser?userId="+reqTo);
		}
		
	}

}
