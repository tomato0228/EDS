package com.njust.eds.dao;

import com.njust.eds.model.Filedata;

/**
 * @author tomato
 * @create 2017-09-08 下午2:20
 */
public interface FiledataDao {

    public void saveFiledata(Filedata filedata);

    public Filedata findFiledataById(Integer id);
}
