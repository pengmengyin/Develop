package com.peng.entity;

import org.springframework.stereotype.Component;

@Component("searchCode")
public class SearchCode {
    private Integer code;
    private String  msg;
    private Object search;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getSearch() {
        return search;
    }

    public void setSearch(Object search) {
        this.search = search;
    }
}
