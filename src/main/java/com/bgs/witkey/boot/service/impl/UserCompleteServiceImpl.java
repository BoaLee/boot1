package com.bgs.witkey.boot.service.impl;

import com.bgs.witkey.boot.mapper.UserCompleteMapper;
import com.bgs.witkey.boot.pojo.UserComplete;
import com.bgs.witkey.boot.service.UserCompleteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserCompleteServiceImpl implements UserCompleteService {

    @Autowired
    private UserCompleteMapper userCompleteMapper;

    @Override
    public UserComplete selUserComleteInfoById(Integer id) {
        return userCompleteMapper.selUserCompleteInfoById(id);
    }

    @Override
    public int uplUserCompleteInfo(UserComplete userComplete) {
        return userCompleteMapper.uplUserCompleteInfo(userComplete);
    }

    @Override
    public int insUserCompleteInfo(UserComplete userComplete) {
        return userCompleteMapper.insUserCompleteInfo(userComplete);
    }

    @Override
    public int updUserCompleteLicenseInfo(UserComplete uc) {
        return userCompleteMapper.updUserCompleteLicenseInfo(uc);
    }

    @Override
    public int updUserCompleteLogoInfo(UserComplete uc) {
        return userCompleteMapper.updUserCompleteLogoInfo(uc);
    }
}
