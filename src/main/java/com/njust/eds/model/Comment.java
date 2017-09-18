package com.njust.eds.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "eds_comment", schema = "eds")
public class Comment {

    private int comId;
    private int comSender;
    private int comRecevier;
    private String comData;
    private Date comTime;
    private int isRead = 0;

    @Id
    @Column(name = "Com_ID", nullable = false)
    public int getComId() {
        return comId;
    }

    public void setComId(int comId) {
        this.comId = comId;
    }

    @Basic
    @Column(name = "Com_Sender", nullable = false)
    public int getComSender() {
        return comSender;
    }

    public void setComSender(int comSender) {
        this.comSender = comSender;
    }

    @Basic
    @Column(name = "Com_Recevier", nullable = false)
    public int getComRecevier() {
        return comRecevier;
    }

    public void setComRecevier(int comRecevier) {
        this.comRecevier = comRecevier;
    }

    @Basic
    @Column(name = "Com_Data", nullable = false, length = 1000)
    public String getComData() {
        return comData;
    }

    public void setComData(String comData) {
        this.comData = comData;
    }

    @Basic
    @Column(name = "Com_Time", nullable = false)
    public Date getComTime() {
        return comTime;
    }

    public void setComTime(Date comTime) {
        this.comTime = comTime;
    }

    @Basic
    @Column(name = "Com_isRead", nullable = false)
    public int getIsRead() {
        return isRead;
    }

    public void setIsRead(int isRead) {
        this.isRead = isRead;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Comment that = (Comment) o;

        if (comId != that.comId) return false;
        if (comSender != that.comSender) return false;
        if (comRecevier != that.comRecevier) return false;
        if (isRead != that.isRead) return false;
        if (comData != null ? !comData.equals(that.comData) : that.comData != null) return false;
        if (comTime != null ? !comTime.equals(that.comTime) : that.comTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = comId;
        result = 31 * result + comSender;
        result = 31 * result + comRecevier;
        result = 31 * result + isRead;
        result = 31 * result + (comData != null ? comData.hashCode() : 0);
        result = 31 * result + (comTime != null ? comTime.hashCode() : 0);
        return result;
    }
}
