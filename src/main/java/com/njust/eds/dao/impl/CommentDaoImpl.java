package com.njust.eds.dao.impl;

import com.njust.eds.dao.CommentDao;
import com.njust.eds.dao.FileDao;
import com.njust.eds.dao.UserDao;
import com.njust.eds.model.Comment;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public class CommentDaoImpl extends BaseDaoImpl implements CommentDao {

    private UserDao userDao;
    private FileDao fileDao;

    //保存评论
    public void saveComment(Comment comment) {
        getSession().save(comment);
    }

    //通过发送者和接收的文件查找评论
    @SuppressWarnings("unchecked")
    public Comment queryComment(Comment comment) {
        String hql = "from Comment where comSender=? and comRecevier=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, comment.getComSender());
        query.setParameter(1, comment.getComRecevier());
        Comment currentComment = null;
        List<Comment> CommentList = query.list();
        if (CommentList != null && CommentList.size() > 0) {
            currentComment = CommentList.get(0);
        }
        return currentComment;
    }

    //通过评论ID查找
    public Comment findCommentById(Integer id) {
        String hql = "from Comment where comId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, id);
        Comment comment = (Comment) query.uniqueResult();
        return comment;
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
    public Comment findCommentBySenderId(Integer id) {
        String hql = "from Comment  where comSender=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, id);
        return (Comment) query.uniqueResult();
    }

    //通过评论发送者用户名查找
    public Comment findCommentBySenderName(String senderName) {
        String hql = "from Comment  where comSender=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, userDao.findUserByUserName(senderName).getUserId());
        return (Comment) query.uniqueResult();
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
//    public Comment findCommentByRecevierName(String recevierName) {
//        String hql = "from Comment  where comRecevier=?";
//        Query query = getSession().createQuery(hql);
//        query.setParameter(0, fileDao.findFileByFileName(recevierName).getFileId());
//        return (Comment) query.uniqueResult();
//    }

    //按评论是否可读查找
    public Comment findCommentByisRead(int Read) {
        String hql = "from Comment  where isRead=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, Read);
        return (Comment) query.uniqueResult();
    }
}
