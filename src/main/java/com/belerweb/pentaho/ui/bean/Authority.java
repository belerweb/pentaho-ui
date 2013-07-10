package com.belerweb.pentaho.ui.bean;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;


public class Authority implements GrantedAuthority {

  private static final long serialVersionUID = 8986661947997833151L;
  private String authority;
  private String description;

  private List<User> users;

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

  public List<User> getUsers() {
    return users;
  }

  public void setUsers(List<User> users) {
    this.users = users;
  }

}
