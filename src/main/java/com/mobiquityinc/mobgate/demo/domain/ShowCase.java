package com.mobiquityinc.mobgate.demo.domain;

import java.io.Serializable;

/**
 * Created by Vishal on 22/6/14.
 */
public class ShowCase implements Serializable {

    private Long id;

    private String name;

    public Long getId() {
        return 1L;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return "Example 1";
    }

    public void setName(String name) {
        this.name = name;
    }
}
