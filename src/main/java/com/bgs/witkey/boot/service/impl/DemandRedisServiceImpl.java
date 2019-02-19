package com.bgs.witkey.boot.service.impl;

import com.bgs.witkey.boot.service.DemandRedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.JedisCluster;

@Service
public class DemandRedisServiceImpl implements DemandRedisService {

    @Autowired
    JedisCluster jedisCluster;

    @Override
    public Double addPageView(Integer demangId) {

        return jedisCluster.zincrby("aaa",1,demangId.toString());
    }

    @Override
    public Double showPageView(Integer demandId) {

        return jedisCluster.zscore("aaa",demandId.toString());
    }
}
