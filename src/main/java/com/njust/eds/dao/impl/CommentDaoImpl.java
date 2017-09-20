package com.njust.eds.dao.impl;

import com.njust.eds.dao.CommentDao;
import com.njust.eds.dao.FileDao;
import com.njust.eds.dao.UserDao;
import com.njust.eds.model.Comment;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public class CommentDaoImpl extends BaseDaoImpl implements CommentDao {

    @Autowired
    private UserDao userDao;

    @Autowired
    private FileDao fileDao;

    //保存评论
    public void saveComment(Comment comment) {
        getSession().save(comment);
    }

    //通过发送者和接收的文件查找评论
    @SuppressWarnings("unchecked")
    public List<Comment> queryComment(Comment comment) {
        String hql = "from Comment where comSender=? and comRecevier=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, comment.getComSender());
        query.setParameter(1, comment.getComRecevier());
        return query.list();
    }

    //通过评论ID查找
    @SuppressWarnings("unchecked")
    public Comment findCommentById(Integer id) {
        String hql = "from Comment where comId=? order by comTime desc";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, id);
        return (Comment) query.uniqueResult();
    }

    //普通查找
    @SuppressWarnings("unchecked")
    public List<Comment> findComment(List<Object> params, String hql) {
        Query query = getSession().createQuery(hql);
        if (params != null && params.size() > 0) {
            for (int i = 0; i < params.size(); i++) {
                query.setParameter(i, params.get(i));
            }
        }
        return query.list();
    }

    //修改评论
    public void updateComment(Comment comment) {
        getSession().update(comment);
    }

    //通过评论时间查找
    public Comment findCommentByTime(Date time) {
        String hql = "from Comment  where comData=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, time);
        return (Comment) query.uniqueResult();
    }

    //通过评论发送者ID查找
    @SuppressWarnings("unchecked")
    public List<Comment> findCommentBySenderId(Integer id) {
        String hql = "from Comment  where comSender=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, id);
        return query.list();
    }

    //通过评论发送者用户名查找
    @SuppressWarnings("unchecked")
    public List<Comment> findCommentBySenderName(String senderName) {
        String hql = "from Comment  where comSender=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, userDao.findUserByUserName(senderName).getUserId());
        return query.list();
    }

    //通过评论文件ID查找评论
    @SuppressWarnings("unchecked")
    public List<Comment> findCommentByRecevierId(Integer id) {
        String hql = "from Comment  where comRecevier=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, id);
        return query.list();
    }

    //通过评论文件名字查找评论
    @SuppressWarnings("unchecked")
    public List<Comment> findCommentByRecevierName(String recevierName) {
        String hql = "from Comment  where comRecevier=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, fileDao.findFileByFileName(recevierName).getFileId());
        return query.list();
    }

    //按评论是否可读查找
    @SuppressWarnings("unchecked")
    public List<Comment> findCommentByisRead(int Read) {
        String hql = "from Comment  where isRead=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, Read);
        return query.list();
    }
}
