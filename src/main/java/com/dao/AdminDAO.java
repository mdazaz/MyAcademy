package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.bean.Admin;
import com.util.HibernateSessionUtil;

public class AdminDAO {
	
	public static void addAdmin(Admin admin) {
		try {
			SessionFactory factory = HibernateSessionUtil.buildSessionFactory();
			Session session = factory.openSession();
			Transaction tx = session.beginTransaction();
			
			session.save(admin);
			tx.commit();
			session.close();
		}
		catch(Exception e) {
			System.out.println("Failed to add admin: "+ e.getMessage().toString());
		}
	}
	
	public static List<Admin> listAdmin(){
		
		SessionFactory factory = HibernateSessionUtil.buildSessionFactory();
		Session session = factory.openSession();
		String query = "FROM Admin as ad";
		List listOfAdmins = session.createQuery(query).list();
		System.out.println(listOfAdmins);
		session.close();
		return listOfAdmins;
	}

}
