package com.peng.entity;

public class User {
    private Long id;
    private Long tel;
    private String username;
    private String pwd;
    private String imgUrl;
    private Long token;
    private String user_desc;
    private int gender;
    private Integer score;
    private int sub_id;

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", tel=" + tel +
                ", username='" + username + '\'' +
                ", pwd='" + pwd + '\'' +
                ", imgUrl='" + imgUrl + '\'' +
                ", token=" + token +
                ", user_desc='" + user_desc + '\'' +
                ", gender=" + gender +
                ", score=" + score +
                ", sub_id=" + sub_id +
                '}';
    }

    public int getSub_id() {
        return sub_id;
    }

    public void setSub_id(int sub_id) {
        this.sub_id = sub_id;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public Long getId() {
        return id;
    }

    public Long getTel() {
        return tel;
    }

    public void setTel(Long tel) {
        this.tel = tel;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public String getUser_desc() {
        return user_desc;
    }

    public void setUser_desc(String user_desc) {
        this.user_desc = user_desc;
    }

    public String getUsername() {

        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public Long getToken() {
        return token;
    }

    public void setToken(Long token) {
        this.token = token;
    }

}
