package com.njust.eds.service.Impl;

import com.njust.eds.dao.UserDao;
import com.njust.eds.model.User;
import com.njust.eds.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Service("User")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    public void addUser(User user) {
        userDao.saveUser(user);
    }

    public User queryUser(User user) {
        return userDao.queryUser(user);
    }

    public User getUserById(Integer id) {
        return userDao.findUserById(id);
    }

    public User findUserPassword(String userName, String email) {
        return userDao.findUserPassword(userName, email);
    }

    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    public List<User> findUsers(Map<String, Object> map) {
        StringBuffer hql = new StringBuffer("from User where 1=1 ");
        List<Object> params = new LinkedList<Object>();

        if (map.get("userName") != null) {
            hql.append(" and userName=? ");
            params.add(map.get("userName"));
        }
        if (map.get("userRealname") != null) {
            hql.append(" and userRealname=? ");
            params.add(map.get("userRealname"));
        }
        if (map.get("userSex") != null) {
            hql.append(" and userSex=? ");
            params.add(map.get("userSex"));
        }
        if (map.get("userEmail") != null) {
            hql.append(" and userEmail=? ");
            params.add(map.get("userEmail"));
        }
        if (map.get("userTel") != null) {
            hql.append(" and userTel=? ");
            params.add(map.get("userTel"));
        }
        if (map.get("userCompany") != null) {
            hql.append(" and userCompany=? ");
            params.add(map.get("userCompany"));
        }
        if (map.get("userBirthday") != null) {
            hql.append(" and userBirthday=? ");
            params.add(map.get("userBirthday"));
        }
        if (map.get("userSecretLevel") != null) {
            hql.append(" and userSecretLevel=? ");
            params.add(map.get("userSecretLevel"));
        }
        if (map.get("userCreateTime") != null) {
            hql.append(" and userCreateTime=? ");
            params.add(map.get("userCreateTime"));
        }
        if (map.get("userIsAccepted") != null) {
            hql.append(" and userIsAccepted=? ");
            params.add(map.get("userIsAccepted"));
        }
        if (map.get("userValidateSerCode") != null) {
            hql.append(" and userValidateSerCode=? ");
            params.add(map.get("userValidateSerCode"));
        }
        if (map.get("userValidateOverDate") != null) {
            hql.append(" and userValidateOverDate=? ");
            params.add(map.get("userValidateOverDate"));
        }
        if (map.get("userUserNameEncodes") != null) {
            hql.append(" and userUserNameEncodes=? ");
            params.add(map.get("userUserNameEncodes"));
        }
        if (map.get("userIsEmailValidated") != null) {
            hql.append(" and userIsEmailValidated=? ");
            params.add(map.get("userIsEmailValidated"));
        }
        if (map.get("userPictureUrl") != null) {
            hql.append(" and userPictureUrl=? ");
            params.add(map.get("userPictureUrl"));
        }
        if (map.get("userProfile") != null) {
            hql.append(" and userProfile=? ");
            params.add(map.get("userProfile"));
        }

        System.out.println(hql.toString());
        return userDao.findUser(params, hql.toString());
    }

    public User findUserByUserName(String userName) {
        return userDao.findUserByUserName(userName);
    }

    public void saveUser(User user) {
        userDao.saveUser(user);
    }

    public List<User> getAllUser() {
        return userDao.getAllUser();
    }

    public String findUsernameBuId(int id) {
        return userDao.findUsernameBuId(id);
    }
    public void deletUser(User user){
        userDao.deletUser(user);
    }

}