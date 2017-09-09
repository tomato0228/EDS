package com.njust.eds.model;

import com.njust.eds.utils.MD5Util;

import javax.persistence.*;

@Entity
@Table(name = "eds_admin", schema = "eds")
public class Admin {

    private int adminId;
    private String adminName;
    private String adminPassword;
    private int adminPower;
    private String adminTel;
    private String adminEmail;

    @Id
    @Column(name = "Admin_ID", nullable = false)
    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    @Basic
    @Column(name = "Admin_Name", nullable = false, length = 50)
    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    @Basic
    @Column(name = "Admin_Password", nullable = false, length = 50)
    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = MD5Util.getMD5(adminPassword);
    }

    @Basic
    @Column(name = "Admin_Power", nullable = true)
    public int getAdminPower() {
        return adminPower;
    }

    public void setAdminPower(int adminPower) {
        this.adminPower = adminPower;
    }

    @Basic
    @Column(name = "Admin_Tel", nullable = true, length = 20)
    public String getAdminTel() {
        return adminTel;
    }

    public void setAdminTel(String adminTel) {
        this.adminTel = adminTel;
    }

    @Basic
    @Column(name = "Admin_Email", nullable = true, length = 50)
    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Admin admin = (Admin) o;

        if (adminId != admin.adminId) return false;
        if (adminPower != admin.adminPower) return false;
        if (adminName != null ? !adminName.equals(admin.adminName) : admin.adminName != null)
            return false;
        if (adminPassword != null ? !adminPassword.equals(admin.adminPassword) : admin.adminPassword != null)
            return false;
        if (adminTel != null ? !adminTel.equals(admin.adminTel) : admin.adminTel != null) return false;
        if (adminEmail != null ? !adminEmail.equals(admin.adminEmail) : admin.adminEmail != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = adminId;
        result = 31 * result + (adminPassword != null ? adminName.hashCode() : 0);
        result = 31 * result + (adminPassword != null ? adminPassword.hashCode() : 0);
        result = 31 * result + adminPower;
        result = 31 * result + (adminTel != null ? adminTel.hashCode() : 0);
        result = 31 * result + (adminEmail != null ? adminEmail.hashCode() : 0);
        return result;
    }
}
