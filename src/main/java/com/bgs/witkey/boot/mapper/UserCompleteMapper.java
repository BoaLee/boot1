package com.bgs.witkey.boot.mapper;

import com.bgs.witkey.boot.pojo.UserComplete;

public interface UserCompleteMapper {

    /**
     * 根据id查公司信息
     * @param id
     * @return
     */
    UserComplete selUserCompleteInfoById(Integer id);

    int uplUserCompleteInfo(UserComplete userComplete);

    int insUserCompleteInfo(UserComplete userComplete);

    int updUserCompleteLicenseInfo(UserComplete uc);

    int updUserCompleteLogoInfo(UserComplete uc);
}
