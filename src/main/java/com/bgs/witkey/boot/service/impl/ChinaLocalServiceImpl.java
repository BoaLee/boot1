package com.bgs.witkey.boot.service.impl;

import com.bgs.witkey.boot.mapper.ChinaLocalMapper;
import com.bgs.witkey.boot.pojo.ChinaLocal;
import com.bgs.witkey.boot.service.ChinaLocalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ChinaLocalServiceImpl implements ChinaLocalService {

    @Autowired
    private ChinaLocalMapper chinaLocalMapper;

    @Override
    public List<ChinaLocal> findAllProvince() {
        return chinaLocalMapper.selAllProvinceInfo();
    }

    @Override
    public List<ChinaLocal> selCityByPid(String pid) {

        return chinaLocalMapper.selCityByPid(pid);
    }

    @Override
    public List<ChinaLocal> selAreaByPid(String pid) {

        return chinaLocalMapper.selAreaByPid(pid);
    }

    @Override
    public List<ChinaLocal> findProjectTypeByPtype(Integer id) {

        return chinaLocalMapper.findProjectTypeByPtype(id);
    }

    @Override
    public List<ChinaLocal> selAllProjectPeriodInfo() {

        return chinaLocalMapper.selAllProjectPeriodInfo();
    }

    @Override
    public List<ChinaLocal> selAllProjectBudgetInfo() {

        return chinaLocalMapper.selAllProjectBudgetInfo();
    }

    @Override
    public List<ChinaLocal> selAllMissionTypeInfo() {

        return chinaLocalMapper.selAllMissionTypeInfo();
    }

    @Override
    public ChinaLocal selProjectSecondeTypeByTypeCode(String typeC) {
        return chinaLocalMapper.selProjectSecondeTypeByTypeCode(typeC);
    }
}
