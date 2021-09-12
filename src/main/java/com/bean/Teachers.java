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
import javax.persistence.Table;

@Entity
@Table(name = "teacher")
public class Teachers {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;
	
	@Column(name = "name")
	private String name;
	
	@ManyToMany (fetch=FetchType.EAGER,cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,CascadeType.REFRESH})
	@JoinTable (
			name="subject_teacher", 
			joinColumns=@JoinColumn(name="teacher_id"),
			inverseJoinColumns = @JoinColumn(name="subject_id")
			)
	
	private List<Subjects> subjects;	
	
	public Teachers() {
		
	}
	
	public Teachers(String name) {
		super();
		this.name = name;
	}
	
	public Teachers(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
	public Teachers(int id) {
		super();
		this.id = id;
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
	
	
	public List<Subjects> getSubjects() {
		return subjects;
	}

	public void setSubjects(List<Subjects> subjects) {
		this.subjects = subjects;
	}
	
public void addSubject(Subjects theSubject) {
		
		if (subjects == null) {
			subjects = new ArrayList<>();
		}
		
		subjects.add(theSubject);
	}


	@Override
	public String toString() {
		return "Teachers [id=" + id + ", name=" + name + "]";
	}
}