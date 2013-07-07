package com.belerweb.pentaho.ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

  @RequestMapping("/login.do")
  public void login() {}

  @RequestMapping("/home.do")
  public void home() {}

  @RequestMapping("/admin.do")
  public void admin() {}

}
