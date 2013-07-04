package com.belerweb.pentaho.ui.component;

import java.util.List;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;

/**
 * Bean wrapper for pentaho/META-INF/context.xml
 */
public class Context {

  @JacksonXmlElementWrapper(useWrapping = false)
  @JacksonXmlProperty(localName = "Resource")
  private List<Resource> resources;

  public List<Resource> getResources() {
    return resources;
  }

  public void setResources(List<Resource> resources) {
    this.resources = resources;
  }

  public static class Resource {

    private String name;
    @JacksonXmlProperty(localName = "driverClassName")
    private String driver;
    private String url;
    private String username;
    private String password;
    @JacksonXmlProperty(localName = "validationQuery")
    private String validation;

    public String getName() {
      return name;
    }

    public void setName(String name) {
      this.name = name;
    }

    public String getDriver() {
      return driver;
    }

    public void setDriver(String driver) {
      this.driver = driver;
    }

    public String getUrl() {
      return url;
    }

    public void setUrl(String url) {
      this.url = url;
    }

    public String getUsername() {
      return username;
    }

    public void setUsername(String username) {
      this.username = username;
    }

    public String getPassword() {
      return password;
    }

    public void setPassword(String password) {
      this.password = password;
    }

    public String getValidation() {
      return validation;
    }

    public void setValidation(String validation) {
      this.validation = validation;
    }

  }

}
