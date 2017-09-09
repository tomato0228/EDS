package com.njust.eds.service;

import com.njust.eds.model.Log;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface LogService {

    public void addLog(Log log);

    public Log queryLog(Log log);

    public Log getLogById(Integer id);

    public List<Log> findLogs(Map<String, Object> map);

    public void updateLog(Log log);

    public Log findLogByTime(Date time);

    public Log findLogByUserID(String userId);

    public Log findLogByUserName(String userName);

    public Log findLogByFileID(String fileId);

    public Log findLogByFileName(String fileName);
}

