package com.njust.eds.service;

import com.njust.eds.model.Message;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface MessageService {

    public void addMessage(Message message);

    public Message queryMessage(Message message);

    public Message findMessageById(Integer id);

    public List<Message> findMessage(Map<String, Object> map);

    public void updateMessage(Message message);

    public Message findMessageByTime(Date time);

    public Message findMessageBySenderId(Integer id);

    public Message findMessageBySenderName(String senderName);

    public Message findMessageByRecevierId(Integer id);

    public Message findMessageByRecevierName(String recevierName);

    public Message findMessageByisRead(int Read);
}
