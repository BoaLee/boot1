package com.bgs.witkey.boot.service.impl;

import com.bgs.witkey.boot.mapper.UserMapper;
import com.bgs.witkey.boot.pojo.User;
import com.bgs.witkey.boot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User selUserInfoByNameAndPwd(User user) {

        return userMapper.selUserInfoByNameAndPwd(user);
    }

    @Override
    public int updUserInfo(User user) {

        return userMapper.updUserInfo(user);
    }

    @Override
    public int insUserInfo(User user) {

        return userMapper.insUserInfo(user);
    }
}
