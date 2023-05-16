package com.peng.entity;

import org.springframework.stereotype.Component;

@Component("registerStatus")
public class RegisterStatus {
    private User user;
    private String  msg;
    private Integer code;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

}
