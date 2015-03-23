package com.mobiquityinc.mobgate.demo.wrapper;

import com.mobiquityinc.apigateway.wrapper.APIUnwrapper;
import com.mobiquityinc.apigateway.wrapper.APIWrapper;
import com.mobiquityinc.mobgate.demo.domain.ShowCase;
import org.springframework.context.ApplicationContext;

import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlElement;

/**
 * Created by Vishal on 22/6/14.
 */
public class ShowCaseWrapper implements APIWrapper<ShowCase>, APIUnwrapper<ShowCase> {

    @XmlElement
    @NotNull
    private Long id;

    @XmlElement
    private String name;

    @Override
    public ShowCase unwrap(HttpServletRequest request, ApplicationContext context) {
        ShowCase example = new ShowCase();
        example.setId(id);
        example.setName(name);
        return example;
    }

    @Override
    public void wrapDetails(ShowCase model, HttpServletRequest request) {
        wrapSummary(model, request);
    }

    @Override
    public void wrapSummary(ShowCase model, HttpServletRequest request) {
        this.id = model.getId();
        this.name = model.getName();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
