package com.mobiquityinc.mobgate.demo.endpoint;

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

import org.springframework.stereotype.Component;

import com.mobiquityinc.apigateway.endpoint.BaseEndPoint;
import com.mobiquityinc.mobgate.demo.domain.ShowCase;
import com.mobiquityinc.mobgate.demo.wrapper.ShowCaseWrapper;

/**
 * Created by Vishal on 22/6/14.
 */
@Component("showCaseEndpoint")
@Path("/service/example/")
@Produces(value = { MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
@Consumes(value = { MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML,MediaType.APPLICATION_FORM_URLENCODED })
public class ShowCaseEndPoint extends BaseEndPoint {

    @RolesAllowed({"ROLE_ANDROID","ROLE_IOS"})
    @GET
    public ShowCaseWrapper getExample(@Context HttpServletRequest request, @Context HttpServletResponse response, @Context SecurityContext sc){
        ShowCase example = new ShowCase();
        ShowCaseWrapper wrapper = new ShowCaseWrapper();
        wrapper.wrapDetails(example, request);
        return wrapper;
    }
}
