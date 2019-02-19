<%--
  Created by IntelliJ IDEA.
  User: liulx
  Date: 2018/9/10
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/witkey.css"></link>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/datepicker/css/bootstrap-datetimepicker.min.css" />
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_368076_we3l46nomcp7gb9.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/index.css">
    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/static/common/jquery-3.2.1.min.js"></script>

</head>
<body>
<!-- 头部开始 -->
<div class="head">
    <div class="container">
        <div class="head-left col-md-6">
            <c:if test="${empty sessionScope.user.username}">
                <a href="/jsps/loginBefore/loginBefor.jsp">请登录</a>
            </c:if>
            <c:if test="${not empty user.username}">
                <div class="dropdown">
                    <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        您好，<span class="glyphicon glyphicon-user"></span>
                            ${sessionScope.user.username}
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <li><a href="#" data-toggle="modal" data-target="#showAccount"><span class="glyphicon glyphicon-picture"></span>&nbsp;&nbsp;查看账户信息</a></li>
                        <li><a href="#" data-toggle="modal" data-target="#editAccount"><span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;修改账户信息</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/user/logout"><span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;退出</a></li>
                    </ul>
                </div>
            </c:if>

        </div>
        <div class="head-right col-md-6">
            <i id="newMassage" type="button" class="iconfont icon-xiaoxi" title="未读消息"
                    data-container="body" data-toggle="popover" data-placement="bottom"
                    data-content="底部的 Popover 中的一些内容">
            </i>
            <span id="noRead"></span>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function (){
        $("[data-toggle='popover']").popover();
    });
</script>
<!-- 头部结束 -->
<!-- 导航开始 -->
<nav class="nav">
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-2 column">
                <img src="${pageContext.request.contextPath}/static/images/logo.png" alt="" style="height: 62px;">
            </div>
            <div class="nav-center col-md-7 column">
                <ul class="list-unstyled list-inline" id="navtitle">
                    <li><a href="/jsps/loginBefore/loginBefor.jsp">首页</a></li>
                    <li id="demand"><a href="/demand/listAllaplyingDemand">需求大厅</a></li>
                    <li><a href="#">帮助中心</a></li>
                    <li id="personal"><a href="/jsps/personal/personalCenter.jsp">用户中心</a></li>
                </ul>
            </div>
            <div class="col-md-3 column">
                <div class="row clearfix">
                    <div class="col-md-10 column">
                        <input class="form-control" type="text" placeholder="输入关键字找人/服务" style="margin-top: 13px">
                    </div>
                    <div class="col-md-2 column">
                        <a href="#" onclick="doSendDemand()">发布需求</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>
<!-- 导航结束 -->
