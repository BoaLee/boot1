package com.bgs.witkey.boot.controller;


import com.bgs.witkey.boot.pojo.*;
import com.bgs.witkey.boot.service.ChinaLocalService;
import com.bgs.witkey.boot.service.DemandRedisService;
import com.bgs.witkey.boot.service.DemandService;
import com.bgs.witkey.boot.service.UserCompleteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import sun.jvm.hotspot.debugger.SymbolLookup;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("demand")
public class DemandController {

    @Autowired
    private ChinaLocalService chinaLocalService;

    @Autowired
    private DemandService demandService;

    @Autowired
    private UserCompleteService userCompleteService;

    @Autowired
    private DemandRedisService demandRedisService;

    /**
     * 初始化页面
     * @param model
     * @return
     */
    @RequestMapping("initPage")
    public String initPage(Model model){

        //查询所有项目周期信息
        List<ChinaLocal> period = chinaLocalService.selAllProjectPeriodInfo();
        //查询所有项目预算信息
        List<ChinaLocal> budget = chinaLocalService.selAllProjectBudgetInfo();
        //查询所有项目类型信息
        List<ChinaLocal> cType = chinaLocalService.selAllMissionTypeInfo();

        //查询所有省份信息
        List<ChinaLocal> province = chinaLocalService.findAllProvince();

        model.addAttribute("periods",period);
        model.addAttribute("budgets",budget);
        model.addAttribute("types",cType);
        model.addAttribute("provinces",province);

        return "personal/mydemand";

    }

    @RequestMapping("addDemand")
    @ResponseBody
    public Boolean addDemand(Demand demand, HttpSession session){

        //获得用户信息
        User user = (User) session.getAttribute("user");

        demand.setCreateName(user.getUsername());

        //获得公司信息
        UserComplete userc = userCompleteService.selUserComleteInfoById(user.getId());

        demand.setCreateCompanyName(userc.getCreatName());

        demand.setCreateId(userc.getId().toString());

        //添加需求
        int count = demandService.insDemandInfo(demand);

        if(count > 0){

            return true;

        }else {

            return false;

        }


    }

    /**
     * 查询当前用户全部需求信息
     * @param session
     * @return
     */
    @RequestMapping("findAllCurrentDemand")
    @ResponseBody
    public List<Demand> findAllCurrentDemand(HttpSession session){


        User user = (User) session.getAttribute("user");

        List<Demand> list = demandService.findAllCurrentDemand(user.getId());

        return list;

    }


    /**
     * 查询当前用户对应的非草稿和已完成的需求信息
     * @param session
     * @param begin
     * @param end
     * @return
     */
    @RequestMapping("findCurrentDemandByDemandStatus/demandRangeStatus/{begin}/{end}")
    @ResponseBody
    public List<Demand> findCurrentDemandByDemandStatus(HttpSession session, @PathVariable("begin") Integer begin,@PathVariable("end") Integer end){

        User user = (User) session.getAttribute("user");

        return demandService.findCurrentDemandByDemandStatus(user.getId(),begin,end);

    }


    /**
     * 查询当前用户对应的草稿需求信息
     * @param session
     * @param status
     * @return
     */
    @RequestMapping("/findCurrentDemandByDemandStatus/demandStatus/{status}")
    @ResponseBody
    public List<Demand> findCurrentDemandByDemandStatuscaogao(HttpSession session,@PathVariable("status") Integer status){

        User user = (User) session.getAttribute("user");

        return demandService.findCurrentDemandByDemandStatuscaogao(user.getId(),status);

    }

    /**
     * 需求大厅显示报名中的显示
     * @param model
     * @return
     */
    @RequestMapping("/listAllaplyingDemand")
    public String listAllaplyDemand(Model model){

        List<DemandHallVo> list = demandService.listAllaplyingDemand();

        model.addAttribute("list",list);

        return "demand/demandHall";

    }


