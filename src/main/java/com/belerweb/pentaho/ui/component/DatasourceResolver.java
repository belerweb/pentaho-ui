package com.belerweb.pentaho.ui.component;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;

import com.belerweb.pentaho.ui.component.Context.Resource;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;

public class DatasourceResolver implements InitializingBean {

  @Autowired
  ServletContext servletContext;

  private static Map<String, Resource> resources = new HashMap<String, Context.Resource>();

  public static String getDriver(String name) {
    return resources.get(name).getDriver();
  }

  public static String getUrl(String name) {
    return resources.get(name).getUrl();
  }

  public static String getUsername(String name) {
    return resources.get(name).getUsername();
  }

  public static String getPassword(String name) {
    return resources.get(name).getPassword();
  }

  public static String getValidation(String name) {
    return resources.get(name).getValidation();
  }

  @Override
  public void afterPropertiesSet() throws Exception {
    String webappPath = servletContext.getRealPath("/");
    File xml = new File(new File(webappPath).getParent(), "pentaho/META-INF/context.xml");
    try {
      XmlMapper mapper = new XmlMapper();
      mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
      Context data = mapper.readValue(xml, Context.class);
      for (Resource resource : data.getResources()) {
        resources.put(resource.getName(), resource);
      }
    } catch (Exception e) {
      e.printStackTrace();
      throw new RuntimeException(e);
    }
  }

}
