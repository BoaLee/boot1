package com.bgs.witkey.boot.service;

import com.bgs.witkey.boot.pojo.*;

import java.util.List;

public interface DemandService {

    /**
     * 添加需求信息
     * @param demand
     * @return
     */
    int insDemandInfo(Demand demand);

    /**
     * 查询当前用户全部需求信息
     * @param id
     * @return
     */
    List<Demand> findAllCurrentDemand(Integer id);


    /**
     * 查询当前用户对应的非草稿和已完成的需求信息
     * @param id
     * @param begin
     * @param end
     * @return
     */
    List<Demand> findCurrentDemandByDemandStatus(Integer id, Integer begin, Integer end);


    /**
     * 查看当前用户为草稿的需求信息
     * @param id
     * @param status
     * @return
     */
    List<Demand> findCurrentDemandByDemandStatuscaogao(Integer id, Integer status);


    /**
     * 查询需求大厅
     * @return
     */
    List<DemandHallVo> listAllaplyingDemand();


    /**
     * 根据id查询需求信息，需求类型，需求状态
     * @param demandId
     * @return
     */
    Demand selDemandMissionWorld(Integer demandId);


    /**
     * 查询该需求的报名人数
     * @param demandId
     * @return
     */
    int showDemandApplyNum(Integer demandId);


    /**
     * 查询需求信息和公司信息的应用领域
     * @param id
     * @return
     */
    DemandHallVo toDemandApplyMail(Integer id);

    /**
     * 查询所有报名需求
     * @param id
     * @return
     */
    List<DemandApplyVo> findAllApliedDemand(Integer id);

    /**
     * 根据状态码查询用户的报名需求
     * @param id
     * @param sta
     * @return
     */
    List<DemandApplyVo> findAppliedDemand(Integer id, Integer sta);

    /**
     * 删除文档
     * @param content
     * @return
     */
    int deleteSchemByCountent(String content);

    /**
     * 上传文档
     * @param demandId
     * @param id
     * @param newName
     * @return
     */
    int upLoadDemandScheme(Integer demandId,Integer id,String newName);


    /**
     * 查询方案名回显
     * @param demandId
     * @param id
     * @return
     */
    List<String> findDemandSchemeInfoByDemandIdAndUserId(Integer demandId,Integer id);


    /**
     * 查询需求信息回显
     * @param demandId
     * @return
     */
    DemandHallVo findDemandHallVoByDemandId(Integer demandId);

    /**
     * 新增报名表
     * @param demandApply
     * @return
     */
    int insDemandApplyInfo(DemandApply demandApply);

    List<UserCompleteDemandApplyVo> selApplyAndCompleteInfoByDemandId(Integer demandId);

    int doHireUserComplete(Integer userId, Integer demandId);

    /**
     * 修改需求信息
     * @param demand
     * @return
     */
    int updateDemand(Demand demand);

    /**
     * 根据id查对应的需求
     * @param did
     * @return
     */
    Demand selCurrentDemandById(Integer did);
}
