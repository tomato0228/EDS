package com.njust.eds.dao;

import com.njust.eds.model.Message;

import java.util.List;

public interface MessageDao {

    public void saveMessage(Message message);

    public List<Message> queryMessage(Integer senderId, Integer recevierId);

    public Message findMessageById(Integer id);

    public List<Message> findMessage(List<Object> params, String hql);

    public void updateMessage(Message message);

    public Message findMessageBySenderId(Integer id);

    public Message findMessageBySenderName(String senderName);

    public Message findMessageByRecevierId(Integer id);

    public List<Message> findMessagesByRecevierId(Integer id);

    public Message findMessageByRecevierName(String recevierName);

    public Message findMessageByisRead(int Read);

    public void msg_edit(int id ,int isread);

    public List<Message> findMessagesById(int id);



}
