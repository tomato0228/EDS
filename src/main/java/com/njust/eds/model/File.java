package com.njust.eds.model;

import javax.persistence.*;
import java.util.Arrays;
import java.util.Date;

@Entity
@Table(name = "eds_file", schema = "eds")
public class File {

    private int fileId;
    private String fileName;
    private String fileSize;
    private Date fileLoadTime;
    private int fileUserId;
    private Integer fileShare;
    private int fileSecretLevel;
    private String fileAbstrcat;
    private byte[] fileSecretKey;
    private Integer fileViewtimes;
    private Integer filePrinttimes;
    private Integer fileDownloadtimes;
    private String fileType;

    private User user;
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }



    @Id
    @Column(name = "File_ID", nullable = false)
    public int getFileId() {
        return fileId;
    }

    public void setFileId(int fileId) {
        this.fileId = fileId;
    }

    @Basic
    @Column(name = "File_Name", nullable = false, length = 255)
    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    @Basic
    @Column(name = "File_Size", nullable = true, length = 255)
    public String getFileSize() {
        return fileSize;
    }

    public void setFileSize(String fileSize) {
        this.fileSize = fileSize;
    }

    @Basic
    @Column(name = "File_LoadTime", nullable = true)
    public Date getFileLoadTime() {
        return fileLoadTime;
    }

    public void setFileLoadTime(Date fileLoadTime) {
        this.fileLoadTime = fileLoadTime;
    }

    @Basic
    @Column(name = "File_UserID", nullable = false)
    public int getFileUserId() {
        return fileUserId;
    }

    public void setFileUserId(int fileUserId) {
        this.fileUserId = fileUserId;
    }

    @Basic
    @Column(name = "File_Share", nullable = true)
    public Integer getFileShare() {
        return fileShare;
    }

    public void setFileShare(Integer fileShare) {
        this.fileShare = fileShare;
    }

    @Basic
    @Column(name = "File_SecretLevel", nullable = true)
    public int getFileSecretLevel() {
        return fileSecretLevel;
    }

    public void setFileSecretLevel(int fileSecretLevel) {
        this.fileSecretLevel = fileSecretLevel;
    }

    @Basic
    @Column(name = "File_Abstrcat", nullable = true, length = 1000)
    public String getFileAbstrcat() {
        return fileAbstrcat;
    }

    public void setFileAbstrcat(String fileAbstrcat) {
        this.fileAbstrcat = fileAbstrcat;
    }

    @Basic
    @Column(name = "File_SecretKey", nullable = true)
    public byte[] getFileSecretKey() {
        return fileSecretKey;
    }

    public void setFileSecretKey(byte[] fileSecretKey) {
        this.fileSecretKey = fileSecretKey;
    }

    @Basic
    @Column(name = "File_Viewtimes", nullable = true)
    public Integer getFileViewtimes() {
        return fileViewtimes;
    }

    public void setFileViewtimes(Integer fileViewtimes) {
        this.fileViewtimes = fileViewtimes;
    }

    @Basic
    @Column(name = "File_Printtimes", nullable = true)
    public Integer getFilePrinttimes() {
        return filePrinttimes;
    }

    public void setFilePrinttimes(Integer filePrinttimes) {
        this.filePrinttimes = filePrinttimes;
    }

    @Basic
    @Column(name = "File_Type", nullable = true)
    public String getFileType() { return fileType; }
    public void setFileType(String fileType) {this.fileType = fileType; }

    @Basic
    @Column(name = "File_Downloadtimes", nullable = true)
    public Integer getFileDownloadtimes() {
        return fileDownloadtimes;
    }

    public void setFileDownloadtimes(Integer fileDownloadtimes) {
        this.fileDownloadtimes = fileDownloadtimes;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        File file = (File) o;

        if (fileId != file.fileId) return false;
        if (fileUserId != file.fileUserId) return false;
        if (fileSecretLevel != file.fileSecretLevel) return false;
        if (fileName != null ? !fileName.equals(file.fileName) : file.fileName != null) return false;
        if (fileSize != null ? !fileSize.equals(file.fileSize) : file.fileSize != null) return false;
        if (fileLoadTime != null ? !fileLoadTime.equals(file.fileLoadTime) : file.fileLoadTime != null)
            return false;
        if (fileShare != null ? !fileShare.equals(file.fileShare) : file.fileShare != null) return false;
        if (fileAbstrcat != null ? !fileAbstrcat.equals(file.fileAbstrcat) : file.fileAbstrcat != null)
            return false;
        if (!Arrays.equals(fileSecretKey, file.fileSecretKey)) return false;
        if (fileViewtimes != null ? !fileViewtimes.equals(file.fileViewtimes) : file.fileViewtimes != null)
            return false;
        if (filePrinttimes != null ? !filePrinttimes.equals(file.filePrinttimes) : file.filePrinttimes != null)
            return false;
        if (fileDownloadtimes != null ? !fileDownloadtimes.equals(file.fileDownloadtimes) : file.fileDownloadtimes != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = fileId;
        result = 31 * result + (fileName != null ? fileName.hashCode() : 0);
        result = 31 * result + (fileSize != null ? fileSize.hashCode() : 0);
        result = 31 * result + (fileLoadTime != null ? fileLoadTime.hashCode() : 0);
        result = 31 * result + fileUserId;
        result = 31 * result + (fileShare != null ? fileShare.hashCode() : 0);
        result = 31 * result + fileSecretLevel;
        result = 31 * result + (fileAbstrcat != null ? fileAbstrcat.hashCode() : 0);
        result = 31 * result + Arrays.hashCode(fileSecretKey);
        result = 31 * result + (fileViewtimes != null ? fileViewtimes.hashCode() : 0);
        result = 31 * result + (filePrinttimes != null ? filePrinttimes.hashCode() : 0);
        result = 31 * result + (fileDownloadtimes != null ? fileDownloadtimes.hashCode() : 0);
        return result;
    }
}
