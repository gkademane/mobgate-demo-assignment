package com.mobiquityinc.mobgate.demo.endpoint;

import java.util.List;

import javax.annotation.security.RolesAllowed;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.SecurityContext;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;

import com.mobiquityinc.apigateway.endpoint.BaseEndPoint;
import com.mobiquityinc.mobgate.demo.domain.RoleWrapper;

@Component("rolesEndpoint")
@Path("/service/allRoles")
@Produces(value = { MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
@Consumes(value = { MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML,
		MediaType.APPLICATION_FORM_URLENCODED })
public class RolesEndpoint extends BaseEndPoint {

	@GET
	
	public RoleWrapper getAllRoles(@Context HttpServletRequest request,
			@Context HttpServletResponse response, @Context SecurityContext sc) {
		RoleWrapper roleWrap = new RoleWrapper();
		Authentication auth = (Authentication) sc.getUserPrincipal();

		List<GrantedAuthority> roles = (List<GrantedAuthority>) auth
				.getAuthorities();
		String roleName;
		for (GrantedAuthority role : roles) {
			roleName = role.getAuthority();
			roleWrap.wrapDetails(roleName, request);
		}

		return roleWrap;
	}

}
