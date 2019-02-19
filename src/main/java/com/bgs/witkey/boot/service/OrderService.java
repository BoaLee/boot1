package com.bgs.witkey.boot.service;

import com.bgs.witkey.boot.pojo.WitkeyOrder;
import com.bgs.witkey.boot.pojo.WitkeyOrderVo;

import java.util.List;

public interface OrderService {

    int addOrders(Integer userId,Integer demandId, Integer id);

    List<WitkeyOrderVo> findAllOrders(Integer id);

    List<WitkeyOrderVo> findOrders(Integer stu, Integer id);

    int updateWitkeyOrderByOid(String r6_order);

}
