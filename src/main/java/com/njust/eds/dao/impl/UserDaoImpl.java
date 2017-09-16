package com.njust.eds.dao.impl;

import com.njust.eds.dao.UserDao;
import com.njust.eds.model.User;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl extends BaseDaoImpl implements UserDao {

    //添加用户
    public void saveUser(User user) {
        getSession().save(user);
    }

    //用户名和密码查找
    @SuppressWarnings("unchecked")
    public User queryUser(User user) {
        String hql = "from User where userName=? and userPassword=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, user.getUserName());
        query.setParameter(1, user.getUserPassword());
        User currentUser = null;
        List<User> userList = query.list();
        if (userList != null && userList.size() > 0) {
            currentUser = userList.get(0);
        }
        return currentUser;
    }

    //id查找
    public User findUserById(Integer id) {
        String hql = "from User where userId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, id);
        User user = (User) query.uniqueResult();
        return user;
    }

    //用户名和邮箱查找
    public User findUserPassword(String userName, String email) {
        String hql = "from User where userName=? and userEmail=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, userName);
        query.setParameter(1, email);
        User currentUser = (User) query.uniqueResult();
        return currentUser;
    }

    //其他查找
    @SuppressWarnings("unchecked")
    public List<User> findUser(List<Object> params, String hql) {
        Query query = getSession().createQuery(hql);
        if (params != null && params.size() > 0) {
            for (int i = 0; i < params.size(); i++) {
                query.setParameter(i, params.get(i));
            }
        }
        return query.list();
    }

    //更新用户信息
    public void updateUser(User user) {
        getSession().update(user);
    }

    //用户名查找用户
    public User findUserByUserName(String userName) {
        String hql = "from User where userName=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, userName);
        return (User) query.uniqueResult();
    }
    public List<User> getAllUser(){

        String hql = "from User ";
        Query query = getSession().createQuery(hql);
        return query.list();
    }
    public String findUsernameBuId(int id){
        String hql = "from User where userId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, id);
        User user=(User)query.uniqueResult();
        return user.getUserName();

    }
    public void deletUser(User user){
        getSession().delete(user);
    }

    public void start(int id){
        String hql="update User  set userIsAccepted=1 where userId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, id);
        query.executeUpdate();
    }

    public void stop(int id){
        String hql="update User  set userIsAccepted=0 where userId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, id);
        query.executeUpdate();
    }
    public void user_secretlevel_edit(int id,int secretlevel ){
        String hql="update User  set userSecretLevel=? where userId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, secretlevel);
        query.setParameter(1,id);
        query.executeUpdate();
    }
}
