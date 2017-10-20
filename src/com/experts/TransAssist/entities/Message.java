package com.experts.TransAssist.entities;

import java.io.Serializable;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@SuppressWarnings("serial")
@Entity
public class Message implements Serializable{
	public String msg=new String();
	@Id
	public String from=new String();
	public Message() {
	}
	public Message(String msg, String from) {
		this.msg = msg;
		this.from = from;
	}
	
}
