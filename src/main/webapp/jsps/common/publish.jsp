<%--
  Created by IntelliJ IDEA.
  User: zk
  Date: 2018/11/22
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container">
    <div class="row clearfix release">
        <div class="col-md-6 column">
            <div class="left">
                <img src="${pageContext.request.contextPath}/static/images/4_09.png">
            </div>
        </div>
        <div class="col-md-6 column">
            <div class="right">
                <form action="/publishMassage" method="post">
                    <p class="p1">快速发布需求</p>
                    <p class="p2">专业服务找上门</p>
                    <p class="p3">159****2346发布了网站开发需求</p>
                    <input type="text" name="INeed" placeholder="我需要">
                    <input type="text" name="phone" placeholder="手机号">
                    <input class="input3" type="text" placeholder="验证码"><a class="yzm" href="#">验证码</a>
                    <button class="ljfb" type="submit">立即发布</button>
                </form>
            </div>
        </div>
    </div>
</div>
