package com.experts.TransAssist.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.experts.TransAssist.dao.DoctorDao;
import com.experts.TransAssist.dao.UserDao;
import com.experts.TransAssist.entities.Doctor;
import com.experts.TransAssist.entities.Message;
import com.experts.TransAssist.entities.User;
import com.experts.TransAssist.services.SaveEntityService;

@SuppressWarnings("serial")
public class ChattingController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession s = req.getSession(false);
		Doctor doc = (Doctor) s.getAttribute("curr_doc");
		if (doc != null) {
			for (int i = 0; i < doc.myChats.size(); i++) {
				if (doc.myChats.get(i).with.equals(req.getParameter("with"))) {
					doc.myChats.get(i).chat.add(new Message(doc.name+" : "+req.getParameter("message"), doc.emailId));
					if ((new DoctorDao().check(doc.myChats.get(i).with)) != null) {
						Doctor rec = new DoctorDao().check(doc.myChats.get(i).with);
						for (int j = 0; j < rec.myChats.size(); j++) {
							if (rec.myChats.get(j).with.equals(doc.emailId)) {
								rec.myChats.get(j).chat.add(new Message(doc.name+" : "+req.getParameter("message"), doc.emailId));
								break;
							}
						}
						SaveEntityService.saveDoc(rec);
					} else if ((new UserDao().check(doc.myChats.get(i).with)) != null) {
						User rec = new UserDao().check(doc.myChats.get(i).with);
						for (int j = 0; j < rec.myChats.size(); j++) {
							if (rec.myChats.get(j).with.equals(doc.emailId)) {
								rec.myChats.get(j).chat.add(new Message(doc.name+" : "+req.getParameter("message"), doc.emailId));
								break;
							}
						}
						SaveEntityService.saveUser(rec);
					}
					break;
				}
			}
			s.setAttribute("curr_doc", doc);
			SaveEntityService.saveDoc(doc);
		} else {
			User u = (User) s.getAttribute("curr_user");
			for (int i = 0; i < u.myChats.size(); i++) {
				if (u.myChats.get(i).with.equals(req.getParameter("with"))) {
					u.myChats.get(i).chat.add(new Message(u.name+" : "+req.getParameter("message"), u.email));
					if ((new DoctorDao().check(u.myChats.get(i).with)) != null) {
						Doctor rec = new DoctorDao().check(u.myChats.get(i).with);
						for (int j = 0; j < rec.myChats.size(); j++) {
							if (rec.myChats.get(j).with.equals(u.email)) {
								rec.myChats.get(j).chat.add(new Message(u.name+" : "+req.getParameter("message"), u.email));
								break;
							}
						}
						SaveEntityService.saveDoc(rec);
					} else if ((new UserDao().check(u.myChats.get(i).with)) != null) {
						User rec = new UserDao().check(u.myChats.get(i).with);
						for (int j = 0; j < rec.myChats.size(); j++) {
							if (rec.myChats.get(j).with.equals(u.email)) {
								rec.myChats.get(j).chat.add(new Message(u.name+" : "+req.getParameter("message"), u.email));
								break;
							}
						}
						SaveEntityService.saveUser(rec);
					}
					break;
				}
			}
			s.setAttribute("curr_user", u);
			SaveEntityService.saveUser(u);
		}
		res.sendRedirect("/account.jsp");
	}

}
