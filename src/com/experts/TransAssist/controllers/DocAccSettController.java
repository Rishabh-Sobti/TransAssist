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

import com.experts.TransAssist.entities.Doctor;
import com.experts.TransAssist.services.SaveEntityService;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;

@SuppressWarnings("serial")
public class DocAccSettController extends HttpServlet {
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
		Doctor doc=new Doctor(req.getParameter("name"), Date.valueOf(req.getParameter("bday")), req.getParameter("gender"), proPic, Long.parseLong(req.getParameter("Contact")), Long.parseLong(req.getParameter("Fax")), req.getParameter("Email"), req.getParameter("website"), Integer.parseInt(req.getParameter("Expe")), req.getParameter("degree"), req.getParameter("specsf"), req.getParameter("role"), req.getParameter("clicname"), Integer.parseInt(req.getParameter("Dur")), req.getParameter("roledes"), req.getParameter("stradd"), req.getParameter("loc"), req.getParameter("state"), req.getParameter("city"), Integer.parseInt(req.getParameter("pin")), req.getParameter("AboutMe"), pass);
HttpSession s=req.getSession(false);
		s.setAttribute("curr_doc", doc);
		SaveEntityService.saveDoc(doc);
		res.sendRedirect("/user-dashboard.jsp");}
	}

}
