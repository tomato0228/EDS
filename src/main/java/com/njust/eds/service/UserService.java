package com.njust.eds.service;

import com.njust.eds.model.User;

import java.util.List;
import java.util.Map;

public interface UserService {

    public void addUser(User user);

    public User queryUser(User user);

    public User getUserById(Integer id);

    public User findUserPassword(String userName, String email);

    public List<User> findUsers(Map<String, Object> map);

    public void updateUser(User user);

    public void saveUser(User user);

    public User findUserByUserName(String userName);

    public List<User> getAllUser();

    public String findUsernameBuId(int id);

    public void deletUser(User user);

    public void start(int id);

    public void stop(int id);
}
