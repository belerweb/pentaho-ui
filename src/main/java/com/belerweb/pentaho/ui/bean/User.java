package com.belerweb.pentaho.ui.bean;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetails;

public class User implements UserDetails {

  private static final long serialVersionUID = 8311089943780971442L;

  private String username;
  private String password;
  private String description;
  private boolean enabled;

  private List<Authority> authorities;

  @Override
  public List<Authority> getAuthorities() {
    return authorities;
  }

  @Override
  public String getPassword() {
    return password;
  }

  @Override
  public String getUsername() {
    return username;
  }

  @Override
  public boolean isAccountNonExpired() {
    return true;
  }

  @Override
  public boolean isAccountNonLocked() {
    return true;
  }

  @Override
  public boolean isCredentialsNonExpired() {
    return true;
  }

  @Override
  public boolean isEnabled() {
    return enabled;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public void setEnabled(boolean enabled) {
    this.enabled = enabled;
  }

  public void setAuthorities(List<Authority> authorities) {
    this.authorities = authorities;
  }

}
