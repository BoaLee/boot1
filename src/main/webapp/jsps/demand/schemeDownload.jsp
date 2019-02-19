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
    <style type="text/css">
        #showFiles{
            margin: 40px;
            border: 1px solid #0f0f0f;
            padding: 30px;
            height: 260px;
        }
        h3{
            font-size: 26px;
            text-align: center;
            font-weight: bolder;
            margin-top: 40px;
        }
        .schemespan{
            margin-left: 30px;
        }
        .btndiv{
            margin: 20px auto;
            width:300px;

        }
    </style>
</head>
<body>
<h3>策划方案</h3>
<div id="showFiles">

    <c:forEach items="${list}" var="scheme">
        <p class="schemep"><span>${scheme}</span> <button class=" btn btn-xs btn-primary schemespan" onclick="downloadScheme(this)">查看|下载方案</button></p>
    </c:forEach>
</div>
<div class="btndiv">
    <button type="button" class="btn btn-primary btn-lg" id="doApplyBtn">
        &nbsp;&nbsp;策划方案审核通过，下一步商量合同事宜&nbsp;&nbsp;
    </button>
</div>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script>
    function downloadScheme(obj){
        window.location.href="/demand/downloadSchem/"+$(obj).prev().html();
       /* $.ajax({
            type:"post",
            url:"/demand/downloadSchem",
            data:{"filename":$(obj).prev().html()}
        });*/
    }
</script>
</body>
</html>
