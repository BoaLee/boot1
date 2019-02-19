package com.bgs.witkey.boot.service.impl;

import com.bgs.witkey.boot.mapper.DemandMapper;
import com.bgs.witkey.boot.mapper.OrderMapper;
import com.bgs.witkey.boot.pojo.DemandApplyVo;
import com.bgs.witkey.boot.pojo.WitkeyOrder;
import com.bgs.witkey.boot.pojo.WitkeyOrderVo;
import com.bgs.witkey.boot.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private DemandMapper demandMapper;

    @Override
    public int addOrders(Integer userId, Integer demandId, Integer id) {

        DemandApplyVo demandApplyVo = demandMapper.selDemandApplyByDidAndUid(userId,demandId);

        WitkeyOrder order = new WitkeyOrder();

        order.setOid(UUID.randomUUID().toString());

        order.setTitle(demandApplyVo.getProjectTitle());

        order.setMoney(demandApplyVo.getDemandMoney());

        order.setDid(demandId);

        order.setUid(userId);

        order.setFid(id);

        int count = orderMapper.addOrders(order);

        return count;
    }

    @Override
    public List<WitkeyOrderVo> findAllOrders(Integer id) {
        return orderMapper.findAllOrders(id);
    }

    @Override
    public List<WitkeyOrderVo> findOrders(Integer stu, Integer id) {

        return orderMapper.findOrders(stu,id);
    }

    @Override
    public int updateWitkeyOrderByOid(String r6_order) {

        return orderMapper.updateWitkeyOrderByOid(r6_order);
    }


}
