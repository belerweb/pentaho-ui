package com.belerweb.pentaho.ui.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.belerweb.pentaho.ui.service.OptionService;

@Controller
public class HomeController {

  @Autowired
  private OptionService optionService;

  @RequestMapping("/login.do")
  public void login(Model model) {
    model.addAttribute("option", optionService.getOptions());
  }

  @RequestMapping("/home.do")
  public void home(Model model) {
    model.addAttribute("option", optionService.getOptions());
  }

  @RequestMapping("/admin.do")
  public void admin(Model model) {
    model.addAttribute("option", optionService.getOptions());
  }

}
