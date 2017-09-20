package com.njust.eds.service;

import com.njust.eds.model.Admin;

import java.util.List;
import java.util.Map;

public interface AdminService {

    public void addAdmin(Admin admin);

    public Admin queryAdmin(Admin admin);

    public Admin getAdminById(Integer id);

    public List<Admin> findAdmin(Map<String, Object> map);

    public void updateAdmin(Admin admin);

    public void saveAdmin(Admin admin);

    public Admin findAdminByAdminName(String adminName);

    public String findAdminnameById(int id);

    public List<Admin> getAllAdmin();

    public void deletAdmin(Admin admin);

    public void admin_power(int id,int power );
}
