package com.bgs.witkey.boot.service;

import com.bgs.witkey.boot.pojo.User;

public interface UserService {

    /**
     * 根据账户密码查询用户信息(登录)
     *
     * @param user
     * @return
     */
    User selUserInfoByNameAndPwd(User user);

    /**
     * 修改用户信息
     *
     * @param user
     * @return
     */
    int updUserInfo(User user);

    /**
     * 添加用户信息
     *
     * @param user
     * @return
     */
    int insUserInfo(User user);
}
