<%--
  Created by IntelliJ IDEA.
  User: liulx
  Date: 2018/9/10
  Time: 14:27
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
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <form action="#" method="post" role="form" class="form-horizontal" id="loginForm">
                <div class="form-group">
                    <label class="control-label col-md-3">用户名：</label>
                    <div class="col-md-6">
                        <input type="text" name="username" class="form-control">
                    </div>
                    <div class="col-md-3">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">密码:</label>
                    <div class="col-md-6">
                        <input type="password" name="password" class="form-control">
                    </div>
                    <div class="col-md-3">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <input type="submit" value="提交" class="btn btn-default">
                    <button class="btn btn-default">提交</button>
                    <a href="#" class="btn btn-default">提交</a>
                </div>
            </form>

        </div>
    </div>

</div>



<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/static/common/jquery-3.2.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script>
    $(function(){
        $("#loginForm").submit(function(){
            var username=$("#loginForm input[name='username']").val();
            if(username=="admin"){
                isOk($("#loginForm input[name='username']"),"用户名正确！");
            }else{
                ieError($("#loginForm input[name='username']"),"用户名错误！");
            }
            var password=$("#loginForm input[name='password']").val();
            if(password=="111"){
                isOk($("#loginForm input[name='password']"),"密码正确！");
            }else{
                ieError($("#loginForm input[name='password']"),"密码错误！");
            }
            return false;
        });
    });
    function isOk(obj,text){
        obj.parent().parent().removeClass("has-error");
        obj.parent().parent().addClass("has-success");
        obj.parent().next("div").children("span").html(text);
    }
    function ieError(obj,text){
        obj.parent().parent().removeClass("has-success");
        obj.parent().parent().addClass("has-error");
        obj.parent().next("div").children("span").html(text);
    }
</script>
</body>
</html>
