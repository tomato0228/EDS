package com.njust.eds.dao;

import com.njust.eds.model.Admin;

import java.util.List;

public interface AdminDao {

    public void saveAdmin(Admin admin);

    public Admin queryAdmin(Admin admin);

    public Admin findAdminById(Integer id);

    public List<Admin> findAdmin(List<Object> params, String hql);

    public void updateAdmin(Admin admin);

    public Admin findAdminByAdminName(String adminName);
}
