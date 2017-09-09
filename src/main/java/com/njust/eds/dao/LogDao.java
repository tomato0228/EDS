package com.njust.eds.dao;

import com.njust.eds.model.Log;

import java.util.Date;
import java.util.List;

public interface LogDao {

    public void saveLog(Log log);

    public Log queryLog(Log log);

    public Log findLogById(Integer id);

    public List<Log> findLog(List<Object> params, String hql);

    public void updateLog(Log log);

    public Log findLogByTime(Date time);

    public Log findLogByUserID(String userId);

    public Log findLogByUserName(String userName);

    public Log findLogByFileID(String fileId);

    public Log findLogByFileName(String fileName);
}
