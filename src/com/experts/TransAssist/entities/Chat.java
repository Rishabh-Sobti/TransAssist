package com.experts.TransAssist.entities;

import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@SuppressWarnings("serial")
@Entity
public class Chat implements Serializable{
	public Chat(List<Message> chat, String with) {
		this.chat = chat;
		this.with = with;
	}
	public Chat() {
	}
	public List<Message> chat=new LinkedList<Message>();
	@Id
	public String with=new String();
}
