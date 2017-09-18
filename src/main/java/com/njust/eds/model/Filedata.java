package com.njust.eds.model;

import javax.persistence.*;
import java.util.Arrays;

@Entity
@Table(name = "eds_filedata", schema = "eds")
public class Filedata {

    private int fileId;
    private byte[] fileData;

    @Id
    @Column(name = "File_ID", nullable = false)
    public int getFileId() {
        return fileId;
    }

    public void setFileId(int fileId) {
        this.fileId = fileId;
    }

    @Basic
    @Column(name = "File_Data", nullable = true)
    public byte[] getFileData() {
        return fileData;
    }

    public void setFileData(byte[] fileData) {
        this.fileData = fileData;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Filedata that = (Filedata) o;

        if (fileId != that.fileId) return false;
        if (!Arrays.equals(fileData, that.fileData)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = fileId;
        result = 31 * result + Arrays.hashCode(fileData);
        return result;
    }
    @Override
    public String toString() {
        return "Filedata{" +
                "fileId=" + fileId +
                '}';
    }

}
