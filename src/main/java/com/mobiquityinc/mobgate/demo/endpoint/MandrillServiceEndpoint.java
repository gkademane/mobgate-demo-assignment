package com.mobiquityinc.mobgate.demo.endpoint;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Component;

import com.mobiquityinc.apigateway.mandrill.model.EmailInfo;
import com.mobiquityinc.apigateway.mandrill.model.To;
import com.mobiquityinc.apigateway.mandrill.service.MandrillEmailService;

@Component
@Path("/mandrill")
@Produces(value = { MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
@Consumes(value= { MediaType.APPLICATION_JSON , MediaType.APPLICATION_XML, MediaType.APPLICATION_FORM_URLENCODED})
public class MandrillServiceEndpoint {
	
	@Resource(name = "mandrillEmailService")
	private MandrillEmailService mandrillEmailService;
	
	@GET
	@Path(value="/sendmail")
	public void postmyEmail() throws Exception{
		
		String fromEmail = "gkademane@mobiquityinc.com";
		String fromName = "ganesh";
		List toEmail = new ArrayList();
		To to = new To();
		to.setEmail("gkademane@mobiquityinc.com");
		toEmail.add(to);
		String subject = "Test sample";
		String templateName = "MobGateTemplate";
		String variableName = "";
		EmailInfo emailInfo = new EmailInfo(fromEmail, fromName, toEmail,
				subject, templateName, variableName);
		
		Map<String,String> map=new HashMap<String, String>();
		map.put("CUSTOMERNAME", "Mahesh");
		mandrillEmailService.sendTemplateEmail(emailInfo, map);
				
	}


		
	}
	


