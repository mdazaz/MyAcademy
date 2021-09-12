package com.bean;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.CollectionId;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name= "class")
public class Classes {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
	private int id;
	
	@Column(name="name")
	private String name;
	
	@ManyToMany (fetch=FetchType.LAZY,cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,CascadeType.REFRESH})
	@JoinTable (
			name="class_subject", 
			joinColumns=@JoinColumn(name="class_id"),
			inverseJoinColumns = @JoinColumn(name="subject_id")
			)
	
	private List<Subjects> subjects;	
	
	//Relationship with Student 
		@OneToMany (mappedBy = "classes",cascade = CascadeType.ALL)
		private List <Students> students;
	
	public List<Students> getStudents() {
			return students;
		}

		public void setStudents(List<Students> students) {
			this.students = students;
		}
		
		public void add(Students tempStudent) {
			
			if (students == null) {
				students = new ArrayList<>();
			}
			
			//bookings.add(tempBooking);
			
			tempStudent.setClasses(this);
		}

	public Classes() {
		super();
	}
	
	public Classes(String name) {
		super();
		this.name = name;
	}
	
	public Classes(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
	public Classes(int id) {
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
	
	public List<Subjects> getSubject() {
		return subjects;
	}

	public void setSubject(List<Subjects> subjects) {
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
		return "Classes [id=" + id + ", name=" + name + "]";
	}
}
