package com.mobiquityinc.mobgate.demo.dao;


import java.util.List;

import com.mobiquityinc.mobgate.demo.domain.Customer;

public interface CustomerDAO {
	
	void createCustomer(Customer customer);
	List<Customer> listCustomers();
	void updateCustomer(Customer customer);
	void deleteCustomer(Customer customer);	
	Customer getCustomerById(int id);
	
	
}
