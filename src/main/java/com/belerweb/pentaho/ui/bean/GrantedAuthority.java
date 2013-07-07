package com.belerweb.pentaho.ui.bean;

import java.io.Serializable;


public class GrantedAuthority implements Serializable {

  private static final long serialVersionUID = 5021372443484994866L;
  private String username;
  private String authority;

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getAuthority() {
    return authority;
  }

  public void setAuthority(String authority) {
    this.authority = authority;
  }

}
