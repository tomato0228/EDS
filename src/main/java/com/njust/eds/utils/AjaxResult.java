package com.njust.eds.utils;

import java.io.Serializable;

/**
 * @author tomato
 * @create 2017-09-14 下午1:39
 * Ajax返回
 */
public class AjaxResult implements Serializable {
    private boolean status;
    private String message;
    private Object data;

    public AjaxResult() {
        this(true, null, null);
    }

    public AjaxResult(boolean status) {
        this(status, null, null);
    }

    public AjaxResult(boolean status, String message) {
        this(status, message, null);
    }

    public AjaxResult(boolean status, String message, Object data) {
        this.status = status;
        this.message = message;
        this.data = data;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