    /**
     * 查看单个需求信息
     * @param demandId
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("demandHallDetail/{demandId}")
    public String demandHallDetail(@PathVariable("demandId")Integer demandId, Model model, HttpSession session){

        Double num = 0.0d;

        //根据demand查询DemandMissionWorld三表信息进行回显
        Demand demand = demandService.selDemandMissionWorld(demandId);
        System.out.println("1111111111");

        model.addAttribute("demand",demand);

        User user = (User) session.getAttribute("user");

        if (user!=null&&!user.getId().toString().equals(demand.getCreateId())){ //如果userID跟demandcreateID不相等，浏览量加1

            num = demandRedisService.addPageView(demandId);

        }else {//相当就返回浏览量
            if (demandRedisService.showPageView(demandId) != null   )
                num = demandRedisService.showPageView(demandId);
        }

        int i = num.intValue();

        if(i > 1){

            model.addAttribute("pageViewNum",i);

        }


        //查询对应需求的已申请人数
        int count = demandService.showDemandApplyNum(demandId);

        if(count > 0){

            model.addAttribute("applyNum",count);

        }else {

            model.addAttribute("applyNum",0);

        }

        return "/demand/demandDetailIfram";

    }

    @RequestMapping("toDemandApplyMail/{id}")
    public String toDemandApplyMail(@PathVariable("id")Integer id,Model model){

        DemandHallVo demand = demandService.toDemandApplyMail(id);

        model.addAttribute("demand",demand);

        return "demand/demandApplyMail";

    }


    /**
     * 查询所有报名需求
     * @param session
     * @return
     */
    @RequestMapping("findAllAppliedDemand")
    @ResponseBody
    public List<DemandApplyVo> findAllAppliedDemand(HttpSession session){

        User user = (User) session.getAttribute("user");

        return demandService.findAllApliedDemand(user.getId());
    }


    /**
     * 根据状态码查询用户报名的需求
     * @param sta
     * @param session
     * @return
     */
    @RequestMapping("findAppliedDemand/applyStatus/{sta}")
    @ResponseBody
    public List<DemandApplyVo> findAppliedDemand(@PathVariable("sta")Integer sta,HttpSession session){

        User user = (User) session.getAttribute("user");

        return demandService.findAppliedDemand(user.getId(),sta);

    }


    /**
     * 删除文档
     * @param content
     * @return
     */
    @RequestMapping("deleteSchemeByContent")
    @ResponseBody
    public Boolean deleteSchemeByContent(String content){

        int count = demandService.deleteSchemByCountent(content);

        if(count>1){

            return true;

        }else {

            return false;

        }
    }

    @RequestMapping("uploadDemandScheme")
    @ResponseBody
    public List<String> uploadDemandScheme(MultipartFile files,HttpSession session,Integer demandId) throws IOException {

        List<String> list = new ArrayList<>();

        User user = (User) session.getAttribute("user");

        if(user == null){

            return list;

        }

        if(files == null){

            return list;

        }

        //获取资源路径
        String path = session.getServletContext().getRealPath("uploads/scheme");

        //获取原文件名
        String oldName = files.getOriginalFilename();

        int index = oldName.lastIndexOf(".");

        //获取后缀名
        String suffix = oldName.substring(index);

        //判断文件类型
        if(!(".docx".equals(suffix)||".txt".equals(suffix))){

            return list;

        }
        //获取新文件名
        String newName = oldName.substring(0,index)+"_"+demandId+"_"+user.getId()+""+suffix;

        //创建文件对象
        File file = new File(path,newName);

        //新增文件表
        int count = demandService.upLoadDemandScheme(demandId,user.getId(),newName);

        //新增成功
        if(count > 0){

            list.add(newName);
            //上传文件
            files.transferTo(file);

        }

        return list;

    }

