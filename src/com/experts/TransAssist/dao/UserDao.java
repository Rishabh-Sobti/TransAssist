package com.experts.TransAssist.dao;

import static com.experts.TransAssist.services.OfyService.ofy;

import java.util.LinkedList;
import java.util.List;

import com.experts.TransAssist.entities.Doctor;
import com.experts.TransAssist.entities.User;

public class UserDao {

	public static void saveExisting(User user) {
		ofy().delete().type(Doctor.class).id(user.phone).now();
		ofy().save().entity(user).now();
		ofy().clear();
	}
	
	public static void save(User user) {
		ofy().save().entity(user).now();
		ofy().clear();
	}

	public User check(String emailId) {
		User d=null;
		int i=0;
		List<User> li=ofy().load().type(User.class).list();
		for(i=0; i<li.size(); i++){
			if((li.get(i).email).equals(emailId))
				d=li.get(i);
		}
		return d;
	}
	
	public List<User> find(String uloc,String uname){ 
		List<User> s = new LinkedList<User>();
		int i=0;
		List<User> li=ofy().load().type(User.class).list();
		if(uname!=null){
		for(i=0; i<li.size(); i++){
			if((li.get(i).name).equalsIgnoreCase(uname))
				s.add(li.get(i));
		}
		if(uloc!=null){
			for(i=0; i<s.size(); i++){
				if(s.get(i).location.equals(uloc)!=true){
					s.remove(i);
				}
			}
		}
		}
		else if(uloc!=null){
			for(i=0; i<li.size(); i++){
				if((li.get(i).location).equalsIgnoreCase(uloc))
					s.add(li.get(i));
			}
		}
		
		return s;
		
	}
	
}
