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
    <style>
        .outer{
            border: 1px solid #0f0f0f;
            padding: 0;
            margin: 10px 0;
            height: 260px;
        }
        .imgdiv{
            height: 100%;
            padding: 20px;
        }
        .estimat{
            border-left: 1px solid #0f0f0f;
            background-color: #f2f2f2;
            height: 100%;
        }
        .contentdiv{
            height:100%;
            padding: 20px;
        }
        .contentdiv a {
            display: inline-block;
            text-align: center;
            color: #fff;
            border-radius: 25px;
            font-size: 14px;
        }
        .contentdiv .a1 {
            width: 100px;
            height: 30px;
            line-height: 30px;
            background: #a0a0a0;
            margin-right: 10px;
        }
        .ptitle{
            font-weight: bold;
            border-bottom: 2px solid #2aabd2;
            font-size: 14px;
            padding-bottom: 3px;
        }
        .contentp{
             height: 100px;
            overflow: hidden;
        }
        .receivep{
            margin-left: 10px;
            position: absolute;
            display: block;
            width: 85%;
            height: 45px;
            cursor: pointer;
            line-height: 45px;
            background: #5bc0de;
            text-align: center;
            margin-top: 8px;
            color: white;
            font-weight: bold;
        }
        .showSchemea{
            margin-left: 30px;
            cursor: pointer;
            background-color: #337ab7;
            height: 30px;
            line-height: 30px;
            padding: 0 20px;
        }
    </style>
</head>
<body>
    <c:forEach items="${list}" var="usercapply">
    <div class="col-xs-12 outer" >
        <div class="col-xs-5 col-md-2 imgdiv">
            <img src="/imgs/showLogo/${usercapply.logo}" id="logo">
        </div>
        <div class="col-xs-7 col-md-7 contentdiv">
            <p>${usercapply.corporateName}
                <!-- 如果这个需求时自己发布的，可以查看策划方案 -->
                <c:if test="${createId==sessionScope.user.id}">
                    <a class="showSchemea" href="/demand/showDemandScheme/userId/${usercapply.id}/demandId/${usercapply.demandId}">查看策划方案</a>
                </c:if>
            </p>
            <p><a class="a1" href="">${usercapply.provinceName}</a>
                <a class="a1" href="">${usercapply.cityName}</a>
                <a class="a1" href="">${usercapply.areaName}</a>
                <a class="a1" href="">${usercapply.scopeOperation}</a></p>
            <p><span class="ptitle">报名函</span></p>
            <p class="contentp"> ${usercapply.applyContent} </p>
        </div>
        <div class="col-xs-12 col-md-3 estimat">
            <button class="btn btn-primary receivep" <c:if test="${createId!=sessionScope.user.id}">disabled="disabled"</c:if> userId="${usercapply.id}" demandId="${usercapply.demandId}">
                <c:if test="${usercapply.applyStatus==1}">已报名</c:if>
                <c:if test="${usercapply.applyStatus==0}">雇佣此服务商</c:if>
                <c:if test="${usercapply.applyStatus==2}">已报名</c:if>
            </button>
            <img src="/static/images/xinred.png" style="height: 250px;">
        </div>
    </div>
    </c:forEach>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script>
    $(function(){
        $(".receivep").each(function(){
            $(this).click(function(){
                if($(this).html().indexOf("已报名")==-1){
                    doHire($(this).attr("userId"),$(this).attr("demandId"),$(this));
                    createOrder($(this).attr("userId"),$(this).attr("demandId"));
                }
            });
        });
    });
    function doHire(userId,demandId,obj){
        $.ajax({
            url:"/demand/doHireUserComplete", //你的路由地址
            type:"post",
            dataType:"json",
            data:{"userId":userId,"demandId":demandId},
            success:function(data){
                if(data.flag){
                    alert("雇佣成功！");
                    obj.html("已报名");
                    //window.top.location.href="/jsps/personal/myApply.jsp";
                }else{
                    alert(" "+data.message);
                }
            },
            error:function(e){
                alert(""+e);
            }
        });
    }
    function createOrder(userId,demandId) {
        $.ajax({
            url:"/order/addOrders", //你的路由地址
            type:"post",
            dataType:"json",
            data:{"userId":userId,"demandId":demandId},
            success:function(data){
                window.top.location.href="/jsps/personal/myApply.jsp";
                alert("订单添加成功");
            },
            error:function(e){
                alert(""+e);
            }
        });
    }
</script>
</body>
</html>
