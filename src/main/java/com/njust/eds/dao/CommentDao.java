package com.njust.eds.dao;

import com.njust.eds.model.Comment;

import java.util.Date;
import java.util.List;

public interface CommentDao {

    public void saveComment(Comment comment);

    public Comment queryComment(Comment comment);

    public Comment findCommentById(Integer id);

    public List<Comment> findComment(List<Object> params, String hql);

    public void updateComment(Comment comment);

    public Comment findCommentByTime(Date time);

    public Comment findCommentBySenderId(Integer id);

    public Comment findCommentBySenderName(String senderName);

    public Comment findCommentByRecevierId(Integer id);

    public Comment findCommentByRecevierName(String recevierName);

    public Comment findCommentByisRead(int Read);
}
