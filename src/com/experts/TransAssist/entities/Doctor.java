package com.experts.TransAssist.entities;


import java.io.Serializable;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import com.experts.TransAssist.extraClasses.Comment;
import com.experts.TransAssist.extraClasses.Photo;
import com.experts.TransAssist.extraClasses.Post;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@SuppressWarnings("serial")
@Entity
public class Doctor implements Serializable{
	public String name=new String();
	public Date birthDate=new Date(0);
	public String gender=new String();
	public String profilePic=new String();
	@Id public long mobileNo;
	public long fax;
	@Index public String emailId=new String();
	public String website=new String();
	public int experience;
	public String degree=new String();
	public String specialisation=new String();
	public String role=new String();
	public String hospitalName=new String();
	public int duration;
	public String roleDescription=new String();
	public String hospStreet=new String();
	public String hospLocality=new String();
	public String hospState=new String();
	public String hospCity=new String();
	public int hospPinCode;
	public String aboutMe=new String();
	public List<Photo> photos = new LinkedList<Photo>();
	public List<Post> posts = new LinkedList<Post>();
	public List<String> friends = new LinkedList<String>();
	public List<String> friendsPending = new LinkedList<String>();
	@Index
	public List<String> reqSent = new LinkedList<String>();
	public String password=new String();
	public List<Chat> myChats=new LinkedList<Chat>();
	public int[] rate=new int[]{0,0,0,0,0,0};
	public List<Comment> review=new LinkedList<Comment>();
	
	public Doctor() {
	}

	public Doctor(String name, Date birthDate, String gender, String profilePic, long mobileNo, long fax, String emailId,
			String website, int experience, String degree, String specialisation, String role, String hospitalName,
			int duration, String roleDescription, String hospStreet, String hospLocality, String hospState,
			String hospCity, int hospPinCode, String aboutMe, String password) {
		this.name = name;
		this.birthDate = birthDate;
		this.gender = gender;
		this.profilePic = profilePic;
		this.mobileNo = mobileNo;
		this.fax = fax;
		this.emailId = emailId;
		this.website = website;
		this.experience = experience;
		this.degree = degree;
		this.specialisation = specialisation;
		this.role = role;
		this.hospitalName = hospitalName;
		this.duration = duration;
		this.roleDescription = roleDescription;
		this.hospStreet = hospStreet;
		this.hospLocality = hospLocality;
		this.hospState = hospState;
		this.hospCity = hospCity;
		this.hospPinCode = hospPinCode;
		this.aboutMe = aboutMe;
		this.password= password;
	}
	
	
	
	
	
}
