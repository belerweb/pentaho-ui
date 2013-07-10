package com.belerweb.pentaho.ui.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.belerweb.pentaho.ui.bean.Authority;
import com.belerweb.pentaho.ui.bean.User;
import com.belerweb.pentaho.ui.dao.AuthorityDao;

@Service
public class AuthorityService {

  @Autowired
  private AuthorityDao authorityDao;

  @Transactional
  public void addUser(String username) {
    User user = new User();
    user.setUsername(username);
    authorityDao.save(user);
  }

  @Transactional
  public void addAuthority(String authority) {
    Authority _authority = new Authority();
    _authority.setAuthority(authority);
    authorityDao.save(_authority);
  }

  @Transactional
  public void updateUser(String username, String prop, Object value) {
    authorityDao.updateUser(username, prop, value);;
  }

  @Transactional
  public void updateAuthority(String authority, String prop, Object value) {
    authorityDao.updateAuthority(authority, prop, value);
  }

  @Transactional
  public void deleteUser(String username) {
    authorityDao.deleteGrantedAuthorityBy("username", username);
    authorityDao.deleteUser(username);
  }

  @Transactional
  public void deleteAuthority(String authority) {
    authorityDao.deleteGrantedAuthorityBy("authority", authority);
    authorityDao.deleteAuthority(authority);
  }

  public List<User> getUserList() {
    List<User> users = authorityDao.listUser();
    for (User user : users) {
      user.setAuthorities(authorityDao.listAuthority(user.getUsername()));
    }
    return users;
  }

}
