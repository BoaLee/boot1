package com.bgs.witkey.boot.pojo;

public class DemandApply {
    private Integer demandId;
    private Integer userId;
    private Double demandMoney;//单位为：万元
    private Double demandPeriod;//单位为：月
    private String applyContent;
    private Integer applyStatus;

    public Double getDemandMoney() {
        return demandMoney;
    }

    public void setDemandMoney(Double demandMoney) {
        this.demandMoney = demandMoney;
    }

    public Double getDemandPeriod() {
        return demandPeriod;
    }

    public void setDemandPeriod(Double demandPeriod) {
        this.demandPeriod = demandPeriod;
    }

    public Integer getDemandId() {
        return demandId;
    }

    public void setDemandId(Integer demandId) {
        this.demandId = demandId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getApplyContent() {
        return applyContent;
    }

    public void setApplyContent(String applyContent) {
        this.applyContent = applyContent;
    }

    public Integer getApplyStatus() {
        return applyStatus;
    }

    public void setApplyStatus(Integer applyStatus) {
        this.applyStatus = applyStatus;
    }
}
