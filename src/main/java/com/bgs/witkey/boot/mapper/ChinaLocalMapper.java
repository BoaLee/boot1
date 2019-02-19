package com.bgs.witkey.boot.mapper;

import com.bgs.witkey.boot.pojo.ChinaLocal;

import java.util.List;

public interface ChinaLocalMapper {
    /**
     * 查询所有省信息
     * @return
     */
    List<ChinaLocal> selAllProvinceInfo();

    /**
     * 根据id查询其对应的市
     * @param pid
     * @return
     */
    List<ChinaLocal> selCityByPid(String pid);

    /**
     * 根据id查询其对应的县
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


    List<ChinaLocal> selAllProjectPeriodInfo();

    List<ChinaLocal> selAllProjectBudgetInfo();

    List<ChinaLocal> selAllMissionTypeInfo();

    ChinaLocal selProjectSecondeTypeByTypeCode(String typeC);

}
