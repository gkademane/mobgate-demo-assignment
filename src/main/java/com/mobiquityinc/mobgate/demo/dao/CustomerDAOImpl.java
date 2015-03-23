package com.mobiquityinc.mobgate.demo.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mobiquityinc.apigateway.mysql.dao.api.jpa.MySqlBaseRepository;
import com.mobiquityinc.mobgate.demo.domain.Customer;

@Repository
public class CustomerDAOImpl extends MySqlBaseRepository<Serializable> implements CustomerDAO {
   
	
	@Override
	@Transactional
	public void createCustomer(Customer customer) {
		// TODO Auto-generated method stub
		getEntityManager().persist(customer);
	}

	@Override
	public List<Customer> listCustomers() {
		// TODO Auto-generated method stub
		return (List<Customer>) getEntityManager().createQuery("select c from Customer c",Customer.class)
				.getResultList();	
	}

	@Override
	@Transactional
	public void updateCustomer(Customer customer) {
		// TODO Auto-generated method stub
		getEntityManager().merge(customer);	
	}

	@Override
	public void deleteCustomer(Customer customer) {
		// TODO Auto-generated method stub
		getEntityManager().remove(customer);
	}

	@Override
	public Customer getCustomerById(int id) {
		// TODO Auto-generated method stub
		return getEntityManager().find(Customer.class , id);
	}	
}
