package com.njust.eds.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "eds_log", schema = "eds")
public class Log {

    private int logId;
    private Date logTime;
    private int logUserId;
    private Integer logOptype;
    private int logFileId;
    private String logSignature;

    @Id
    @Column(name = "Log_ID", nullable = false)
    public int getLogId() {
        return logId;
    }

    public void setLogId(int logId) {
        this.logId = logId;
    }

    @Basic
    @Column(name = "Log_Time", nullable = true)
    public Date getLogTime() {
        return logTime;
    }

    public void setLogTime(Date logTime) {
        this.logTime = logTime;
    }

    @Basic
    @Column(name = "Log_UserID", nullable = false)
    public int getLogUserId() {
        return logUserId;
    }

    public void setLogUserId(int logUserId) {
        this.logUserId = logUserId;
    }

    @Basic
    @Column(name = "Log_Optype", nullable = true)
    public Integer getLogOptype() {
        return logOptype;
    }

    public void setLogOptype(Integer logOptype) {
        this.logOptype = logOptype;
    }

    @Basic
    @Column(name = "Log_FileID", nullable = false)
    public int getLogFileId() {
        return logFileId;
    }

    public void setLogFileId(int logFileId) {
        this.logFileId = logFileId;
    }

    @Basic
    @Column(name = "Log_Signature", nullable = true, length = 1000)
    public String getLogSignature() {
        return logSignature;
    }

    public void setLogSignature(String logSignature) {
        this.logSignature = logSignature;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Log log = (Log) o;

        if (logId != log.logId) return false;
        if (logUserId != log.logUserId) return false;
        if (logFileId != log.logFileId) return false;
        if (logTime != null ? !logTime.equals(log.logTime) : log.logTime != null) return false;
        if (logOptype != null ? !logOptype.equals(log.logOptype) : log.logOptype != null) return false;
        if (logSignature != null ? !logSignature.equals(log.logSignature) : log.logSignature != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = logId;
        result = 31 * result + (logTime != null ? logTime.hashCode() : 0);
        result = 31 * result + logUserId;
        result = 31 * result + (logOptype != null ? logOptype.hashCode() : 0);
        result = 31 * result + logFileId;
        result = 31 * result + (logSignature != null ? logSignature.hashCode() : 0);
        return result;
    }
}
