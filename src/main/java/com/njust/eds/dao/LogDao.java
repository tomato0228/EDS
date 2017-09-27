package com.njust.eds.dao;

import com.njust.eds.model.File;
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

    public List<Log> findLogByUserID(int userId);

    public Log findLogByUserName(String userName);

    public Log findLogByFileID(String fileId);

    public Log findLogByFileName(String fileName);

    public void deleteLog(Log log);

    public List<Log> findLogByFileIds(List<File> Files);

    public List<Log> queryLog();
}
