package com.experts.TransAssist.dao;

import com.experts.TransAssist.entities.Doctor;

import static com.experts.TransAssist.services.OfyService.ofy;

import java.util.LinkedList;
import java.util.List;;

public class DoctorDao {

	public static void saveExisting(Doctor user) {
		ofy().delete().type(Doctor.class).id(user.mobileNo).now();
		ofy().save().entity(user).now();
		ofy().clear();
	}
	
	public static void save(Doctor user) {
		ofy().save().entity(user).now();
		ofy().clear();
	}

	public Doctor check(String emailId) {
		Doctor d=null;
		List<Doctor> li=ofy().load().type(Doctor.class).list();
		for(int i=0; i<li.size(); i++){
			if(li.get(i).emailId.equals(emailId))
				d=li.get(i);
		}
		return d;
	}
	public List<Doctor> find(String dloc,String dname){ 
		List<Doctor> s = new LinkedList<Doctor>();
		int i=0;
		List<Doctor> li=ofy().load().type(Doctor.class).list();
		if(dname!=null){ 
		for(i=0; i<li.size(); i++){
			if((li.get(i).name).equalsIgnoreCase(dname))
				s.add(li.get(i));
		}
		if(dloc!=null){
			for(i=0; i<s.size(); i++){
				if(s.get(i).hospLocality.equalsIgnoreCase(dloc)!=true){
					s.remove(i);
				}
			}
		}
		}
		else if(dloc!=null){
			for(i=0; i<li.size(); i++){
				if((li.get(i).hospLocality).equalsIgnoreCase(dloc))
					s.add(li.get(i));
			}
		}
		
		
		return s;
		
	}
}
