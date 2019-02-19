package com.bgs.witkey.boot.utils;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import redis.clients.jedis.HostAndPort;
import redis.clients.jedis.JedisCluster;

import java.util.HashSet;
import java.util.Set;

@Configuration     //相当于配置了一个xml文件(例如:applicationContext.xml)
public class   RedisClusterConfig {

    @Value("192.168.189.140:6380,192.168.189.140:6381,192.168.189.140:6382,192.168.189.140:6383,192.168.189.140:6384,192.168.189.140:6385")
    private String clusterNodes;

    @Bean
    public JedisCluster getJedisClustrer(){

        //创建set集合,作为创建jedisCluster对象的参数
        Set<HostAndPort> nodes = new HashSet<>();

        //字符串切割
        String[] hostAndPost = clusterNodes.split(",");
        //192.168.108.10:6380

        for (String i:hostAndPost) {

            String[] hp = i.split(":");

            //trim()去除前后空格,  注意parseInt()和 valueOf()的区别
            nodes.add(new HostAndPort(hp[0].trim(),Integer.parseInt(hp[1].trim())));
        }

        //创建Redis集群对象
        JedisCluster jedisCluster = new JedisCluster(nodes);

        return jedisCluster;
    }

}
