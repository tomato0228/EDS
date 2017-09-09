package com.njust.eds.dao;

import com.njust.eds.model.User;

import java.util.List;

public interface UserDao {

    public void saveUser(User user);

    public User queryUser(User user);

    public User findUserById(Integer id);

    public User findUserPassword(String userName,String email);

    public List<User> findUser(List<Object> params, String hql);

    public void updateUser(User user);

    public User findUserByUserName(String userName);
}
