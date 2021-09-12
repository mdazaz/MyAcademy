package com.bean;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "subject")
public class Subjects {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;
	
	@Column(name = "name")
	private String name;
	
	@ManyToMany (fetch=FetchType.EAGER,cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,CascadeType.REFRESH})
	@JoinTable(
			name="class_subject", 
			joinColumns=@JoinColumn(name="subject_id"),
			inverseJoinColumns = @JoinColumn(name="class_id")
			)
	private List <Classes> classes;
	
	@ManyToMany (fetch=FetchType.LAZY,cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,CascadeType.REFRESH})
	@JoinTable(
			name="subject_teacher", 
			joinColumns=@JoinColumn(name="subject_id"),
			inverseJoinColumns = @JoinColumn(name="teacher_id")
			)
	private List <Teachers> teachers;	
	
	
	public Subjects() {
		
	}
	
	public Subjects(String name) {		
		this.name = name;
	}
		
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	public List<Teachers> getTeachers() {
		return teachers;
	}

	public void setTeachers(List<Teachers> teachers) {
		this.teachers = teachers;
	}

	public List<Classes> getClasses() {
		return classes;
	}

	public void setClasses(List<Classes> classes) {
		this.classes = classes;
	}
	
public void addTeacher(Teachers theTeacher) {
		
		if (teachers == null) {
			teachers = new ArrayList<>();
		}
		
		teachers.add(theTeacher);
	}

	@Override
	public String toString() {
		return "Subjects [id=" + id + ", name=" + name + "]";
	}
}
