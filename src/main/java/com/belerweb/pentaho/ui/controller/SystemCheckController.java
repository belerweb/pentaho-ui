package com.belerweb.pentaho.ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SystemCheckController extends ControllerHelper {

  @RequestMapping("/system/check.do")
  public void jvm(Model model) {}


}