    @RequestMapping("findDemandSchemeInfoByDemandId/{demandId}")
    @ResponseBody
    public String findDemandHallVoByDemandId(@PathVariable("demandId")Integer demandId,HttpSession session,Model model){

        User user = (User) session.getAttribute("user");

        //查询方案名回显
        List<String> list = demandService.findDemandSchemeInfoByDemandIdAndUserId(demandId,user.getId());

        model.addAttribute("list",list);

        //查询需求信息回显
        DemandHallVo demand = demandService.findDemandHallVoByDemandId(demandId);

        model.addAttribute("demand",demand);

        return "personal/schemeUpload";

    }

    /**
     * 需求报名
     * @param demandApply
     * @param session
     * @return
     */
    @RequestMapping("/doDemandApply")
    @ResponseBody
    public Map<String,Object> doDemandApply(DemandApply demandApply, HttpSession session){

        Map<String, Object> map = new HashMap<>();

        map.put("flag", false);

        User user = (User) session.getAttribute("user");

        if (user == null) {

            map.put("message", "请先登录,再报名!");
        }

        demandApply.setUserId(user.getId());

        int count = 0;

        try {

            count = demandService.insDemandApplyInfo(demandApply);
        }catch (DuplicateKeyException exception){

            map.put("message", "不能重复报名!");
            return map;
        }

        if (count > 0) {

            map.put("flag", true);
            map.put("message", "报名成功");
        } else {

            map.put("message", "报名失败");
        }

        return map;
    }

    @RequestMapping("showAppliedUserCompleteByDemandId/{demandId}/{createId}")
    public String showAppliedUserCompleteByDemandId
            (@PathVariable("demandId")Integer demandId,@PathVariable("createId")Integer createId, Model model){

        List<UserCompleteDemandApplyVo> list = demandService.selApplyAndCompleteInfoByDemandId(demandId);


        model.addAttribute("createId", createId);
        model.addAttribute("list", list);

        return "demand/appliedUserComplete";
    }

    /**
     * 雇佣
     * @param userId
     * @param demandId
     * @return
     */
    @RequestMapping("doHireUserComplete")
    @ResponseBody
    public Map<String,Object> doHireUserComplete(Integer userId,Integer demandId){

        Map<String, Object> map = new HashMap<>();

        map.put("flag", false);

        int count = demandService.doHireUserComplete(userId,demandId);

        if (count > 0){

            map.put("flag", true);
        }else {

            map.put("message", "雇佣失败!");
        }
        return map;
    }

    /**
     * 修改需求信息
     * @param demand
     * @param session
     * @return
     */
    @RequestMapping("updateDemand")
    @ResponseBody
    public Boolean updateDemand(Demand demand, HttpSession session){

        User user = (User) session.getAttribute("user");

        //设置修改人
        demand.setUpdateName(user.getUsername());

        int count = demandService.updateDemand(demand);

        if (count > 0)
            return true;
        else
            return false;
    }

    /**
     * 修改需求的回显
     * @param did
     * @return
     */
    @RequestMapping("toupdateMyDemand/{did}")
    public String toupdateMyDemand(@PathVariable("did") Integer did, Model model){

        //查询对应的需求信息
        Demand demand = demandService.selCurrentDemandById(did);

        model.addAttribute("demand", demand);

        ChinaLocal typeCode = null;
        //查询二级类型信息
        if (demand != null){
            String typeC = demand.getProjectSecondeType();
            if (typeC != null && typeC != ""){

                typeCode = chinaLocalService.selProjectSecondeTypeByTypeCode(typeC);
            }

        }

        model.addAttribute("typeCode",typeCode);

        //查询所有项目周期信息
        List<ChinaLocal> period = chinaLocalService.selAllProjectPeriodInfo();
        //查询所有项目预算信息
        List<ChinaLocal> budget = chinaLocalService.selAllProjectBudgetInfo();
        //查询所有项目类型信息
        List<ChinaLocal> type = chinaLocalService.selAllMissionTypeInfo();
        //查询所有省份信息
        List<ChinaLocal> province = chinaLocalService.findAllProvince();

        model.addAttribute("periods",period);
        model.addAttribute("budgets",budget);
        model.addAttribute("types",type);
        model.addAttribute("provinces",province);

        return "personal/updatemydemand";
    }


}
