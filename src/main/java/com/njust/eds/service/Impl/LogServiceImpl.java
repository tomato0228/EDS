package com.njust.eds.service.Impl;

import com.njust.eds.dao.LogDao;
import com.njust.eds.model.File;
import com.njust.eds.model.Log;
import com.njust.eds.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Service("Log")
public class LogServiceImpl implements LogService {

    @Autowired
    private LogDao logDao;

    public void addLog(Log log) {
        logDao.saveLog(log);
    }

    public Log queryLog(Log log) {
        return logDao.queryLog(log);
    }

    public Log getLogById(Integer id) {
        return logDao.findLogById(id);
    }

    public List<Log> findLogs(Map<String, Object> map) {
        StringBuffer hql = new StringBuffer("from Log where 1=1 ");
        List<Object> params = new LinkedList<Object>();

        if (map.get("logTime") != null) {
            hql.append(" and logTime=? ");
            params.add(map.get("logTime"));
        }
        if (map.get("logUserId") != null) {
            hql.append(" and logUserId=? ");
            params.add(map.get("logUserId"));
        }
        if (map.get("logOptype") != null) {
            hql.append(" and logOptype=? ");
            params.add(map.get("logOptype"));
        }
        if (map.get("logFileId") != null) {
            hql.append(" and logFileId=? ");
            params.add(map.get("logFileId"));
        }
        if (map.get("logSignature") != null) {
            hql.append(" and logSignature=? ");
            params.add(map.get("logSignature"));
        }
        System.out.println(hql.toString());
        return logDao.findLog(params, hql.toString());
    }

    public void updateLog(Log log) {
        logDao.updateLog(log);
    }

    public Log findLogByTime(Date time) {
        return logDao.findLogByTime(time);
    }

    public List<Log> findLogByUserID(int userId) {
        return logDao.findLogByUserID(userId);
    }

    public Log findLogByUserName(String userName) {
        return logDao.findLogByUserName(userName);
    }

    public Log findLogByFileID(String fileId) {
        return logDao.findLogByFileID(fileId);
    }

    public Log findLogByFileName(String fileName) {
        return logDao.findLogByFileName(fileName);
    }

    public void deleteLog(Log log){
        logDao.deleteLog(log);
    }
    public List<Log> findLogByFileIds(List<File> Files)
    {
       return logDao.findLogByFileIds(Files);
    }
}
