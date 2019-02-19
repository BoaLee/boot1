package com.bgs.witkey.boot.mapper;

import com.bgs.witkey.boot.pojo.WitkeyOrder;
import com.bgs.witkey.boot.pojo.WitkeyOrderVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {

    int addOrders(WitkeyOrder order);

    List<WitkeyOrderVo> findAllOrders(Integer id);

    List<WitkeyOrderVo> findOrders(@Param("stu") Integer stu, @Param("id") Integer id);

    int updateWitkeyOrderByOid(String oid);


}
