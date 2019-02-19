package com.bgs.witkey.boot.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Md5Util {

    public static void  main (String [] args){
        System.out.println(md5Util("123456"));

    }

    public static String md5Util(String str){

        byte [] bytes = null;

        try {
            /**
             * MessageDigest 一个包含算法的类
             * getInstance 指定你所使用的算法
             * digest 给指定的byte数组进行加密
             */
            bytes = MessageDigest.getInstance("md5").digest(str.getBytes());
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("没有MD5算法");
        }

        String md5 = new BigInteger(1,bytes).toString(16);

        for (int i = 0; i < 32 - md5.length(); i++)
            md5 = "0" + md5;

        return md5;
    }
}
