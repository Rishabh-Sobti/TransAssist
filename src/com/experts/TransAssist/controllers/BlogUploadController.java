package com.experts.TransAssist.controllers;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.experts.TransAssist.entities.Doctor;
import com.experts.TransAssist.entities.User;
import com.experts.TransAssist.extraClasses.Post;
import com.experts.TransAssist.services.SaveEntityService;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;

@SuppressWarnings("serial")
public class BlogUploadController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();

		Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);

		List<BlobKey> blobKeys = blobs.get("pic");

		String proPic = blobKeys.get(0).getKeyString();
		Post p = new Post(proPic, req.getParameter("sub"), req.getParameter("content"));
		HttpSession s = req.getSession(false);
		Doctor doc = (Doctor) s.getAttribute("curr_doc");
		if (doc != null) {
			doc.posts.add(p);
			s.setAttribute("curr_doc", doc);
			SaveEntityService.saveDoc(doc);
		} else {
			User u = (User) s.getAttribute("curr_user");
			u.posts.add(p);
			s.setAttribute("curr_user", u);
			SaveEntityService.saveUser(u); 
		}

		res.sendRedirect("/my-profile.jsp");
	}

}
