package com.njust.eds.dao.impl;

import com.njust.eds.dao.FilelimitDao;
import com.njust.eds.model.Filelimit;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author tomato
 * @create 2017-09-08 下午2:49
 */
@Repository
public class FilelimitDaoImpl extends BaseDaoImpl implements FilelimitDao {

    //保存文件的权限信息
    public void saveFilelimit(Filelimit filelimit) {
        getSession().save(filelimit);
    }

    //ID查找文件的权限信息
    public Filelimit findFilelimitById(Integer id) {
        String hql = "from Filelimit where fileId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, id);
        Filelimit filelimit = (Filelimit) query.uniqueResult();
        return filelimit;
    }

    //其他查找
    @SuppressWarnings("unchecked")
    public List<Filelimit> findUser(List<Object> params, String hql) {
        Query query = getSession().createQuery(hql);
        if (params != null && params.size() > 0) {
            for (int i = 0; i < params.size(); i++) {
                query.setParameter(i, params.get(i));
            }
        }
        return query.list();
    }

    //修改文件权限信息
    public void updateFilelimit(Filelimit filelimit) {
        getSession().update(filelimit);
    }

    public List<Filelimit> getAll(){
        String hql = "from Filelimit ";
        Query query = getSession().createQuery(hql);
        return query.list();
    }

    public void delete(Filelimit filelimit){
        getSession().delete(filelimit);
    }
}
