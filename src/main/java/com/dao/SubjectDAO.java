package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.bean.Classes;
import com.bean.Subjects;
import com.util.HibernateSessionUtil;

public class SubjectDAO {
	public static List<Subjects> listSubjects(){
		SessionFactory factory = HibernateSessionUtil.buildSessionFactory();
		Session session = factory.openSession();
		List listOfSubjects = session.createQuery("From Subjects as sub").list();
		return listOfSubjects;
	}
	
	public static void addSubjects(Subjects sub) {
		try {
			SessionFactory factory = HibernateSessionUtil.buildSessionFactory();
			Session session = factory.openSession();
			Transaction tx = session.beginTransaction();
			
			session.saveOrUpdate(sub);
			tx.commit();
			session.close();
		}
		catch(Exception e) {
			System.out.println("Add Subject failed"+ e.getMessage().toString());
		}
	}
	
	public static void updateSubjects(Subjects sub) {
		try {
			SessionFactory factory = HibernateSessionUtil.buildSessionFactory();
			Session session = factory.openSession();
			Transaction tx = session.beginTransaction();
			
			session.update(sub);
			tx.commit();
			session.close();
		}
		catch(Exception e) {
			System.out.println("Update Subject failed"+ e.getMessage().toString());
		}
	}
	public static Subjects searchSubjectById(int id) {
		SessionFactory factory = HibernateSessionUtil.buildSessionFactory();
		Session session = factory.openSession();
		Subjects foundSubjects=session.get(Subjects.class,id);
		session.close();
		return foundSubjects;
	}
	
	public static void deleteSubjects(Subjects sub) {
		try {
			SessionFactory factory = HibernateSessionUtil.buildSessionFactory();
			Session session = factory.openSession();
			Transaction tx = session.beginTransaction();
			
			session.delete(sub);
			tx.commit();
			session.close();
		}
		catch(Exception e) {
			System.out.println("Delete Subject failed"+ e.getMessage().toString());
		}
	}
}
