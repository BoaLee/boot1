package com.bgs.witkey.boot.service.impl;

import com.bgs.witkey.boot.mapper.DemandMapper;
import com.bgs.witkey.boot.pojo.*;
import com.bgs.witkey.boot.service.DemandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DemandServiceImpl implements DemandService {

    @Autowired
    private DemandMapper demandMapper;

    @Override
    public int insDemandInfo(Demand demand) {

        return demandMapper.insDemandInfo(demand);
    }

    @Override
    public List<Demand> findAllCurrentDemand(Integer id) {

        return demandMapper.findAllCurrentDemand(id);
    }

    @Override
    public List<Demand> findCurrentDemandByDemandStatus(Integer id, Integer begin, Integer end) {

        return demandMapper.findCurrentDemandByDemandStatus(id,begin,end);
    }


    @Override
    public List<Demand> findCurrentDemandByDemandStatuscaogao(@Param("id") Integer id, @Param("status") Integer status) {

        return demandMapper.findCurrentDemandByDemandStatuscaogao(id,status);
    }

    @Override
    public List<DemandHallVo> listAllaplyingDemand() {

        return demandMapper.listAllaplyingDemand();
    }

    @Override
    public Demand selDemandMissionWorld(Integer demandId) {

        return demandMapper.selDemandMissionWorld(demandId);
    }

    @Override
    public int showDemandApplyNum(Integer demandId) {

        return demandMapper.showDemandApplyNum(demandId);
    }

    @Override
    public DemandHallVo toDemandApplyMail(Integer id) {

        return demandMapper.toDemandApplyMail(id);
    }

    @Override
    public List<DemandApplyVo> findAllApliedDemand(Integer id) {

        return demandMapper.findAllApliedDemand(id);
    }

    @Override
    public List<DemandApplyVo> findAppliedDemand(Integer id, Integer sta) {

        return demandMapper.findAppliedDemand(id,sta);
    }

    @Override
    public int deleteSchemByCountent(String content) {

        return demandMapper.deleteSchemByCountent(content);
    }

    @Override
    public int upLoadDemandScheme(Integer demandId, Integer id, String newName) {

        return demandMapper.upLoadDemandScheme(demandId,id,newName);
    }

    @Override
    public List<String> findDemandSchemeInfoByDemandIdAndUserId(Integer demandId, Integer id) {

        return demandMapper.findDemandSchemeInfoByDemandIdAndUserId(demandId,id);
    }

    @Override
    public DemandHallVo findDemandHallVoByDemandId(Integer demandId) {

        return demandMapper.findDemandHallVoByDemandId(demandId);
    }

    @Override
    public int insDemandApplyInfo(DemandApply demandApply) {

        return demandMapper.insDemandApplyInfo(demandApply);
    }

    @Override
    public List<UserCompleteDemandApplyVo> selApplyAndCompleteInfoByDemandId(Integer demandId) {
        return demandMapper.selApplyAndCompleteInfoByDemandId(demandId);
    }

    @Override
    public int doHireUserComplete(Integer userId, Integer demandId) {
        return demandMapper.doHireUserComplete(userId,demandId);
    }

    @Override
    public int updateDemand(Demand demand) {

        return demandMapper.updateDemand(demand);
    }

    @Override
    public Demand selCurrentDemandById(Integer did) {

        return demandMapper.selCurrentDemandById(did);
    }

}
