package com.njust.eds.dao.impl;

import com.njust.eds.dao.FileDao;
import com.njust.eds.dao.LogDao;
import com.njust.eds.dao.UserDao;
import com.njust.eds.model.File;
import com.njust.eds.model.Log;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public class LogDaoImpl extends BaseDaoImpl implements LogDao {

    @Autowired
    private UserDao userDao;

    @Autowired
    private FileDao fileDao;

    public void saveLog(Log log) {
        getSession().save(log);
    }

    @SuppressWarnings("unchecked")
    public Log queryLog(Log log) {
        String hql = "from Log where logUserId=? and logFileId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, log.getLogUserId());
        query.setParameter(1, log.getLogFileId());
        Log currentLog = null;
        List<Log> LogList = query.list();
        if (LogList != null && LogList.size() > 0) {
            currentLog = LogList.get(0);
        }
        return currentLog;
    }

    public Log findLogById(Integer id) {
        String hql = "from Log where logId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, id);
        Log log = (Log) query.uniqueResult();
        return log;
    }

    @SuppressWarnings("unchecked")
    public List<Log> findLog(List<Object> params, String hql) {
        Query query = getSession().createQuery(hql);
        if (params != null && params.size() > 0) {
            for (int i = 0; i < params.size(); i++) {
                query.setParameter(i, params.get(i));
            }
        }
        return query.list();
    }

    public void updateLog(Log log) {
        getSession().update(log);
    }

    public Log findLogByTime(Date time) {
        String hql = "from Log  where logTime=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, time);
        return (Log) query.uniqueResult();
    }

    public List<Log> findLogByUserID(int userId) {
        String hql = "from Log  where logUserId=? order by logTime desc ";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, userId);
        return  query.list();
    }

    public Log findLogByUserName(String userName) {
        String hql = "from Log  where logUserId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, userDao.findUserByUserName(userName).getUserId());
        return (Log) query.uniqueResult();
    }

    public Log findLogByFileID(String fileId) {
        String hql = "from Log  where logFileId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, fileId);
        return (Log) query.uniqueResult();
    }

    public Log findLogByFileName(String fileName) {
        String hql = "from Log  where logFileId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, fileDao.findFileByFileName(fileName).getFileId());
        return (Log) query.uniqueResult();
    }

    public void deleteLog(Log log){
        getSession().delete(log);
    }

    public List<Log> findLogByFileIds(List<File> Files) {
        String hql = "from Log  where logFileId=?";
        for (int i = 0; i < Files.size() -1; i++) {
            hql = hql + "or logFileId=?";
        }
        hql=hql+"order by logTime desc";
        Query query = getSession().createQuery(hql);
        for (int i = 0; i < Files.size(); i++) {
            query.setParameter(i,Files.get(i).getFileId());
        }
        return query.list();
    }

    public List<Log> queryLog(){
        String hql = "from Log order by logTime desc ";
        Query query=getSession().createQuery(hql);
        return query.list();
    }
}
