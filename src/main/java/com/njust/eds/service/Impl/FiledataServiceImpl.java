package com.njust.eds.service.Impl;

import com.njust.eds.dao.FiledataDao;
import com.njust.eds.model.Filedata;
import com.njust.eds.service.FiledataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author tomato
 * @create 2017-09-08 下午10:39
 */
@Service("Filedata")
public class FiledataServiceImpl implements FiledataService {

    @Autowired
    private FiledataDao filedataDao;

    public void saveFiledata(Filedata filedata) {
        filedataDao.saveFiledata(filedata);
    }

    public Filedata getFiledataById(Integer id) {
        return filedataDao.findFiledataById(id);
    }
}
