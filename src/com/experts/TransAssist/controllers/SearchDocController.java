package com.experts.TransAssist.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.experts.TransAssist.dao.DoctorDao;
import com.experts.TransAssist.entities.Doctor;


@SuppressWarnings("serial")
public class SearchDocController extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String dloc = req.getParameter("loc");
		if (dloc.equals("Location")) {
			dloc = null;
		}
		
		String dname = req.getParameter("docname");
		if (dname.equals("Doctor Name")) {
			dname = null;
		}
		
		DoctorDao ud = new DoctorDao();
		List<Doctor> l = ud.find(dloc, dname);
		HttpSession s=req.getSession();
		s.setAttribute("result1", l);
		if(s.getAttribute("mode")==null){
			res.sendRedirect("/listing-filter.jsp");
		}
		else{
		res.sendRedirect("/listing-filter2.jsp");
		}
	}

}
