package com.njust.eds.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "eds_user", schema = "eds")
public class User {

    private int userId;
    private String userPassword;
    private String userName;
    private String userRealname;
    private int userSex = 2;
    private String userEmail;
    private String userTel;
    private String userCompany;
    private Date userBirthday;
    private int userSecretLevel = 1;
    private Date userCreateTime;
    private Integer userIsAccepted = 0;
    private String userValidateSerCode;
    private Date userValidateOverDate;
    private String userUserNameEncodes;
    private Integer userIsEmailValidated = 0;
    private String userPictureUrl = "${ctx}/resources/img/ui-sam.jpg";
    private String userProfile;


    @Id
    @Column(name = "User_ID", nullable = false)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "User_Password", nullable = false, length = 50)
    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    @Basic
    @Column(name = "User_Name", nullable = false, length = 50)
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Basic
    @Column(name = "User_Realname", nullable = true, length = 50)
    public String getUserRealname() {
        return userRealname;
    }

    public void setUserRealname(String userRealname) {
        this.userRealname = userRealname;
    }

    @Basic
    @Column(name = "User_Sex", nullable = true)
    public int getUserSex() {
        return userSex;
    }

    public void setUserSex(int userSex) {
        this.userSex = userSex;
    }

    @Basic
    @Column(name = "User_Email", nullable = false, length = 50)
    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    @Basic
    @Column(name = "User_Tel", nullable = true, length = 20)
    public String getUserTel() {
        return userTel;
    }

    public void setUserTel(String userTel) {
        this.userTel = userTel;
    }

    @Basic
    @Column(name = "User_Company", nullable = true, length = 255)
    public String getUserCompany() {
        return userCompany;
    }

    public void setUserCompany(String userCompany) {
        this.userCompany = userCompany;
    }

    @Basic
    @Column(name = "User_Birthday", nullable = true)
    public Date getUserBirthday() {
        return userBirthday;
    }

    public void setUserBirthday(Date userBirthday) {
        this.userBirthday = userBirthday;
    }

    @Basic
    @Column(name = "User_SecretLevel", nullable = true)
    public int getUserSecretLevel() {
        return userSecretLevel;
    }

    public void setUserSecretLevel(int userSecretLevel) {
        this.userSecretLevel = userSecretLevel;
    }

    @Basic
    @Column(name = "User_CreateTime", nullable = true)
    public Date getUserCreateTime() {
        return userCreateTime;
    }

    public void setUserCreateTime(Date userCreateTime) {
        this.userCreateTime = userCreateTime;
    }

    @Basic
    @Column(name = "User_IsAccepted", nullable = true)
    public Integer getUserIsAccepted() {
        return userIsAccepted;
    }

    public void setUserIsAccepted(Integer userIsAccepted) {
        this.userIsAccepted = userIsAccepted;
    }

    @Basic
    @Column(name = "User_ValidateSerCode", nullable = true, length = 255)
    public String getUserValidateSerCode() {
        return userValidateSerCode;
    }

    public void setUserValidateSerCode(String userValidateSerCode) {
        this.userValidateSerCode = userValidateSerCode;
    }

    @Basic
    @Column(name = "User_ValidateOverDate", nullable = true)
    public Date getUserValidateOverDate() {
        return userValidateOverDate;
    }

    public void setUserValidateOverDate(Date userValidateOverDate) {
        this.userValidateOverDate = userValidateOverDate;
    }

    @Basic
    @Column(name = "User_UserNameEncodes", nullable = true, length = 255)
    public String getUserUserNameEncodes() {
        return userUserNameEncodes;
    }

    public void setUserUserNameEncodes(String userUserNameEncodes) {
        this.userUserNameEncodes = userUserNameEncodes;
    }

    @Basic
    @Column(name = "User_IsEmailValidated", nullable = true)
    public Integer getUserIsEmailValidated() {
        return userIsEmailValidated;
    }

    public void setUserIsEmailValidated(Integer userIsEmailValidated) {
        this.userIsEmailValidated = userIsEmailValidated;
    }

    @Basic
    @Column(name = "User_PictureUrl", nullable = true, length = 255)
    public String getUserPictureUrl() {
        return userPictureUrl;
    }

    public void setUserPictureUrl(String userPictureUrl) {
        this.userPictureUrl = userPictureUrl;
    }

    @Basic
    @Column(name = "User_Profile", nullable = true, length = 255)
    public String getUserProfile() {
        return userProfile;
    }

    public void setUserProfile(String userProfile) {
        this.userProfile = userProfile;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (userId != user.userId) return false;
        if (userSex != user.userSex) return false;
        if (userSecretLevel != user.userSecretLevel) return false;
        if (userPassword != null ? !userPassword.equals(user.userPassword) : user.userPassword != null)
            return false;
        if (userName != null ? !userName.equals(user.userName) : user.userName != null) return false;
        if (userRealname != null ? !userRealname.equals(user.userRealname) : user.userRealname != null)
            return false;
        if (userEmail != null ? !userEmail.equals(user.userEmail) : user.userEmail != null) return false;
        if (userTel != null ? !userTel.equals(user.userTel) : user.userTel != null) return false;
        if (userCompany != null ? !userCompany.equals(user.userCompany) : user.userCompany != null) return false;
        if (userBirthday != null ? !userBirthday.equals(user.userBirthday) : user.userBirthday != null)
            return false;
        if (userCreateTime != null ? !userCreateTime.equals(user.userCreateTime) : user.userCreateTime != null)
            return false;
        if (userIsAccepted != null ? !userIsAccepted.equals(user.userIsAccepted) : user.userIsAccepted != null)
            return false;
        if (userValidateSerCode != null ? !userValidateSerCode.equals(user.userValidateSerCode) : user.userValidateSerCode != null)
            return false;
        if (userValidateOverDate != null ? !userValidateOverDate.equals(user.userValidateOverDate) : user.userValidateOverDate != null)
            return false;
        if (userUserNameEncodes != null ? !userUserNameEncodes.equals(user.userUserNameEncodes) : user.userUserNameEncodes != null)
            return false;
        if (userIsEmailValidated != null ? !userIsEmailValidated.equals(user.userIsEmailValidated) : user.userIsEmailValidated != null)
            return false;
        if (userPictureUrl != null ? !userPictureUrl.equals(user.userPictureUrl) : user.userPictureUrl != null)
            return false;
        if (userProfile != null ? !userProfile.equals(user.userProfile) : user.userProfile != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 31 * result + (userPassword != null ? userPassword.hashCode() : 0);
        result = 31 * result + (userName != null ? userName.hashCode() : 0);
        result = 31 * result + (userRealname != null ? userRealname.hashCode() : 0);
        result = 31 * result + userSex;
        result = 31 * result + (userEmail != null ? userEmail.hashCode() : 0);
        result = 31 * result + (userTel != null ? userTel.hashCode() : 0);
        result = 31 * result + (userCompany != null ? userCompany.hashCode() : 0);
        result = 31 * result + (userBirthday != null ? userBirthday.hashCode() : 0);
        result = 31 * result + userSecretLevel;
        result = 31 * result + (userCreateTime != null ? userCreateTime.hashCode() : 0);
        result = 31 * result + (userIsAccepted != null ? userIsAccepted.hashCode() : 0);
        result = 31 * result + (userValidateSerCode != null ? userValidateSerCode.hashCode() : 0);
        result = 31 * result + (userValidateOverDate != null ? userValidateOverDate.hashCode() : 0);
        result = 31 * result + (userUserNameEncodes != null ? userUserNameEncodes.hashCode() : 0);
        result = 31 * result + (userIsEmailValidated != null ? userIsEmailValidated.hashCode() : 0);
        result = 31 * result + (userPictureUrl != null ? userPictureUrl.hashCode() : 0);
        result = 31 * result + (userProfile != null ? userProfile.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userPassword='" + userPassword + '\'' +
                ", userName='" + userName + '\'' +
                ", userRealname='" + userRealname + '\'' +
                ", userSex=" + userSex +
                ", userEmail='" + userEmail + '\'' +
                ", userTel='" + userTel + '\'' +
                ", userCompany='" + userCompany + '\'' +
                ", userBirthday=" + userBirthday +
                ", userSecretLevel=" + userSecretLevel +
                ", userCreateTime=" + userCreateTime +
                ", userIsAccepted=" + userIsAccepted +
                ", userValidateSerCode='" + userValidateSerCode + '\'' +
                ", userValidateOverDate=" + userValidateOverDate +
                ", userUserNameEncodes='" + userUserNameEncodes + '\'' +
                ", userIsEmailValidated=" + userIsEmailValidated +
                ", userPictureUrl='" + userPictureUrl + '\'' +
                ", userProfile='" + userProfile + '\'' +
                '}';
    }
}
