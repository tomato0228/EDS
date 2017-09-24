package com.njust.eds.service.Impl;

import com.njust.eds.dao.FileDao;
import com.njust.eds.model.File;
import com.njust.eds.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Service("File")
public class FileServiceImpl implements FileService {

    @Autowired
    private FileDao fileDao;

    public void addFile(File file) {
        fileDao.saveFile(file);
    }

    public File queryFile(File file) {
        return fileDao.queryFile(file);
    }

    public File getFileById(Integer id) {
        return fileDao.findFileById(id);
    }

    public List<File> findFileByUserId(int userId) {
        return fileDao.findFileByUserId(userId);
    }

    public List<File> findFiles(Map<String, Object> map) {
        StringBuffer hql = new StringBuffer("from File where 1=1 ");
        List<Object> params = new LinkedList<Object>();
        if (map.get("fileName") != null) {
            hql.append(" and fileName=? ");
            params.add(map.get("fileName"));
        }
        if (map.get("fileSize") != null) {
            hql.append(" and fileSize=? ");
            params.add(map.get("fileSize"));
        }
        if (map.get("fileLoadTime") != null) {
            hql.append(" and fileLoadTime=? ");
            params.add(map.get("fileLoadTime"));
        }
        if (map.get("fileUserId") != null) {
            hql.append(" and fileUserId=? ");
            params.add(map.get("fileUserId"));
        }
        if (map.get("fileShare") != null) {
            hql.append(" and fileShare=? ");
            params.add(map.get("fileShare"));
        }
        if (map.get("fileSecretLevel") != null) {
            hql.append(" and fileSecretLevel=? ");
            params.add(map.get("fileSecretLevel"));
        }
        if (map.get("fileAbstrcat") != null) {
            hql.append(" and fileAbstrcat=? ");
            params.add(map.get("fileAbstrcat"));
        }
        if (map.get("fileSecretKey") != null) {
            hql.append(" and fileSecretKey=? ");
            params.add(map.get("fileSecretKey"));
        }
        if (map.get("fileViewtimes") != null) {
            hql.append(" and fileViewtimes=? ");
            params.add(map.get("fileViewtimes"));
        }
        if (map.get("filePrinttimes") != null) {
            hql.append(" and filePrinttimes=? ");
            params.add(map.get("filePrinttimes"));
        }
        if (map.get("fileDownloadtimes") != null) {
            hql.append(" and fileDownloadtimes=? ");
            params.add(map.get("fileDownloadtimes"));
        }
        hql.append(" order by fileLoadTime desc ");
        System.out.println(hql.toString());
        return fileDao.findFile(params, hql.toString());
    }

    public void updateFile(File file) {
        fileDao.updateFile(file);
    }

    public void saveFile(File file) {
        fileDao.saveFile(file);
    }

    public File findFileByFileName(String fileName) {
        return fileDao.findFileByFileName(fileName);
    }

    public List<List<File>> findUserFiles() {
        return fileDao.findUserFiles();
    }

    public void deletFile(File file){
        fileDao.deletFile(file);
    }

    public void share(int id){fileDao.share(id);}
}
