package com.experts.TransAssist.controllers;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.experts.TransAssist.entities.User;
import com.experts.TransAssist.services.SaveEntityService;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;

@SuppressWarnings("serial")
public class UserAccSettController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String pass=req.getParameter("password");
		String repass=req.getParameter("rePassword");
		if(pass.equals(repass)!=true){
			res.sendRedirect("/user-dashboard.jsp");
		}
		else{
BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
		
		Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);
		
		List<BlobKey> blobKeys = blobs.get("proPic");
		
		String proPic=blobKeys.get(0).getKeyString();

		User user=new User(req.getParameter("name"), Date.valueOf(req.getParameter("bday")), req.getParameter("gender"), req.getParameter("loc"), req.getParameter("employ"), req.getParameter("Contact"), req.getParameter("Email"), req.getParameter("facebook"), req.getParameter("twitter"), req.getParameter("gplus"), req.getParameter("aboutme"), req.getParameter("hobbies"), proPic, pass);
		HttpSession s=req.getSession(false);
		s.setAttribute("curr_user", user);
		SaveEntityService.saveUser(user);
		res.sendRedirect("/user-dashboard.jsp");}
	}

}
