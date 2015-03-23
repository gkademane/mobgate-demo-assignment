package com.mobiquityinc.mobgate.demo.endpoint;

import java.util.ArrayList;
import java.util.List;

import javax.management.RuntimeErrorException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.mobiquityinc.mobgate.demo.dao.CustomerDAO;
import com.mobiquityinc.mobgate.demo.dao.CustomerDAOImpl;
import com.mobiquityinc.mobgate.demo.domain.Customer;
import com.mobiquityinc.mobgate.demo.domain.CustomerWrapper;

@Component("customerEndpoint")
@Path("/customer")
@Produces(value = { MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML} )
@Consumes( value = { MediaType.APPLICATION_JSON , MediaType.APPLICATION_XML, MediaType.APPLICATION_FORM_URLENCODED} ) 


public class CustomerServiceEndpoint {
	
   @Autowired
   CustomerDAO dao;
	
   @POST
   @Path(value="/create")
   public Response createUser(@Context HttpServletRequest request ,  @Context ApplicationContext ac , CustomerWrapper customerWrapper) {
	   ResponseBuilder responseBuilder = Response.status(Response.Status.INTERNAL_SERVER_ERROR);
	   Customer customer = customerWrapper.unwrap(request, ac);
	   dao.createCustomer(customer);
	   return responseBuilder.status(Response.Status.CREATED).entity(customer).build();
	   
   }
   
   @GET
   @Path(value="/list")
   public List<CustomerWrapper> listCustomer(@Context HttpServletRequest request, @Context ApplicationContext ac) {
	   List<Customer> customers =  dao.listCustomers();
	   List<CustomerWrapper> customerWrappers = new ArrayList<CustomerWrapper>();
	   
	   for(Customer customer : customers) {
		customerWrappers.add(new CustomerWrapper(customer.getId(), customer.getName(), customer.getEmail(), customer.getMobile()));   
	   }
	   return customerWrappers;
   }    
   
   
   @PUT
   @Path(value="/update")
   public void updateCustomer(@Context HttpServletRequest request, @Context ApplicationContext ac, CustomerWrapper customerWrapper) {
	   Customer customer = customerWrapper.unwrap(request, ac);
	   if(dao.getCustomerById(customer.getId()) == null) {
		   throw new RuntimeException("Entity not found");
	   }
	dao.updateCustomer(customer);   
   }
   
   @DELETE
   @Path(value="/delete/{id}")
   @Transactional
   public void deleteCustomer(@PathParam("id") Integer id) {
	   Customer customer = dao.getCustomerById(id);  
	   dao.deleteCustomer(customer);
   }  
   
	
}
