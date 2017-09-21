package com.njust.eds.service;

import com.njust.eds.model.Comment;
import com.njust.eds.model.File;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface CommentService {

    public void addComment(Comment comment);

    public List<Comment> queryComment(Comment comment);

    public Comment findCommentById(Integer id);

    public List<Comment> findComment(Map<String, Object> map);

    public void updateComment(Comment comment);

    public Comment findCommentByTime(Date time);

    public List<Comment> findCommentBySenderId(Integer id);

    public List<Comment> findCommentBySenderName(String senderName);

    public List<Comment> findCommentByRecevierId(Integer id);

    public List<Comment> findCommentByRecevierName(String recevierName);

    public List<Comment> findCommentByisRead(int Read);

    public List<Comment> findCommentByfiles(List<File> files);
}
