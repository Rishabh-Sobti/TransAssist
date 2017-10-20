package com.experts.TransAssist.entities;

import java.io.Serializable;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import com.experts.TransAssist.extraClasses.Photo;
import com.experts.TransAssist.extraClasses.Post;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@SuppressWarnings("serial")
@Entity
public class User implements Serializable {
	public User(String name, Date birthDate, String gender, String location, String employStatus, String phone,
			String email, String facebook, String twitter, String googlePlus, String aboutMe, String hobbies,
			String profilePic, String password) {
		this.name = name;
		this.birthDate = birthDate;
		this.gender = gender;
		this.location = location;
		this.employStatus = employStatus;
		this.phone = phone;
		this.email = email;
		this.facebook = facebook;
		this.twitter = twitter;
		this.googlePlus = googlePlus;
		this.aboutMe = aboutMe;
		this.hobbies = hobbies;
		this.profilePic = profilePic;
		this.password = password;
	}

	public User() {
	}

	@Index 
	public String name=new String();
	public Date birthDate=new Date(0);
	public String gender=new String();
	public String location=new String();
	public String employStatus=new String();
	@Id
	public String phone=new String();
	@Index
	public String email=new String();
	public String facebook=new String();
	public String twitter=new String();
	public String googlePlus=new String();
	public String aboutMe=new String();
	public String hobbies=new String();
	public String profilePic=new String();
	public String password=new String();
	public List<Photo> photos = new LinkedList<Photo>();
	public List<Post> posts = new LinkedList<Post>();
	public List<String> friends = new LinkedList<String>();
	public List<String> friendsPending = new LinkedList<String>();
	@Index
	public List<String> reqSent = new LinkedList<String>();
	public List<Chat> myChats=new LinkedList<Chat>();
}
