<%--
  Created by IntelliJ IDEA.
  User: liulx
  Date: 2018/9/10
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <!--
        table:最基础的类，分割线
        table-striped:斑马线
        table-bordered：边框
        table-hover：鼠标悬浮状态
        table-condensed:缩小行高
    -->
    <div class="row">
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th>序号</th>
                <th>用户名</th>
                <th>密码</th>
                <th>电话</th>
                <th>qq</th>
                <th>创建人</th>
                <th>创建时间</th>
                <th>修改人</th>
                <th>修改时间</th>
                <th>备注</th>
            </tr>
            </thead>
            <tbody id="allUsers">

            </tbody>
        </table>
    </div>
</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/static/common/jquery-3.2.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script>
    $(function(){
        $.ajax({
            url: "/user/findAllUser",//请求的action路径
            type:"post",
            dataType:"json",
            error: function () {//请求失败处理函数
                alert('请求失败');
            },
            success:function(data){
                insertTableBody(data);
            }
        });
    });
    function insertTableBody(data){
        console.log(data);
        var str="";
        if(null!=data && data.length>0){
            for(var i=0;i<data.length;i++){
                str+="<tr>";
                str+="<td>"+data[i].id+"</td>";
                str+="<td>"+data[i].username+"</td>";
                str+="<td>"+data[i].password+"</td>";
                str+="<td>"+data[i].iphone+"</td>";
                str+="<td>"+data[i].qq+"</td>";
                str+="<td>"+data[i].createName+"</td>";
                str+="<td>"+data[i].createDate+"</td>";
                str+="<td>"+data[i].updateName+"</td>";
                str+="<td>"+data[i].updateDate+"</td>";
                str+="<td>"+data[i].remarks+"</td>";
                str+="</tr>";
            }
        }
        $("#allUsers").html(str);
    }
</script>
</body>
</html>
