package com.belerweb.pentaho.ui.bean;

import org.springframework.security.core.GrantedAuthority;


public class Authority implements GrantedAuthority {

  private static final long serialVersionUID = 8986661947997833151L;
  private String authority;
  private String description;

  public String getAuthority() {
    return authority;
  }

  public void setAuthority(String authority) {
    this.authority = authority;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

}
