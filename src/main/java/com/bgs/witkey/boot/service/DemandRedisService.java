package com.bgs.witkey.boot.service;

public interface DemandRedisService {

    //根据需求id，每浏览一次需求，浏览次数加1
    Double addPageView(Integer demangId);

    //根据需求id，查看浏览次数
    Double showPageView(Integer demandId);

}
