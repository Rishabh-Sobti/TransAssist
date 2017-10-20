package com.experts.TransAssist.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.experts.TransAssist.entities.Doctor;
import com.experts.TransAssist.entities.User;
import com.experts.TransAssist.services.DoctorService;
import com.experts.TransAssist.services.MailService;
import com.experts.TransAssist.services.UserService;

@SuppressWarnings("serial")
public class ForgotPassController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String mail=req.getParameter("email");
		Doctor doc=(new DoctorService()).checkCredentials(mail);
		if(doc!=null){
			new MailService().forgotPass(doc.emailId, "Greetings!\n\n ALERT: This mail consists of password related information.\n You have requested for your password, if not, then ignore this mail. Your password is '"+doc.password+"'. Please change your password from the 'Account Settings' tab as soon as you login, for security purpose.\nAlways with you\nTeam TransAssist");
		}
		else{
			User user=(new UserService()).checkCredentials(mail);
			if(user!=null){
				new MailService().forgotPass(user.email, "Greetings!\n\n ALERT: This mail consists of password related information.\n You have requested for your password, if not, then ignore this mail. Your password is '"+user.password+"'. Please change your password from the 'Account Settings' tab as soon as you login, for security purpose.\nAlways with you\nTeam TransAssist");
			}
			else{
				new MailService().forgotPass(mail, "Greetings!\n\n You have requested for password related information at our website TransAssist, but this email id is not registered with us yet. To register yourself as a user/doctor on our webite, please visit transassist.com!\nAlways with you\nTeam TransAssist");
			}
		}
		res.sendRedirect("/index.jsp");
	}

}
