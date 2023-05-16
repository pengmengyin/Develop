package com.peng.entity;

import org.springframework.stereotype.Component;

@Component ("Sms")
public class Sms {
    private Double code;
    private String success;
    public Double getCode() {
        return code;
    }

    public void setCode(Double code) {
        this.code = code;
    }

    public String getSuccess() {
        return success;
    }

    public void setSuccess(String success) {
        this.success = success;
    }
}