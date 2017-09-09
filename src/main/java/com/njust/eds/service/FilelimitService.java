package com.njust.eds.service;

import com.njust.eds.model.Filelimit;

import java.util.List;
import java.util.Map;

/**
 * @author tomato
 * @create 2017-09-08 下午10:21
 */
public interface FilelimitService {

    public void saveFilelimit(Filelimit filelimit);

    public Filelimit getFilelimitById(Integer id);

    public List<Filelimit> findFilelimit(Map<String, Object> map);

    public void updateUser(Filelimit filelimit);
}
