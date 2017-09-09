package com.njust.eds.service.Impl;

import com.njust.eds.dao.FiledataDao;
import com.njust.eds.model.Filedata;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author tomato
 * @create 2017-09-08 下午10:39
 */
public class FiledataServiceImpl implements FiledataDao {

    @Autowired
    private FiledataDao filedataDao;

    public void saveFiledata(Filedata filedata) {
        filedataDao.saveFiledata(filedata);
    }

    public Filedata findFiledataById(Integer id) {
        return filedataDao.findFiledataById(id);
    }
}
