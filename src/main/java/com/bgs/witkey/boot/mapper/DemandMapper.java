package com.bgs.witkey.boot.mapper;

import com.bgs.witkey.boot.pojo.*;
import org.apache.ibatis.annotations.Param;


import java.util.List;

public interface DemandMapper {

    int insDemandInfo(Demand demand);

    List<Demand> findAllCurrentDemand(Integer id);

    List<Demand> findCurrentDemandByDemandStatus(@Param("id") Integer id, @Param("begin") Integer begin, @Param("end") Integer end);

    List<Demand> findCurrentDemandByDemandStatuscaogao(@Param("id") Integer id, @Param("status") Integer status);

    Demand selCurrentDemandById(Integer did);

    int updateDemand(Demand demand);

    List<DemandHallVo> listAllaplyingDemand();

    Demand selDemandMissionWorld(Integer demandId);

    int showDemandApplyNum(Integer demandId);

    DemandHallVo toDemandApplyMail(Integer id);

    int insDemandApplyInfo(DemandApply demandApply);

    List<UserCompleteDemandApplyVo> selApplyAndCompleteInfoByDemandId(Integer demandId);

    int doHireUserComplete(@Param("userId") Integer userId,@Param("demandId") Integer demandId);

    List<DemandApplyVo> findAllApliedDemand(Integer id);

    List<DemandApplyVo> findAppliedDemand(@Param("id") Integer id,@Param("sta") Integer sta);

    List<String> findDemandSchemeInfoByDemandIdAndUserId(@Param("demandId") Integer demandId, @Param("id") Integer id);

    DemandHallVo findDemandHallVoByDemandId(Integer demandId);

    int deleteSchemByCountent(String content);

    int upLoadDemandScheme(@Param("demandId") Integer demandId,@Param("id") Integer id,@Param("newName") String newName);

    DemandApplyVo selDemandApplyByDidAndUid(@Param("userId") Integer userId,@Param("demandId") Integer demandId);

}
