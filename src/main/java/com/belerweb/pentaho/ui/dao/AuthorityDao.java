package com.belerweb.pentaho.ui.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.belerweb.pentaho.ui.bean.Authority;
import com.belerweb.pentaho.ui.bean.GrantedAuthority;
import com.belerweb.pentaho.ui.bean.User;

@Repository
@SuppressWarnings("unchecked")
public class AuthorityDao {

  @Autowired
  private SessionFactory sessionFactory;

  public void save(User user) {
    sessionFactory.getCurrentSession().save(user);
  }

  public void save(Authority authority) {
    sessionFactory.getCurrentSession().save(authority);
  }

  public void updateUser(String username, String prop, Object value) {
    String hql = "UPDATE User SET " + prop + " = ?  WHERE username = ?";
    Query query = sessionFactory.getCurrentSession().createQuery(hql);
    query.setParameter(0, value);
    query.setParameter(1, username);
    query.executeUpdate();
  }

  public void updateAuthority(String authority, String prop, Object value) {
    String hql = "UPDATE Authority SET " + prop + " = ?  WHERE authority = ?";
    Query query = sessionFactory.getCurrentSession().createQuery(hql);
    query.setParameter(0, value);
    query.setParameter(1, authority);
    query.executeUpdate();
  }

  public List<User> listUser() {
    return sessionFactory.getCurrentSession().createCriteria(User.class).list();
  }

  public List<Authority> listAuthority() {
    return sessionFactory.getCurrentSession().createCriteria(Authority.class).list();
  }

  public List<Authority> listAuthority(String username) {
    Session session = sessionFactory.getCurrentSession();
    Criteria criteria = session.createCriteria(GrantedAuthority.class);
    criteria.add(Restrictions.eq("username", username));
    criteria.setProjection(Projections.property("authority"));
    List<String> authorities = criteria.list();

    criteria = session.createCriteria(Authority.class);
    criteria.add(Restrictions.in("authority", authorities));
    return criteria.list();
  }

  public User findUserByUsername(String username) {
    return (User) sessionFactory.getCurrentSession().get(User.class, username);
  }

}
