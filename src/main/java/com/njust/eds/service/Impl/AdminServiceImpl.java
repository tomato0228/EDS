package com.njust.eds.service.Impl;

import com.njust.eds.dao.AdminDao;
import com.njust.eds.model.Admin;
import com.njust.eds.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Service("Admin")
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    public void addAdmin(Admin admin) {
        adminDao.saveAdmin(admin);
    }

    public Admin queryAdmin(Admin admin) {
        return adminDao.queryAdmin(admin);
    }

    public Admin getAdminById(Integer id) {
        return adminDao.findAdminById(id);
    }

    public List<Admin> findAdmin(Map<String, Object> map) {
        StringBuffer hql = new StringBuffer("from Admin where 1=1 ");
        List<Object> params = new LinkedList<Object>();

        if (map.get("adminName") != null) {
            hql.append(" and adminName=? ");
            params.add(map.get("adminName"));
        }
        if (map.get("adminPower") != null) {
            hql.append(" and adminPower=? ");
            params.add(map.get("adminPower"));
        }
        if (map.get("adminTel") != null) {
            hql.append(" and adminTel=? ");
            params.add(map.get("adminTel"));
        }
        if (map.get("adminEmail") != null) {
            hql.append(" and adminEmail=? ");
            params.add(map.get("adminEmail"));
        }
        System.out.println(hql.toString());
        return adminDao.findAdmin(params, hql.toString());
    }

    public void updateAdmin(Admin admin) {
        adminDao.updateAdmin(admin);
    }

    public void saveAdmin(Admin admin) {
        adminDao.saveAdmin(admin);
    }

    public Admin findAdminByAdminName(String adminName) {
        return adminDao.findAdminByAdminName(adminName);
    }
}
