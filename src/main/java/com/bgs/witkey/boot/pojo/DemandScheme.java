package com.bgs.witkey.boot.pojo;

public class DemandScheme {
    private Integer id;
    private Integer userId;
    private Integer demandId;
    private String shemes;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getDemandId() {
        return demandId;
    }

    public void setDemandId(Integer demandId) {
        this.demandId = demandId;
    }

    public String getShemes() {
        return shemes;
    }

    public void setShemes(String shemes) {
        this.shemes = shemes;
    }
}
