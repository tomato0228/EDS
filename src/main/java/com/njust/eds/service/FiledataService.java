package com.njust.eds.service;

import com.njust.eds.model.Filedata;

/**
 * @author tomato
 * @create 2017-09-08 下午10:39
 */
public interface FiledataService {

    public void saveFiledata(Filedata filedata);

    public Filedata getFiledataById(Integer id);
}
