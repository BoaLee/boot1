package com.bgs.witkey.boot.controller;

import com.bgs.witkey.boot.pojo.ChinaLocal;
import com.bgs.witkey.boot.service.ChinaLocalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("china")
public class ChinaLocalController {

    @Autowired
    private ChinaLocalService chinaLocalService;

    /**
     * 查询所有省信息
     * @return
     */
    @RequestMapping("findAllProvince")
    @ResponseBody
    public List<ChinaLocal> findAllProvince(){

        List<ChinaLocal> list = chinaLocalService.findAllProvince();

        return  list;
    }

    /**
     * 根据省id查其对应的市信息
     * @param pid
     * @return
     */
    @RequestMapping("findCityByPid/{pid}")
    @ResponseBody
    public List<ChinaLocal> findCityByPid(@PathVariable("pid")String pid){

        List<ChinaLocal> list = chinaLocalService.selCityByPid(pid);

        return list;
    }

    @RequestMapping("findAreaByPid/{pid}")
    @ResponseBody
    public List<ChinaLocal> findAreaByPid(@PathVariable("pid")String pid){

        List<ChinaLocal> list = chinaLocalService.selAreaByPid(pid);

        return list;
    }

    /**
     * 查询二级任务类型
     * @param pid
     * @return
     */
    @RequestMapping("findProjectTypeByPtype/{pid}")
    @ResponseBody
    public List<ChinaLocal> findProjectTypeByPtype(@PathVariable("pid")Integer pid){
        System.out.println(pid);
        return chinaLocalService.findProjectTypeByPtype(pid);

    }


}
