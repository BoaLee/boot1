package com.bgs.witkey.boot.controller;

import com.bgs.witkey.boot.pojo.User;
import com.bgs.witkey.boot.pojo.WitkeyOrderVo;
import com.bgs.witkey.boot.service.OrderService;
import com.bgs.witkey.boot.utils.PaymentUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("order")
@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    /**
     * 添加订单信息
     * @param
     * @param session
     * @return
     */
    @RequestMapping("addOrders")
    @ResponseBody
    public Boolean addOrders(Integer userId, Integer demandId, HttpSession session){

        User user = (User) session.getAttribute("user");

        int count = orderService.addOrders(userId,demandId,user.getId());

        if (count > 0)
            return true;
        else
            return false;
    }

    /**
     * 查询全部的订单信息
     * @return
     */
    @RequestMapping("findAllOrders")
    @ResponseBody
    public List<WitkeyOrderVo> findAllOrders(HttpSession session){

        User user = (User) session.getAttribute("user");

        return orderService.findAllOrders(user.getId());
    }

    /**
     * 跟踪状态码查询订单信息
     * @param stu
     * @param session
     * @return
     */
    @RequestMapping("findOrders/{stu}")
    @ResponseBody
    public List<WitkeyOrderVo> findOrders(@PathVariable("stu") Integer stu, HttpSession session){

        User user = (User) session.getAttribute("user");

        return orderService.findOrders(stu,user.getId());
    }

    /**
     * 支付
     * @param request
     * @return
     */
    @RequestMapping("payOrder")
    public String payOrder(HttpServletRequest request){

        String p0_Cmd = "Buy";// 业务类型，固定值为buy，即“买”
        String p1_MerId = "10001126856";// 在易宝注册的商号
        String p2_Order = request.getParameter("oid");// 订单编号
        String p3_Amt = "0.01";// 支付的金额
        String p4_Cur = "CNY";// 交易种币，固定值为CNY，表示人民币
        String p5_Pid = "";// 商品名称
        String p6_Pcat = "";// 商品各类
        String p7_Pdesc = "";// 商品描述
        String p8_Url = "http://192.168.33.49:8086/order/payBack";// 电商的返回页面，当支付成功后，易宝会重定向到这个页面
        String p9_SAF = "";// 送货地址
        String pa_MP = "";// 商品扩展信息
        String pd_FrpId = request.getParameter("pd_FrpId");// 支付通道，即选择银行
        String pr_NeedResponse = "1";// 应答机制，固定值为1

        // 密钥，由易宝提供，只有商户和易宝知道这个密钥。
        String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";

        //生成加密值
        String hmac = PaymentUtil.buildHmac
                (p0_Cmd,p1_MerId,p2_Order,p3_Amt,p4_Cur,
                        p5_Pid,p6_Pcat,p7_Pdesc,p8_Url,p9_SAF,pa_MP
                        ,pd_FrpId,pr_NeedResponse,keyValue);

        // 把所有参数连接到网关地址后面
        StringBuilder url = new StringBuilder("https://www.yeepay.com/app-merchant-proxy/node");

        url.append("?p0_Cmd="+p0_Cmd);
        url.append("&p1_MerId="+p1_MerId);
        url.append("&p2_Order="+p2_Order);
        url.append("&p3_Amt="+p3_Amt);
        url.append("&p4_Cur="+p4_Cur);
        url.append("&p5_Pid="+p5_Pid);
        url.append("&p6_Pcat="+p6_Pcat);
        url.append("&p7_Pdesc="+p7_Pdesc);
        url.append("&p8_Url="+p8_Url);
        url.append("&p9_SAF="+p9_SAF);
        url.append("&pa_MP="+pa_MP);
        url.append("&pd_FrpId="+pd_FrpId);
        url.append("&pr_NeedResponse="+pr_NeedResponse);
        url.append("&keyValue="+keyValue);
        url.append("&hmac="+hmac);

        return "redirect:"+url;
    }

    /**
     * 返回页面
     * @param request
     * @return
     */
    @RequestMapping("payBack")
    public String payBack(HttpServletRequest request){

        // 易宝会提供一系列的结果参数，我们获取其中需要的即可
        String hmac = request.getParameter("hmac");
        String p1_MerId = request.getParameter("p1_MerId");
        String r0_Cmd = request.getParameter("r0_Cmd");
        String r1_Code = request.getParameter("r1_Code");//获取支付结果：r1_Code，1表示支付成功
        String r2_TrxId = request.getParameter("r2_TrxId");
        String r3_Amt = request.getParameter("r3_Amt");//获取支付金额：r3_Amt
        String r4_Cur = request.getParameter("r4_Cur");
        String r5_Pid = request.getParameter("r5_Pid");
        String r6_Order = request.getParameter("r6_Order");//获取订单号：r6_Order
        String r7_Uid = request.getParameter("r7_Uid");
        String r8_MP = request.getParameter("r8_MP");
        String r9_BType = request.getParameter("r9_BType");

        // 密钥，由易宝提供，只有商户和易宝知道这个密钥。
        String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";

        //返回的hmac校验
        boolean flag = PaymentUtil.verifyCallback(hmac,  p1_MerId,
                r0_Cmd,  r1_Code,  r2_TrxId,  r3_Amt,
                r4_Cur,  r5_Pid,  r6_Order,  r7_Uid,
                r8_MP,  r9_BType,  keyValue);

        if(r1_Code.equals("1")){//代表支付成功

            if (flag){//url未经恶意改动,校验安全

                int count = orderService.updateWitkeyOrderByOid(r6_Order);

                if (count > 0){

                    request.setAttribute("msg","支付成功!");

                    return "msg";
                }else {

                    request.setAttribute("msg","支付出现异常,请立即联系客服!");

                    return "msg";
                }

            }else {

                request.setAttribute("msg","里四啦过?");

                return "msg";
            }

        }

        request.setAttribute("msg","支付失败");

        return "msg";
    }

}
