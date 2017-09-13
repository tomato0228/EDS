package com.njust.eds.dao.impl;

import com.njust.eds.dao.AdminDao;
import com.njust.eds.model.Admin;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdminDaoImpl extends BaseDaoImpl implements AdminDao {

    //添加用户
    public void saveAdmin(Admin admin) {
        getSession().save(admin);
    }

    //用户名和密码查找
    @SuppressWarnings("unchecked")
    public Admin queryAdmin(Admin admin) {
        String hql = "from Admin where adminName=? and adminPassword=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, admin.getAdminName());
        query.setParameter(1, admin.getAdminPassword());
        Admin currentAdmin = null;
        List<Admin> adminList = query.list();
        if (adminList != null && adminList.size() > 0) {
            currentAdmin = adminList.get(0);
        }
        return currentAdmin;
    }

    //id查找
    public Admin findAdminById(Integer id) {
        String hql = "from Admin where adminId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, id);
        Admin admin = (Admin) query.uniqueResult();
        return admin;
    }

    //其他查找
    @SuppressWarnings("unchecked")
    public List<Admin> findAdmin(List<Object> params, String hql) {
        Query query = getSession().createQuery(hql);
        if (params != null && params.size() > 0) {
            for (int i = 0; i < params.size(); i++) {
                query.setParameter(i, params.get(i));
            }
        }
        return query.list();
    }

    //更新用户信息
    public void updateAdmin(Admin admin) {
        getSession().update(admin);
    }

    //用户名查找用户
    public Admin findAdminByAdminName(String adminName) {
        String hql = "from Admin where adminName=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, adminName);
        return (Admin) query.uniqueResult();
    }

    public String findAdminnameById(int id)
    {
        String hql = "from Admin where adminId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, id);
        Admin admin=(Admin)query.uniqueResult();
        return admin.getAdminName();
    }
}
