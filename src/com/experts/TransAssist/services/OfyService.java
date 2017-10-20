package com.experts.TransAssist.services;

import com.experts.TransAssist.entities.Doctor;
import com.experts.TransAssist.entities.User;
import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyFactory;
import com.googlecode.objectify.ObjectifyService;



public class OfyService {
    static {
    	ObjectifyService.register(Doctor.class);
    	ObjectifyService.register(User.class);
    }

    public static Objectify ofy() {
        return ObjectifyService.ofy();
    }


    public static ObjectifyFactory factory() {
        return ObjectifyService.factory();
    }
}