package com.njust.eds.service.Impl;

import com.njust.eds.dao.MessageDao;
import com.njust.eds.model.Message;
import com.njust.eds.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Service("Message")
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MessageDao messageDao;

    public void addMessage(Message message) {
        messageDao.saveMessage(message);
    }

    public List<Message> queryMessage(Integer senderId, Integer recevierId) {
        return messageDao.queryMessage(senderId,recevierId);
    }

    public Message findMessageById(Integer id) {
        return messageDao.findMessageById(id);
    }

    public List<Message> findMessage(Map<String, Object> map) {
        StringBuffer hql = new StringBuffer("from Message where 1=1 ");
        List<Object> params = new LinkedList<Object>();

        if (map.get("msgSender") != null) {
            hql.append(" and msgSender=? ");
            params.add(map.get("msgSender"));
        }
        if (map.get("msgReceiver") != null) {
            hql.append(" and msgReceiver=? ");
            params.add(map.get("msgReceiver"));
        }
        if (map.get("msgSendtime") != null) {
            hql.append(" and msgSendtime=? ");
            params.add(map.get("msgSendtime"));
        }

        System.out.println(hql.toString());
        return messageDao.findMessage(params, hql.toString());
    }

    public void updateMessage(Message message) {
        messageDao.updateMessage(message);
    }

    public Message findMessageBySenderId(Integer id) {
        return messageDao.findMessageBySenderId(id);
    }

    public Message findMessageBySenderName(String senderName) {
        return messageDao.findMessageBySenderName(senderName);
    }

    public Message findMessageByRecevierId(Integer id) {
        return messageDao.findMessageByRecevierId(id);
    }

    public Message findMessageByRecevierName(String recevierName) {
        return messageDao.findMessageByRecevierName(recevierName);
    }

    public Message findMessageByisRead(int Read) {
        return messageDao.findMessageByisRead(Read);
    }

    public List<Message> findMessagesByRecevierId(Integer id) {
        return messageDao.findMessagesByRecevierId(id);
    }

}
