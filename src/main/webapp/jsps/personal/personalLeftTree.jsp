<%--
  Created by IntelliJ IDEA.
  User: liulx
  Date: 2018/9/25
  Time: 9:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-md-3 col-sm-5" id="beforeLeftNav">
    <div class="left_top">
        大威平台
    </div>
    <ul class="list-unstyled" id="personalLeft">
        <li><a href="/corporation/findCorporationInfo">个人资料</a></li>
        <li><a href="#">特色技能</a></li>
        <li><a href="#">作品案例</a></li>
        <li ><a href="javascript:void(o)" onclick="tochangePersonal()">安全中心</a></li>
        <li><a href="/jsps/personal/alldemand.jsp">发布需求</a></li>
        <li><a href="/jsps/personal/myApply.jsp">承接需求</a></li>
        <li><a href="/jsps/personal/myOrder.jsp">我的订单</a></li>
        <li><a href="#">消息</a></li>
    </ul>
</div>
<script>
    $(function(){
        $("#navtitle #personal").addClass("active");
    });
</script>