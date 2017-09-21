package com.njust.eds.service;

import com.njust.eds.model.Message;

import java.util.List;
import java.util.Map;

public interface MessageService {

    public void addMessage(Message message);

    public List<Message> queryMessage(Integer senderId, Integer recevierId);

    public Message findMessageById(Integer id);

    public List<Message> findMessage(Map<String, Object> map);

    public void updateMessage(Message message);

    public Message findMessageBySenderId(Integer id);

    public Message findMessageBySenderName(String senderName);

    public Message findMessageByRecevierId(Integer id);

    public Message findMessageByRecevierName(String recevierName);

    public Message findMessageByisRead(int Read);

    public List<Message> findMessagesByRecevierId(Integer id);
    public List<Message> Messagelist( int id1,int id2);

    public void msg_edit(int id ,int isread);
}
