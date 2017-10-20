package com.experts.TransAssist.services;

import com.experts.TransAssist.dao.DoctorDao;
import com.experts.TransAssist.entities.Doctor;

public class DoctorService {

	public Doctor checkCredentials(String email){
		Doctor doc=(new DoctorDao()).check(email);
		return doc;
	}
	public void addDoc(Doctor d){
		DoctorDao.save(d);
	}
}
