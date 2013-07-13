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
    model.addAttribute("authorities", authorityService.getAuthorityList());
  }

  @RequestMapping(method = RequestMethod.POST, value = "/user/add.do")
  public ResponseEntity<Object> addUser(@RequestParam String username) {
    if (!username.matches("^[a-zA-Z][a-zA-Z0-9]{3,15}$")) {
      return error("用户名必须以字母开头，只能包含数字和字母，长度4～16位");
    }
    authorityService.addUser(username);
    return ok();
  }

  @RequestMapping(method = RequestMethod.POST, value = "/user/update.do")
  public ResponseEntity<Object> updateUser(@RequestParam String pk, @RequestParam String name,
      @RequestParam(required = false) String value,
      @RequestParam(value = "value[]", required = false) String[] values) {
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
        return error("说明长度不能超过50");
      }
      authorityService.updateUser(pk, name, value);
      return ok();
    }
    if (name.equals("enabled")) {
      authorityService.updateUser(pk, name, value.equals("1"));
      return ok();
    }
    if (name.equals("authorities")) {
      authorityService.saveGrantedAuthority("username", pk, values);
      return ok();
    }

    return illegal();
  }

  @RequestMapping(method = RequestMethod.POST, value = "/user/delete.do")
  public ResponseEntity<Object> deleteUser(@RequestParam String username) {
    if ("admin".equals(username)) {
      return error("不能删除admin帐户");
    }
    // TODO 不能删除自己
    authorityService.deleteUser(username);
    return ok();
  }

  @RequestMapping("/authority/list.do")
  public void authorities(Model model) {
    model.addAttribute("authorities", authorityService.getAuthorityList());
    model.addAttribute("users", authorityService.getUserList());
  }

  @RequestMapping(method = RequestMethod.POST, value = "/authority/add.do")
  public ResponseEntity<Object> addAuthority(@RequestParam String authority) {
    if (!authority.matches("^[a-zA-Z]{4,16}$")) {
      return error("角色必须是4～16位的字母");
    }
    authorityService.addAuthority(authority);
    return ok();
  }

  @RequestMapping(method = RequestMethod.POST, value = "/authority/update.do")
  public ResponseEntity<Object> updateAuthority(@RequestParam String pk, @RequestParam String name,
      @RequestParam(required = false) String value,
      @RequestParam(value = "value[]", required = false) String[] values) {
    if (name.equals("description")) {
      if (value.length() > 16) {
        return error("说明长度不能超过50");
      }
      authorityService.updateAuthority(pk, name, value);
      return ok();
    }
    if (name.equals("users")) {
      authorityService.saveGrantedAuthority("authority", pk, values);
      return ok();
    }
    return illegal();
  }

  @RequestMapping(method = RequestMethod.POST, value = "/authority/delete.do")
  public ResponseEntity<Object> deleteAuthority(@RequestParam String authority) {
    // TODO 判断不能删除的角色
    authorityService.deleteAuthority(authority);
    return ok();
  }


}
