package com.njust.eds.dao.impl;

import com.njust.eds.dao.FileDao;
import com.njust.eds.dao.UserDao;
import com.njust.eds.model.File;
import com.njust.eds.model.User;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class FileDaoImpl extends BaseDaoImpl implements FileDao {

   @Autowired
    private UserDao userDao;

    public void saveFile(File file) {
        getSession().save(file);
    }

    public File findFileById(Integer id) {
        String hql = "from File where fileId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, id);
        File file = (File) query.uniqueResult();
        return file;
    }
    public List<File> findFileByUserId(int userId){
        String hql = "from File where fileUserId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, userId);
        return query.list();
    }
    @SuppressWarnings("unchecked")
    public List<File> findFile(List<Object> params, String hql) {
        Query query = getSession().createQuery(hql);
        if (params != null && params.size() > 0) {
            for (int i = 0; i < params.size(); i++) {
                query.setParameter(i, params.get(i));
            }
        }
        return query.list();
    }

    public void updateFile(File file) {
        getSession().update(file);
    }

    public File findFileByFileName(String fileName) {
        String hql = "from File where fileName=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, fileName);
        return (File) query.uniqueResult();
    }

    public File queryFile(File file) {
        return null;
    }

    public List<List<File>>findUserFiles(){

        List<List<File>> userfiles=new ArrayList<List<File>>();
        List<User> userlist=userDao.getAllUser();
        for( User user:userlist) {
            List<File> filelist = findFileByUserId(user.getUserId());
            userfiles.add(filelist);
        }
        return userfiles;
    }
}
