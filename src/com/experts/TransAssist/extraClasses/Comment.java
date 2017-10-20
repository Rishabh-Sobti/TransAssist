package com.experts.TransAssist.extraClasses;

import java.io.Serializable;

import com.experts.TransAssist.entities.User;

@SuppressWarnings("serial")
public class Comment implements Serializable {
	public Comment() {
	}
	public Comment(User u, String comment) {
		this.u = u;
		this.comment = comment;
	}
	public User u=new User();
	public String comment=new String(); 
}
