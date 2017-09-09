package com.njust.eds.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * @author tomato
 * @create 2017-09-05 下午5:41
 */
@Repository
public class BaseDaoImpl {

    @Autowired
    private SessionFactory sessionFactory;

    //基础getSession（）
    public Session getSession() {
        return sessionFactory.getCurrentSession();
    }
}
