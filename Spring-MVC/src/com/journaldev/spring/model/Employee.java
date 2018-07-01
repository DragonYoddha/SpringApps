package com.journaldev.spring.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.journaldev.spring.util.DateSerializer;

@Entity
@Table(name="EMPLOYEES")
public class Employee {

	@Id
	@Column(name="EMPLOYEE_ID")
	@SequenceGenerator(name="my_seq", sequenceName="EMPLOYEES_SEQ")
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="my_seq")
	private int recid;
	
	@Column(name="FIRST_NAME")
	private String firstName;
	
	@Column(name="EMAIL")
	private String email;
	
	@Column(name="HIRE_DATE")
	@JsonSerialize(using=DateSerializer.class)
	private Date hireDate;
	
	@Column(name="SALARY")
	private int salary;
	
	

	public int getRecid() {
		return recid;
	}

	public void setRecid(int recid) {
		this.recid = recid;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getHireDate() {
		return hireDate;
	}

	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	@Override
	public String toString() {
		return "Employee [recid=" + recid + ", firstName=" + firstName + ", email=" + email + ", hireDate=" + hireDate
				+ ", salary=" + salary + "]";
	}
	
}
