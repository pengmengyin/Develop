package com.peng.entity;

public class News {
    private int id;
    private  String headimg;
    private  String top;
    private  String img;
    private  String buttom;
    private String title;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHeadimg() {
        return headimg;
    }

    public void setHeadimg(String headimg) {
        this.headimg = headimg;
    }

    public String getTop() {
        return top;
    }

    public String getTitle() {
        return title;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", headimg='" + headimg + '\'' +
                ", top='" + top + '\'' +
                ", img='" + img + '\'' +
                ", buttom='" + buttom + '\'' +
                ", title='" + title + '\'' +
                '}';
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setTop(String top) {
        this.top = top;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }



    public String getButtom() {
        return buttom;
    }

    public void setButtom(String buttom) {
        this.buttom = buttom;
    }
}
