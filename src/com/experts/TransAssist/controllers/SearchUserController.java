package com.experts.TransAssist.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.experts.TransAssist.dao.UserDao;
import com.experts.TransAssist.entities.User;

@SuppressWarnings("serial")
public class SearchUserController extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uloc = req.getParameter("Location");
		if (uloc.equals("Location")) {
			uloc = null;
		}
		String uname = req.getParameter("Username");
		if (uname.equals("Username")) {
			uname = null;
		}
		UserDao ud = new UserDao();
		List<User> l = ud.find(uloc, uname);
		HttpSession s=req.getSession(false);
		s.setAttribute("result", l);
		res.sendRedirect("/SearchUser.jsp");

	}

}
