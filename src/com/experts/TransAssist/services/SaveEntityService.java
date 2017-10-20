package com.experts.TransAssist.services;

import com.experts.TransAssist.dao.DoctorDao;
import com.experts.TransAssist.dao.UserDao;
import com.experts.TransAssist.entities.Doctor;
import com.experts.TransAssist.entities.User;

public class SaveEntityService {
	public static void saveDoc(Doctor doc){
		DoctorDao.saveExisting(doc);
	}
	
	public static void saveUser(User doc){
		UserDao.saveExisting(doc);
	}

}
