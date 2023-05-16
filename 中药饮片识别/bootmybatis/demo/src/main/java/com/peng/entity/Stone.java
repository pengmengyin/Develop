package com.peng.entity;

public class Stone {
    private int id;
    private String name;
    private String src;

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

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    @Override
    public String toString() {
        return "Stone{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", src='" + src + '\'' +
                '}';
    }
}
