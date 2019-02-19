package com.bgs.witkey.boot.service;

import com.bgs.witkey.boot.pojo.UserComplete;

public interface UserCompleteService {

    /**
     * 根据用户id查其公司信息
     * @param id
     * @return
     */
    UserComplete selUserComleteInfoById(Integer id);

    int uplUserCompleteInfo(UserComplete userComplete);

    int insUserCompleteInfo(UserComplete userComplete);

    int updUserCompleteLicenseInfo(UserComplete uc);

    int updUserCompleteLogoInfo(UserComplete uc);
}
