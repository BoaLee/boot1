package com.bgs.witkey.boot.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class WitkeyOrder {
    private String oid;

    private String title;

    private Double money;

    private Integer stutas;

    private Integer did;

    private Integer fid;

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    private Integer uid;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createtime;

    public WitkeyOrder(String oid, String title, Double money, Integer stutas, Integer did, Integer fid, Integer uid, Date createtime) {
        this.oid = oid;
        this.title = title;
        this.money = money;
        this.stutas = stutas;
        this.did = did;
        this.fid = fid;
        this.uid = uid;
        this.createtime = createtime;
    }

    public WitkeyOrder() {
        super();
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid == null ? null : oid.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Integer getStutas() {
        return stutas;
    }

    public void setStutas(Integer stutas) {
        this.stutas = stutas;
    }

    public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}