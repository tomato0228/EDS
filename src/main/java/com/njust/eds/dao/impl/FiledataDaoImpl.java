package com.njust.eds.dao.impl;

import com.njust.eds.dao.FiledataDao;
import com.njust.eds.model.Filedata;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

/**
 * @author tomato
 * @create 2017-09-08 下午2:24
 */
@Repository
public class FiledataDaoImpl extends BaseDaoImpl implements FiledataDao {

    //保存文件内容
    public void saveFiledata(Filedata filedata) {
        getSession().save(filedata);
    }

    //ID查找文件内容
    public Filedata findFiledataById(Integer id) {
        String hql = "from Filedata where fileId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, id);
        Filedata filedata = (Filedata) query.uniqueResult();
        return filedata;
    }
}
