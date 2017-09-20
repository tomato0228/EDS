package com.njust.eds.dao.impl;

import com.njust.eds.dao.MessageDao;
import com.njust.eds.dao.UserDao;
import com.njust.eds.model.Message;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MessageDaoImpl extends BaseDaoImpl implements MessageDao {

    @Autowired
    private UserDao userDao;

    public void saveMessage(Message message) {
        getSession().save(message);
    }

    @SuppressWarnings("unchecked")
    public List<Message> queryMessage(Integer senderId, Integer recevierId) {
        String hql = "from Message  where msgSender=? and msgReceiver=? order by msgSendtime desc";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, senderId);
        query.setParameter(1,recevierId);
        return query.list();
    }

    public Message findMessageById(Integer id) {
        String hql = "from Message where msgId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, id);
        Message message = (Message) query.uniqueResult();
        return message;
    }

    @SuppressWarnings("unchecked")
    public List<Message> findMessage(List<Object> params, String hql) {
        Query query = getSession().createQuery(hql);
        if (params != null && params.size() > 0) {
            for (int i = 0; i < params.size(); i++) {
                query.setParameter(i, params.get(i));
            }
        }
        return query.list();
    }

    public void updateMessage(Message message) {
        getSession().update(message);
    }

    public Message findMessageBySenderId(Integer id) {
        String hql = "from Message  where msgSender=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, id);
        return (Message) query.uniqueResult();
    }

    public Message findMessageBySenderName(String senderName) {
        String hql = "from Message  where msgSender=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, userDao.findUserByUserName(senderName).getUserId());
        return (Message) query.uniqueResult();
    }

    public Message findMessageByRecevierId(Integer id) {
        String hql = "from Message  where msgReceiver=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, id);
        return (Message) query.uniqueResult();
    }

    public Message findMessageByRecevierName(String recevierName) {
        String hql = "from Message  where msgReceiver=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, userDao.findUserByUserName(recevierName).getUserId());
        return (Message) query.uniqueResult();
    }

    public Message findMessageByisRead(int Read) {
        String hql = "from Message  where isRead=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, Read);
        return (Message) query.uniqueResult();
    }

    @SuppressWarnings("unchecked")
    public List<Message> findMessagesByRecevierId(Integer id){
        String hql = "from Message  where msgReceiver=?";
        Query query =getSession().createQuery(hql);
        query.setParameter(0,id);
        return query.list();
    }

}
