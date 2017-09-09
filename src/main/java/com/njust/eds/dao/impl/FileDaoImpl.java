package com.njust.eds.dao.impl;

import com.njust.eds.dao.FileDao;
import com.njust.eds.model.File;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FileDaoImpl extends BaseDaoImpl implements FileDao {

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
}
