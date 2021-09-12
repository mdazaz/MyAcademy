package com.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.bean.Admin;
import com.bean.Classes;
import com.bean.Students;
import com.bean.Subjects;
import com.bean.Teachers;
import com.bean.User;


public class HibernateSessionUtil {
	
	private static SessionFactory factory;
	
	public static SessionFactory buildSessionFactory() {
		
		factory = new Configuration().configure("hibernate.cfg.xml")
				.addAnnotatedClass(Admin.class)
				.addAnnotatedClass(User.class)
				.addAnnotatedClass(Subjects.class)
				.addAnnotatedClass(Students.class)
				.addAnnotatedClass(Teachers.class)
				.addAnnotatedClass(Classes.class)
				.buildSessionFactory();
		return factory;
	}

}
