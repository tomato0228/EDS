package com.njust.eds.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "eds_message", schema = "eds")
public class Message {

    private int msgId;
    private int msgSender;
    private int msgReceiver;
    private String msgData;
    private Date msgSendtime;
    private int isRead = 0;

    @Id
    @Column(name = "Msg_ID", nullable = false)
    public int getMsgId() {
        return msgId;
    }

    public void setMsgId(int msgId) {
        this.msgId = msgId;
    }

    @Basic
    @Column(name = "Msg_Sender", nullable = false)
    public int getMsgSender() {
        return msgSender;
    }

    public void setMsgSender(int msgSender) {
        this.msgSender = msgSender;
    }

    @Basic
    @Column(name = "Msg_Receiver", nullable = false)
    public int getMsgReceiver() {
        return msgReceiver;
    }

    public void setMsgReceiver(int msgReceiver) {
        this.msgReceiver = msgReceiver;
    }

    @Basic
    @Column(name = "Msg_Data", nullable = true, length = 1000)
    public String getMsgData() {
        return msgData;
    }

    public void setMsgData(String msgData) {
        this.msgData = msgData;
    }

    @Basic
    @Column(name = "Msg_Sendtime", nullable = false)
    public Date getMsgSendtime() {
        return msgSendtime;
    }

    public void setMsgSendtime(Date msgSendtime) {
        this.msgSendtime = msgSendtime;
    }

    @Basic
    @Column(name = "Msg_isRead", nullable = false)
    public int getIsRead() {
        return isRead;
    }

    public void setIsRead(int isRead) {
        this.isRead = isRead;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Message that = (Message) o;

        if (msgId != that.msgId) return false;
        if (msgSender != that.msgSender) return false;
        if (msgReceiver != that.msgReceiver) return false;
        if (isRead != that.isRead) return false;
        if (msgData != null ? !msgData.equals(that.msgData) : that.msgData != null) return false;
        if (msgSendtime != null ? !msgSendtime.equals(that.msgSendtime) : that.msgSendtime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = msgId;
        result = 31 * result + msgSender;
        result = 31 * result + msgReceiver;
        result = 31 * result + isRead;
        result = 31 * result + (msgData != null ? msgData.hashCode() : 0);
        result = 31 * result + (msgSendtime != null ? msgSendtime.hashCode() : 0);
        return result;
    }
}
