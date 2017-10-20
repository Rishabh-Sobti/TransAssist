package com.experts.TransAssist.controllers;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.experts.TransAssist.entities.Chat;
import com.experts.TransAssist.entities.Doctor;
import com.experts.TransAssist.entities.Message;
import com.experts.TransAssist.entities.User;
import com.experts.TransAssist.services.DoctorService;
import com.experts.TransAssist.services.SaveEntityService;

@SuppressWarnings("serial")
public class ChattingNewController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession s=req.getSession(false);
		String str=req.getParameter("docId");
		Doctor d=new DoctorService().checkCredentials(str);
		Doctor doc = (Doctor) s.getAttribute("curr_doc");
		int mode=0;
		if (doc != null) {
			for (int i = 0; i < doc.myChats.size(); i++) {
				if (doc.myChats.get(i).with.equals(d.emailId)) {
					mode=1;
					doc.myChats.get(i).chat.add(new Message(doc.name+" : "+req.getParameter("message"), doc.emailId));
						for (int j = 0; j < d.myChats.size(); j++) {
							if (d.myChats.get(j).with.equals(doc.emailId)) {
								d.myChats.get(j).chat.add(new Message(doc.name+" : "+req.getParameter("message"), doc.emailId));
								break;
							}
						}
					break;
				}
			} 
			if(mode==0){
				List<Message> ch=new LinkedList<Message>();
				ch.add(new Message(doc.name+" : "+req.getParameter("message"), doc.emailId));
				doc.myChats.add(new Chat(ch, d.emailId));
				d.myChats.add(new Chat(ch, doc.emailId));
			}
			SaveEntityService.saveDoc(d);
			s.setAttribute("DocToOpen",d);
			s.setAttribute("curr_doc", doc);
			SaveEntityService.saveDoc(doc);
		} else {
			User u = (User) s.getAttribute("curr_user");
			for (int i = 0; i < u.myChats.size(); i++) {
				if (u.myChats.get(i).with.equals(d.emailId)) {
					mode=1;
					u.myChats.get(i).chat.add(new Message(u.name+" : "+req.getParameter("message"), u.email));
					for (int j = 0; j < d.myChats.size(); j++) {
						if (d.myChats.get(j).with.equals(u.email)) {
							d.myChats.get(j).chat.add(new Message(u.name+" : "+req.getParameter("message"), u.email));
							break;
						}
					}
					break;
				}
			}
			if(mode==0){
				List<Message> ch=new LinkedList<Message>();
				ch.add(new Message(u.name+" : "+req.getParameter("message"), u.email));
				u.myChats.add(new Chat(ch, d.emailId));
				d.myChats.add(new Chat(ch, u.email));
			}
			SaveEntityService.saveDoc(d);
			s.setAttribute("DocToOpen",d);
			s.setAttribute("curr_user", u);
			SaveEntityService.saveUser(u);
		}
		res.sendRedirect("/checkDoc?docId="+d.emailId);
	}

}
