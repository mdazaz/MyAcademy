package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.bean.Classes;
import com.bean.Teachers;
import com.util.HibernateSessionUtil;

public class ClassDAO {
	static SessionFactory factory = HibernateSessionUtil.buildSessionFactory();
	public static List<Classes> listClasses(){		
		Session session = factory.openSession();
		String query = "from Classes as c";
		List listOfClasses = session.createQuery(query).list();
		session.close();
		for(Object x : listOfClasses) {
			System.out.println(x.toString());
		}
		return listOfClasses;
	}
	
	public static void addClasses(Classes c) {
		try {
			//SessionFactory factory = HibernateSessionUtil.buildSessionFactory();
			Session session = factory.openSession();
			Transaction tx = session.beginTransaction();
			System.out.println(c.toString());
			session.saveOrUpdate(c);
			tx.commit();
			session.close();
		}
		catch(Exception e) {
			System.out.println("Failed to add class: "+ e.getMessage().toString());
		}
	}
	
	public static void updateClasses(Classes c) {
		try {
			//SessionFactory factory = HibernateSessionUtil.buildSessionFactory();
			Session session = factory.openSession();
			Transaction tx = session.beginTransaction();
			
			session.update(c);
			tx.commit();
			session.close();
		}
		catch(Exception e) {
			System.out.println("Failed to update class: "+ e.getMessage().toString());
		}
	}
	public static Classes searchClassesById(int id) {
		//SessionFactory factory = HibernateSessionUtil.buildSessionFactory();
		Session session = factory.openSession();
		Classes foundClass=session.get(Classes.class,id);
		
		return foundClass;
	}
	public static void deleteClasses(Classes c) {
		try {
			SessionFactory factory = HibernateSessionUtil.buildSessionFactory();
			Session session = factory.openSession();
			Transaction tx = session.beginTransaction();
			
			session.delete(c);
			tx.commit();
			session.close();
		}
		catch(Exception e) {
			System.out.println("Failed to delete the class: "+ e.getMessage().toString());
		}
	}
}