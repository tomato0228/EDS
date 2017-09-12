package com.njust.eds.service.Impl;

import com.njust.eds.dao.FilelimitDao;
import com.njust.eds.model.Filelimit;
import com.njust.eds.service.FilelimitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * @author tomato
 * @create 2017-09-08 下午10:22
 */
@Service("Filelimit")
public class FilelimitServiceImpl implements FilelimitService {

    @Autowired
    private FilelimitDao filelimitDao;

    public void saveFilelimit(Filelimit filelimit) {
        filelimitDao.saveFilelimit(filelimit);
    }

    public Filelimit getFilelimitById(Integer id) {
        return filelimitDao.findFilelimitById(id);
    }

    public List<Filelimit> findFilelimit(Map<String, Object> map) {
        StringBuffer hql = new StringBuffer("from Filelimit where 1=1 ");
        List<Object> params = new LinkedList<Object>();
        if (map.get("fileRead") != null) {
            hql.append(" and fileRead=? ");
            params.add(map.get("fileRead"));
        }
        if (map.get("fileWrite") != null) {
            hql.append(" and fileWrite=? ");
            params.add(map.get("fileWrite"));
        }
        if (map.get("filePrint") != null) {
            hql.append(" and filePrint=? ");
            params.add(map.get("filePrint"));
        }
        if (map.get("fileReadTimes") != null) {
            hql.append(" and fileReadTimes=? ");
            params.add(map.get("fileReadTimes"));
        }
        if (map.get("fileLifeCycle") != null) {
            hql.append(" and fileLifeCycle=? ");
            params.add(map.get("fileLifeCycle"));
        }
        System.out.println(hql.toString());
        return filelimitDao.findUser(params, hql.toString());
    }

    public void updateUser(Filelimit filelimit) {
        filelimitDao.updateFilelimit(filelimit);
    }
}
