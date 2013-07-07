package com.belerweb.pentaho.ui.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.belerweb.pentaho.ui.bean.User;
import com.belerweb.pentaho.ui.dao.AuthorityDao;

@Service
public class UserService implements UserDetailsService {

  @Autowired
  private AuthorityDao authorityDao;

  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    User user = authorityDao.findUserByUsername(username);
    if (user == null) {
      throw new UsernameNotFoundException(username + " not found.");
    }
    return user;
  }

}
