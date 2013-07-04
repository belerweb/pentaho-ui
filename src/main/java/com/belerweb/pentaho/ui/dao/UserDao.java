package com.belerweb.pentaho.ui.dao;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.belerweb.pentaho.ui.bean.User;

@Repository
public class UserDao {

  @Autowired
  private SessionFactory sessionFactory;

  public Integer min(String prop, Criterion criterion) {
    Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
    criteria.setProjection(Projections.min(prop));
    criteria.add(criterion);
    return (Integer) criteria.uniqueResult();
  }

  public User findUserByUsername(String username) {
    return (User) sessionFactory.getCurrentSession().get(User.class, username);
  }


}
