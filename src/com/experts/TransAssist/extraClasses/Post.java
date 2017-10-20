package com.experts.TransAssist.extraClasses;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Post implements Serializable{
	public Post(String photoId, String subject, String body) {
		this.photoId = photoId;
		this.subject = subject;
		this.body = body;
	}
	public Post() {
	}
	public String photoId;
	public String subject;
	public String body;
	

}
