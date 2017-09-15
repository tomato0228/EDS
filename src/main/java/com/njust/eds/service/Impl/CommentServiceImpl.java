package com.njust.eds.service.Impl;

import com.njust.eds.dao.CommentDao;
import com.njust.eds.model.Comment;
import com.njust.eds.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Service("Comment")
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDao commentDao;

    public void addComment(Comment comment) {
        commentDao.saveComment(comment);
    }

    public Comment queryComment(Comment comment) {
        return commentDao.queryComment(comment);
    }

    public Comment findCommentById(Integer id) {
        return commentDao.findCommentById(id);
    }

    public List<Comment> findComment(Map<String, Object> map) {
        StringBuffer hql = new StringBuffer("from Comment where 1=1 ");
        List<Object> params = new LinkedList<Object>();

        if (map.get("comSender") != null) {
            hql.append(" and comSender=? ");
            params.add(map.get("comSender"));
        }
        if (map.get("comRecevier") != null) {
            hql.append(" and comRecevier=? ");
            params.add(map.get("comRecevier"));
        }
        if (map.get("comTime") != null) {
            hql.append(" and comTime=? ");
            params.add(map.get("comTime"));
        }

        System.out.println(hql.toString());
        return commentDao.findComment(params, hql.toString());
    }

    public void updateComment(Comment comment) {
        commentDao.updateComment(comment);
    }

    public Comment findCommentByTime(Date time) {
        return commentDao.findCommentByTime(time);
    }

    public Comment findCommentBySenderId(Integer id) {
        return commentDao.findCommentBySenderId(id);
    }

    public Comment findCommentBySenderName(String senderName) {
        return commentDao.findCommentBySenderName(senderName);
    }

    public Comment findCommentByRecevierId(Integer id) {
        return commentDao.findCommentByRecevierId(id);
    }

    public Comment findCommentByRecevierName(String recevierName) {
        return commentDao.findCommentByRecevierName(recevierName);
    }

    public Comment findCommentByisRead(int Read) {
        return commentDao.findCommentByisRead(Read);
    }
}
