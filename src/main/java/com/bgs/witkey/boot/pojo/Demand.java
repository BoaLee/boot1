package com.bgs.witkey.boot.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Demand {
    private Integer id;
    private String createId;
    private String createCompanyName;
    private String projectTitle;
    private String projectAbstract;
    private String projectPeriodId;
    private String projectPeriod;
    private String projectBudgetId;
    private String projectBudget;
    private String projectType;
    private String projectTypeName;
    private String projectSecondeType;
    private String projectSecondeTypeName;
    private Date publishDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date abortDate;
    private String provinceName;
    private String provinceCode;
    private String cityName;
    private String cityCode;
    private String areaName;
    private String areaCode;
    private Integer demandState;
    private String demandStateName;
    private String createName;
    private Date createDate;
    private String updateName;
    private Date updateDate;
    private String remark;

    public String getDemandStateName() {
        return demandStateName;
    }

    public void setDemandStateName(String demandStateName) {
        this.demandStateName = demandStateName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCreateId() {
        return createId;
    }

    public void setCreateId(String createId) {
        this.createId = createId;
    }

    public String getCreateCompanyName() {
        return createCompanyName;
    }

    public void setCreateCompanyName(String createCompanyName) {
        this.createCompanyName = createCompanyName;
    }

    public String getProjectTitle() {
        return projectTitle;
    }

    public void setProjectTitle(String projectTitle) {
        this.projectTitle = projectTitle;
    }

    public String getProjectAbstract() {
        return projectAbstract;
    }

    public void setProjectAbstract(String projectAbstract) {
        this.projectAbstract = projectAbstract;
    }

    public String getProjectPeriodId() {
        return projectPeriodId;
    }

    public void setProjectPeriodId(String projectPeriodId) {
        this.projectPeriodId = projectPeriodId;
    }

    public String getProjectPeriod() {
        return projectPeriod;
    }

    public void setProjectPeriod(String projectPeriod) {
        this.projectPeriod = projectPeriod;
    }

    public String getProjectBudgetId() {
        return projectBudgetId;
    }

    public void setProjectBudgetId(String projectBudgetId) {
        this.projectBudgetId = projectBudgetId;
    }

    public String getProjectBudget() {
        return projectBudget;
    }

    public void setProjectBudget(String projectBudget) {
        this.projectBudget = projectBudget;
    }

    public String getProjectType() {
        return projectType;
    }

    public void setProjectType(String projectType) {
        this.projectType = projectType;
    }

    public String getProjectSecondeType() {
        return projectSecondeType;
    }

    public void setProjectSecondeType(String projectSecondeType) {
        this.projectSecondeType = projectSecondeType;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public Date getAbortDate() {
        return abortDate;
    }

    public void setAbortDate(Date abortDate) {
        this.abortDate = abortDate;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public String getProvinceCode() {
        return provinceCode;
    }

    public void setProvinceCode(String provinceCode) {
        this.provinceCode = provinceCode;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    public Integer getDemandState() {
        return demandState;
    }

    public void setDemandState(Integer demandState) {
        this.demandState = demandState;
    }

    public String getCreateName() {
        return createName;
    }

    public void setCreateName(String createName) {
        this.createName = createName;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getUpdateName() {
        return updateName;
    }

    public void setUpdateName(String updateName) {
        this.updateName = updateName;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getProjectTypeName() {
        return projectTypeName;
    }

    public void setProjectTypeName(String projectTypeName) {
        this.projectTypeName = projectTypeName;
    }

    public String getProjectSecondeTypeName() {
        return projectSecondeTypeName;
    }

    public void setProjectSecondeTypeName(String projectSecondeTypeName) {
        this.projectSecondeTypeName = projectSecondeTypeName;
    }
}
