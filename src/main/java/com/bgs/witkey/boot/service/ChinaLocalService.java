package com.bgs.witkey.boot.service;

import com.bgs.witkey.boot.pojo.ChinaLocal;

import java.util.List;

public interface ChinaLocalService {
    /**
     * 查询所有省信息
     * @return
     */
    List<ChinaLocal> findAllProvince();

    /**
     * 根据id查询市信息
     * @param pid
     * @return
     */
    List<ChinaLocal> selCityByPid(String pid);

    /**
     * 根据id 查询县信息
     * @param pid
     * @return
     */
    List<ChinaLocal> selAreaByPid(String pid);

    /**
     * 查询二级任务类型信息
     * @param id
     * @return
     */
    List<ChinaLocal> findProjectTypeByPtype(Integer id);

    /**
     * 查询所有项目周期信息
     * @return
     */
    List<ChinaLocal> selAllProjectPeriodInfo();

    /**
     * 查询所有项目预算信息
     * @return
     */
    List<ChinaLocal> selAllProjectBudgetInfo();

    /**
     * 查询一级任务类型信息
     * @return
     */
    List<ChinaLocal> selAllMissionTypeInfo();

    /**
     * 根据typeCode查询对应的项目类型信息
     * @param typeC
     * @return
     */
    ChinaLocal selProjectSecondeTypeByTypeCode(String typeC);
}
