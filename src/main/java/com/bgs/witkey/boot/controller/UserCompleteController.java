package com.bgs.witkey.boot.controller;

import com.bgs.witkey.boot.pojo.User;
import com.bgs.witkey.boot.pojo.UserComplete;
import com.bgs.witkey.boot.service.UserCompleteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

@Controller
@RequestMapping("corporation")
public class UserCompleteController {

    @Autowired
    private UserCompleteService userCompleteService;

    /**
     * 查询用户对应的公司信息
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("findCorporationInfo")
    public String findCorporationInfo(HttpSession session, Model model){

        User user = (User) session.getAttribute("user");

        UserComplete uc = userCompleteService.selUserComleteInfoById(user.getId());

        model.addAttribute("userc",uc);

        return "personal/personal";
    }

    @RequestMapping("changepersonal/{id}")
    public String changepersonal(@PathVariable("id") Integer id, Model model){

        UserComplete uc = userCompleteService.selUserComleteInfoById(id);

        model.addAttribute("userc", uc);

        return "personal/changepersonal";
    }

    @RequestMapping("alterOperation")
    public String alterOperation(MultipartFile file1, MultipartFile file2,
                                 Model model , UserComplete userComplete, HttpServletRequest req, HttpSession session) throws IOException {
        //获取资源存储路径
        ServletContext sc = req.getServletContext();
        //getRealPath项目根目录下的 +"     " 路径
        String path1 = sc.getRealPath("/uploads/license");
        String path2 = sc.getRealPath("/uploads/logo");

        //创建新的文件存储名
        //文件真实名字
        String oldName1 = file1.getOriginalFilename();//营业执照
        String oldName2 = file2.getOriginalFilename();//logo

        //文件名后缀
        String suffix1 = oldName1.substring(oldName1.lastIndexOf("."));
        String suffix2 = oldName2.substring(oldName2.lastIndexOf("."));

        //判断文件类型
        if(!(".jpg".equals(suffix1)||".png".equals(suffix1))){

            return "errorPage";
        }
        if(!(".jpg".equals(suffix2)||".png".equals(suffix2))){

            return "errorPage";
        }


        //创建新的随机名进行储存
        String newName1 = UUID.randomUUID()+""+System.currentTimeMillis()+suffix1;
        String newName2 = UUID.randomUUID()+""+System.currentTimeMillis()+suffix2;

        //创建资源存储的file对象
        File f1 = new File(path1,newName1);
        File f2 = new File(path2,newName2);
        //将文件存储到硬盘中
        file1.transferTo(f1);
        file2.transferTo(f2);

        //获取用户id,通过id查询公司信息是否注册
        User user = (User)session.getAttribute("user");
        UserComplete uc = userCompleteService.selUserComleteInfoById(user.getId());

        //将图片名存储到对象中
        userComplete.setBusinessLicense(newName1);
        userComplete.setLogo(newName2);

        if (uc != null) {//代表其公司信息已注册,进行更改操作

            userComplete.setUpdateName(user.getUsername());

            int count = userCompleteService.uplUserCompleteInfo(userComplete);



        }else {//代表其公司信息还未注册,进行新增操作

            userComplete.setId(user.getId());
            userComplete.setCreatName(user.getUsername());

            int count = userCompleteService.insUserCompleteInfo(userComplete);

        }

        model.addAttribute("userc",userComplete);

        return "personal/personal";
    }

    @RequestMapping("isAuditUser")
    @ResponseBody
    public Map<String,Object> isAuditUser(HttpSession session){

        Map<String,Object> map = new HashMap<>();

        User u = (User) session.getAttribute("user");

        //判断是否有用户登录
        if(u == null){

            map.put("flag",false);
            map.put("message","请登录后再发布需求");

            return map;
        }

        //判断是否提交公司信息
        UserComplete uc = userCompleteService.selUserComleteInfoById(u.getId());

        if(uc == null){

            map.put("公司信息未提交",false);
            map.put("message","请先提交公司信息");

            return map;

        }

        //判断公司信息是否审核
        if(!uc.getAuditStatus().equals(new Integer(1))){//未审核
            map.put("flag",false);
            map.put("message","公司信息未审核");

            return map;
        }

        map.put("flag",true);

        return map;

    }

}
