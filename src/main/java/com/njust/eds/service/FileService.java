package com.njust.eds.service;

import com.njust.eds.model.File;

import java.util.List;
import java.util.Map;

public interface FileService {

    public void addFile(File file);

    public File queryFile(File file);

    public File getFileById(Integer id);

    public List<File> findFiles(Map<String, Object> map);

    public List<File> findFileByUserId(int userId);

    public void updateFile(File file);

    public void saveFile(File file);

    public File findFileByFileName(String fileName);
    public List<List<File>>findUserFiles();

}
