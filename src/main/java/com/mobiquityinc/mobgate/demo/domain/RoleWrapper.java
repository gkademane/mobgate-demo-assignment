package com.mobiquityinc.mobgate.demo.domain;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.annotation.XmlElement;

import com.mobiquityinc.apigateway.wrapper.APIWrapper;

public class RoleWrapper implements APIWrapper<String> {
	
	@XmlElement
	List<String> roles = new ArrayList<>();

	

	@Override
	public void wrapDetails(String model, HttpServletRequest request) {
		//roles.add(model);
		roles.add(model);
	}

	@Override
	public void wrapSummary(String model, HttpServletRequest request) {
		// TODO Auto-generated method stub
		// roles.add(model);
		
	}	
	
}
