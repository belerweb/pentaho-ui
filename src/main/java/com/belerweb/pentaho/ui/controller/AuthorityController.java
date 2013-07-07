package com.belerweb.pentaho.ui.controller;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.belerweb.pentaho.ui.service.AuthorityService;

@Controller
public class AuthorityController extends ControllerHelper {

  @Autowired
  private AuthorityService authorityService;

  @RequestMapping("/user/list.do")
  public void users(Model model) {
    model.addAttribute("users", authorityService.getUserList());
  }

  @RequestMapping("/authority/list.do")
  public void authorities() {}

  @RequestMapping(method = RequestMethod.POST, value = "/user/add.do")
  public void addUser(@RequestParam String username) {
    authorityService.addUser(username);
  }

  @RequestMapping(method = RequestMethod.POST, value = "/user/update.do")
  public ResponseEntity<Object> updateUser(@RequestParam String pk, @RequestParam String name,
      @RequestParam String value) {
    if (name.equals("password")) {
      if (!value.matches("^.{6,16}$")) {
        return error("密码长度应该在6到16之间");
      }
      String password = new String(Base64.encodeBase64(value.getBytes()));
      authorityService.updateUser(pk, name, password);
      return ok();
    }
    if (name.equals("description")) {
      if (value.length() > 16) {
        return error("说明长度不能超过16");
      }
      authorityService.updateUser(pk, name, value);
      return ok();
    }
    if (name.equals("enabled")) {
      authorityService.updateUser(pk, name, value.equals("1"));
      return ok();
    }

    return illegal();
  }

  @RequestMapping(method = RequestMethod.POST, value = "/authority/add.do")
  public void addAuthority(@RequestParam String authority) {
    authorityService.addAuthority(authority);;
  }


}
