package com.njust.eds.service;

import com.njust.eds.model.Comment;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface CommentService {

    public void addComment(Comment comment);

    public Comment queryComment(Comment comment);

    public Comment findCommentById(Integer id);

    public List<Comment> findComment(Map<String, Object> map);

    public void updateComment(Comment comment);

    public Comment findCommentByTime(Date time);

    public Comment findCommentBySenderId(Integer id);

    public Comment findCommentBySenderName(String senderName);

    public Comment findCommentByRecevierId(Integer id);

    public Comment findCommentByRecevierName(String recevierName);

    public Comment findCommentByisRead(int Read);
}
