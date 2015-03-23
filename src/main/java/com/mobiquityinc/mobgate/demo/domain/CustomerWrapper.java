package com.mobiquityinc.mobgate.demo.domain;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;

import com.mobiquityinc.apigateway.wrapper.APIUnwrapper;
import com.mobiquityinc.apigateway.wrapper.APIWrapper;

public class CustomerWrapper implements APIWrapper<Customer>, APIUnwrapper<Customer> {

	private int id;
	private String name;
	private String email;
	private int mobile;
	
	public CustomerWrapper() {
		super();
	}
	
	public CustomerWrapper(int id, String name, String email, int mobile) {
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

	@Override
	public void wrapDetails(Customer model, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void wrapSummary(Customer model, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Customer unwrap(HttpServletRequest request,
			ApplicationContext context) {
		// TODO Auto-generated method stub
		
		return new Customer(id, name, email, mobile);
	}
	
	

}
