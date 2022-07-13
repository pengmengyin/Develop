package com.peng.entity;

public class Search {
    private int id;
    private String name;
    private String pingyin;
    private String summary;
    private String img;
    private String introduce;
    private String component;
    private String structure;

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

    public String getPingyin() {
        return pingyin;
    }

    public void setPingyin(String pingyin) {
        this.pingyin = pingyin;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getComponent() {
        return component;
    }

    public void setComponent(String component) {
        this.component = component;
    }

    public String getStructure() {
        return structure;
    }

    public void setStructure(String structure) {
        this.structure = structure;
    }

    @Override
    public String toString() {
        return "Seach{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pingyin='" + pingyin + '\'' +
                ", summary='" + summary + '\'' +
                ", img='" + img + '\'' +
                ", introduce='" + introduce + '\'' +
                ", component='" + component + '\'' +
                ", structure='" + structure + '\'' +
                '}';
    }
}
