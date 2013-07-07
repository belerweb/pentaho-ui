package com.belerweb.pentaho.ui.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.belerweb.pentaho.ui.service.AuthorityService;

@Controller
public class AuthorityController {

  @Autowired
  private AuthorityService authorityService;

  @RequestMapping("/user/list.do")
  public void users() {}

  @RequestMapping("/authority/list.do")
  public void authorities() {}

  @RequestMapping(method = RequestMethod.POST, value = "/user/add.do")
  public void addUser(@RequestParam String username) {
    authorityService.addUser(username);
  }

  @RequestMapping(method = RequestMethod.POST, value = "/authority/add.do")
  public void addAuthority(@RequestParam String authority) {
    authorityService.addAuthority(authority);;
  }


}
