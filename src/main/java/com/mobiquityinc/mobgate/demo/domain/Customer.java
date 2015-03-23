package com.mobiquityinc.mobgate.demo.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="mg_customer")
public class Customer {

	@Id
	private int id;

	@Column
	private String name;

	@Column
	private String email;

	@Column
	private int mobile;
	
	public Customer() {
		
	}

	public Customer(int id, String name, String email, int mobile) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.mobile = mobile;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getMobile() {
		return mobile;
	}

	public void setMobile(int mobile) {
		this.mobile = mobile;
	}

}
