package com.bgs.witkey.boot.mapper;

import com.bgs.witkey.boot.pojo.User;

public interface UserMapper {

    //通过账户密码查询用户信息
    User selUserInfoByNameAndPwd(User user);

    //修改用户信息
    int updUserInfo(User user);

    //增加单条用户信息
    int insUserInfo(User user);
}
