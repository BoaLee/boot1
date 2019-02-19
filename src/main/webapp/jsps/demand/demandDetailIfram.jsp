<%--
  Created by IntelliJ IDEA.
  User: liulx
  Date: 2018/11/1
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
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
    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/static/common/jquery-3.2.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/projectdetails.css" rel="stylesheet">

</head>
<body>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            查看需求
        </h3>
    </div>
    <div class="panel-body">
        <div class="platSafety">
            <div class="content_top">
                ${demand.projectTitle}
                <a class="a1" href="" id="demandStatus">${demand.demandStateName}</a>
                <a class="a2" href="">推荐的服务商（2）</a>
                <a class="a3" target="_self" href="/demand/showAppliedUserCompleteByDemandId/${demand.id}/${demand.createId}">报名的服务商（${applyNum}）</a>
                <c:if test="${demand.demandState>=2  and demand.createId ne sessionScope.user.id}">
                    <a class="a4" href="/demand/toDemandApplyMail/${demand.id}" target="_parent">我要投标</a>
                </c:if>

            </div>
            <div class="content_bottom">
                <p class="p1">项目类型：${demand.projectTypeName} / ${demand.projectSecondeTypeName}</p>
                <p class="p1">发布时间：
                    <fmt:formatDate value="${demand.publishDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </p>
                <p class="p2">
                    <a class="a1" href="">${demand.projectTypeName}</a>
                    <a class="a2" href="">${demand.projectSecondeTypeName}</a>
                </p>
                <p class="p3">
                    <span>${demand.projectTitle}</span>
                </p>
                ${demand.projectAbstract}
                <div class="yusuan">
                    <p>项目预算：${demand.projectBudget}</p>
                    <p>项目周期：${demand.projectPeriod}</p>
                    <div>
                        <p>已推荐</p>
                        <p><span class="sp1">0</span>人</p>
                    </div>
                    <div>
                        <p>已申请</p>
                        <p><span class="sp2">${applyNum}</span>人</p>
                    </div>
                    <div>
                        <p>已浏览</p>
                        <p><span class="sp3">${pageViewNum}</span>人</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

</body>
</html>
