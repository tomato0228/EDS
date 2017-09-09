package com.njust.eds.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "eds_filelimit", schema = "eds")
public class Filelimit {

    private int fileId;
    private Integer fileRead;
    private Integer fileWrite;
    private Integer filePrint;
    private Integer fileReadTimes;
    private Date fileLifeCycle;

    @Id
    @Column(name = "File_ID", nullable = false)
    public int getFileId() {
        return fileId;
    }

    public void setFileId(int fileId) {
        this.fileId = fileId;
    }

    @Basic
    @Column(name = "File_Read", nullable = true)
    public Integer getFileRead() {
        return fileRead;
    }

    public void setFileRead(Integer fileRead) {
        this.fileRead = fileRead;
    }

    @Basic
    @Column(name = "File_Write", nullable = true)
    public Integer getFileWrite() {
        return fileWrite;
    }

    public void setFileWrite(Integer fileWrite) {
        this.fileWrite = fileWrite;
    }

    @Basic
    @Column(name = "File_Print", nullable = true)
    public Integer getFilePrint() {
        return filePrint;
    }

    public void setFilePrint(Integer filePrint) {
        this.filePrint = filePrint;
    }

    @Basic
    @Column(name = "File_ReadTimes", nullable = true)
    public Integer getFileReadTimes() {
        return fileReadTimes;
    }

    public void setFileReadTimes(Integer fileReadTimes) {
        this.fileReadTimes = fileReadTimes;
    }

    @Basic
    @Column(name = "File_LifeCycle", nullable = true)
    public Date getFileLifeCycle() {
        return fileLifeCycle;
    }

    public void setFileLifeCycle(Date fileLifeCycle) {
        this.fileLifeCycle = fileLifeCycle;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Filelimit that = (Filelimit) o;

        if (fileId != that.fileId) return false;
        if (fileRead != null ? !fileRead.equals(that.fileRead) : that.fileRead != null) return false;
        if (fileWrite != null ? !fileWrite.equals(that.fileWrite) : that.fileWrite != null) return false;
        if (filePrint != null ? !filePrint.equals(that.filePrint) : that.filePrint != null) return false;
        if (fileReadTimes != null ? !fileReadTimes.equals(that.fileReadTimes) : that.fileReadTimes != null)
            return false;
        if (fileLifeCycle != null ? !fileLifeCycle.equals(that.fileLifeCycle) : that.fileLifeCycle != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = fileId;
        result = 31 * result + (fileRead != null ? fileRead.hashCode() : 0);
        result = 31 * result + (fileWrite != null ? fileWrite.hashCode() : 0);
        result = 31 * result + (filePrint != null ? filePrint.hashCode() : 0);
        result = 31 * result + (fileReadTimes != null ? fileReadTimes.hashCode() : 0);
        result = 31 * result + (fileLifeCycle != null ? fileLifeCycle.hashCode() : 0);
        return result;
    }
}
