package com.belerweb.pentaho.ui.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.belerweb.pentaho.ui.service.OptionService;

@Controller
public class SystemController extends ControllerHelper {

  @Autowired
  private OptionService optionService;

  @RequestMapping("/system/info.do")
  public void jvm(Model model) {
    model.addAttribute("envs", System.getenv());
    model.addAttribute("properties", System.getProperties());
  }

  @RequestMapping("/system/option.do")
  public void option(Model model) {
    model.addAttribute("option", optionService.getOptions());
  }

  @RequestMapping(method = RequestMethod.POST, value = "/system/option/update.do")
  public ResponseEntity<Object> updateOption(@RequestParam String name,
      @RequestParam(required = false) String value,
      @RequestParam(value = "value[]", required = false) String[] values) {
    if (name.equals("system_name")) {
      if (!value.matches("^.{1,64}$")) {
        return error("系统名称长度应该在1到64之间");
      }
      optionService.setOption(name, value);
      return ok();
    }
    if (name.equals("repository_view")) {
      if (!value.equals("tree") && !value.equals("2")) {
        return illegal();
      }
      optionService.setOption(name, value);
      return ok();
    }

    return illegal();
  }

}
