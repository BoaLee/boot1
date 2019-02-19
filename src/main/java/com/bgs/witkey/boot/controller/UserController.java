package com.bgs.witkey.boot.controller;

import com.bgs.witkey.boot.pojo.User;
import com.bgs.witkey.boot.service.UserService;
import com.bgs.witkey.boot.utils.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@RequestMapping("user")
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 登录
     * @param user
     * @return
     */
    @RequestMapping("login")
    public String login(User user, HttpSession session){

        //给密码进行加密
        String p = Md5Util.md5Util(user.getPassword());

        user.setPassword(p);

        User u = userService.selUserInfoByNameAndPwd(user);

        if (u != null) {

            //把密码设为空
            u.setPassword("");

            session.setAttribute("user",u);
            return "index";
        }else {

            return "errorPage";
        }
    }

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    @RequestMapping("updateUserAccount")
    @ResponseBody
    public boolean updateUserAccount(User user){

        int i = userService.updUserInfo(user);

        if (i > 0) {
            return true;
        } else {
            return false;
        }

    }

    /**
     * 退出登录
     * @param session
     * @return
     */
    @RequestMapping("logout")
    public String logout(HttpSession session){

        session.removeAttribute("user");

        return "loginBefore/loginBefor";
    }

    /**
     * 用户注册
     * @param user
     * @return
     */
    @RequestMapping("register")
    @ResponseBody
    public boolean register(User user){

        //将密码进行加密,然后在储存
        String p = user.getPassword();

        user.setPassword(Md5Util.md5Util(p));

        int count = userService.insUserInfo(user);

        if (count > 0) {

            return true;
        } else {

            return false;
        }

    }

}
