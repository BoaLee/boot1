package com.bgs.witkey.boot.controller;

import com.bgs.witkey.boot.pojo.User;
import com.bgs.witkey.boot.pojo.UserComplete;
import com.bgs.witkey.boot.service.UserCompleteService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@RequestMapping("imgs")
@Controller
public class ImgController {

    @Autowired
    private UserCompleteService userCompleteService;

    @RequestMapping("uploadBusinessLicense")
    @ResponseBody
    public Map<String,Object> uploadBusinessLicense
            (UserComplete uc,HttpSession session, MultipartFile file1, HttpServletRequest req) throws IOException {

        Map<String, Object> map = new HashMap<>();

        /*UserComplete uc = new UserComplete();*/
        //获取资源路径
        ServletContext sc = req.getServletContext();

        String path = sc.getRealPath("/uploads/license");

        //获取原图片名
        String oldName = file1.getOriginalFilename();

        //图片后缀名
        String suffix = oldName.substring(oldName.lastIndexOf("."));

        //判断文件类型
        if (!(".jpg".equals(suffix) || ".png".equals(suffix))) {

            map.put("flag", false);
            map.put("message", "请上传正确格式的图片");

            return map;
        }

        //获取新的文件名
        String newName = UUID.randomUUID()+""+System.currentTimeMillis()+suffix;

        File f = new File(path, newName);

        //从session中取出user对象
        User u = (User) session.getAttribute("user");

        uc.setId(u.getId());

        uc.setCreatName(u.getUsername());

        uc.setBusinessLicense(newName);

        //进行更改
        int count = userCompleteService.updUserCompleteLicenseInfo(uc);

        if (count > 0) {//更改成功

            //上传文件
            file1.transferTo(f);
            map.put("flag", true);
            map.put("fileName", newName);

            return map;

        }else {//更改失败

            map.put("flag", false);
            map.put("message", "上传失败");
            return map;
        }

    }

    @ResponseBody
    @RequestMapping("uploadLogo")
    public Map<String,Object> uploadLogo
            (HttpSession session,HttpServletRequest req,UserComplete uc, MultipartFile file2) throws IOException {

        //获取资源路径
        ServletContext sc = req.getServletContext();

        String path = sc.getRealPath("/uploads/logo");

        //获取图片名
        String oldName = file2.getOriginalFilename();

        //获取文件后缀
        String suffix = oldName.substring(oldName.lastIndexOf("."));

        //创建新的文件名
        String newName = UUID.randomUUID()+""+System.currentTimeMillis()+suffix;

        Map<String, Object> map = new HashMap<>();

        if (!(".jpg".equals(suffix)||".png".equals(suffix))){

            map.put("flag", false);

            map.put("message","图片类型不匹配");

            return map;

        }

        File f = new File(path,newName);

        User u = (User) session.getAttribute("user");

        uc.setId(u.getId());
        uc.setUpdateName(u.getUsername());
        uc.setLogo(newName);

        int count = userCompleteService.updUserCompleteLogoInfo(uc);

        if (count > 0) {//修改成功

            //将文件存到硬盘中
            file2.transferTo(f);

            map.put("flag",true);
            map.put("flieName",newName);
            return map;
        }else {//失败

            map.put("flag", false);
            map.put("message", "上传失败");
            return map;
        }

    }

}
