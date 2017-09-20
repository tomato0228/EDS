package com.njust.eds.dao;

import com.njust.eds.model.Comment;

import java.util.Date;
import java.util.List;

public interface CommentDao {

    public void saveComment(Comment comment);

    public List<Comment> queryComment(Comment comment);

    public Comment findCommentById(Integer id);

    public List<Comment> findComment(List<Object> params, String hql);

    public void updateComment(Comment comment);

    public Comment findCommentByTime(Date time);

    public List<Comment> findCommentBySenderId(Integer id);

    public List<Comment> findCommentBySenderName(String senderName);

    public List<Comment> findCommentByRecevierId(Integer id);

    public List<Comment> findCommentByRecevierName(String recevierName);

    public List<Comment> findCommentByisRead(int Read);
}
