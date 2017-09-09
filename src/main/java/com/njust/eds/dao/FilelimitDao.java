package com.njust.eds.dao;

import com.njust.eds.model.Filelimit;

import java.util.List;

/**
 * @author tomato
 * @create 2017-09-08 下午2:27
 */
public interface FilelimitDao {

    public void saveFilelimit(Filelimit filelimit);

    public Filelimit findFilelimitById(Integer id);

    public List<Filelimit> findUser(List<Object> params, String hql);

    public void updateFilelimit(Filelimit user);
}