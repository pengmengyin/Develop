package com.peng.entity;

public class Mistake {
    private int id;
    private String name;
    private String url;
    private int uid;

    public int getUid() {
        return uid;
    }

    @Override
    public String toString() {
        return "Mistake{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", uid=" + uid +
                '}';
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

}
