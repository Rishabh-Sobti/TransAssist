package com.experts.TransAssist.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.experts.TransAssist.entities.Doctor;
import com.experts.TransAssist.entities.User;
import com.experts.TransAssist.services.DoctorService;
import com.experts.TransAssist.services.UserService;

@SuppressWarnings("serial")
public class LoginController extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		String email = req.getParameter("email");
		String pass = req.getParameter("password");
		Doctor doc = (new DoctorService()).checkCredentials(email);
		if (doc != null) {
			if (doc.password.equals(pass)) {
				HttpSession sess = req.getSession();
				sess.setMaxInactiveInterval(60 * 60 * 24);
				sess.setAttribute("mode", new Integer(1));
				sess.setAttribute("curr_doc", doc);
				res.sendRedirect("/user-dashboard.jsp");
			} else{
				res.setContentType("text/html");
				PrintWriter out=res.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Oops! Wrong password, please try again!');");
				out.println("location='index.jsp';");
				out.println("</script>");
			}

		} else {
			User user = (new UserService()).checkCredentials(email);
			if (user != null) {
				if (user.password.equals(pass)) {
					HttpSession sess = req.getSession();
					sess.setMaxInactiveInterval(60 * 60 * 24);
					sess.setAttribute("mode", new Integer(0));
					sess.setAttribute("curr_user", user);
					res.sendRedirect("/user-dashboard.jsp");
				} else {
					res.setContentType("text/html");
					PrintWriter out = res.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Oops! Wrong password, please try again!');");
					out.println("location='index.jsp';");
					out.println("</script>");
				}
			} else {
				res.setContentType("text/html");
				PrintWriter out = res.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('You are not yet registered with us, please register first');");
				out.println("location='index.jsp';");
				out.println("</script>");
			}
		}
	}

}
