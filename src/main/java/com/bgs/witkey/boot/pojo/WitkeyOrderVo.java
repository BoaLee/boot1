package com.bgs.witkey.boot.pojo;

import java.util.Date;

public class WitkeyOrderVo extends WitkeyOrder {
    //使用witkey_user_complete表中的corporate_name 字段
    private String corporateName;


    public String getCorporateName() {
        return corporateName;
    }

    public void setCorporateName(String corporateName) {
        this.corporateName = corporateName;
    }

}
