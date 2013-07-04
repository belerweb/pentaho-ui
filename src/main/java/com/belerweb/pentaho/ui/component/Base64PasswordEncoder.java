package com.belerweb.pentaho.ui.component;

import org.apache.commons.codec.binary.Base64;
import org.springframework.security.authentication.encoding.BasePasswordEncoder;

public class Base64PasswordEncoder extends BasePasswordEncoder {

  @Override
  public String encodePassword(String rawPass, Object salt) {
    return new String(Base64.encodeBase64(rawPass.getBytes()));
  }

  @Override
  public boolean isPasswordValid(String encPass, String rawPass, Object salt) {
    String pass1 = "" + encPass;
    String pass2 = encodePassword(rawPass, salt);
    return pass1.equals(pass2);
  }

}
