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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/witkey.css"></link>

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!-- 头部开始 -->
<div class="head">
    <div class="container">
        <div class="head-left col-md-6">
            您好，老板
        </div>
        <div class="head-right col-md-6">
            <i class="iconfont icon-xiaoxi"></i>
            <span>4</span>
        </div>
    </div>
</div>
<!-- 头部结束 -->
<!-- 导航开始 -->
<nav class="nav">
    <div class="container">
        <div class="row">
            <div class="nav-left col-md-2">
                <img src="${pageContext.request.contextPath}/static/images/logo.png" alt="" style="height: 62px;">
            </div>
            <div class="nav-center col-md-7">
                <ul class="list-unstyled list-inline">
                    <li><a href="#" class="active">首页</a></li>
                    <li><a href="#">需求大厅</a></li>
                    <li><a href="#">帮助中心</a></li>
                    <li><a href="#">用户中心</a></li>
                </ul>
            </div>
            <div class="nav-right col-md-3">
                <div class="col-md-10">
                    <input class="form-control" type="text" placeholder="输入关键字找人/服务" style="margin-top: 13px">
                </div>
                <div class="col-md-2">
                   <a href="#">发布需求</a>
                </div>
            </div>
        </div>
    </div>
</nav>
<!-- 导航结束 -->
<!-- 当前位置 开始 -->
<%--<div class="programme_position breadcrumb">
    <div class="container">
        <span>当前位置：</span>
        <a href="index.html">首页></a>
        <a href="#">我的需求></a>
        <a href="#">已报名需求></a>
        <a href="#">报名的服务商</a>
    </div>
</div>--%>
<!-- 当前位置 结束 -->
<div class="row" id="login">
    <div class="container" >
        <!-- 主题内容  开始 -->
        <div class="loginWrap">
            <div class="col-md-6 login_left">
                <h3>威客信息平台</h3>
                <p>信息管理平台</p>
                <p>专业、专心、负责、认真</p>
            </div>
            <div class="col-md-5 login_right">
                <div>

                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist" id="mynavtabs">
                        <li role="presentation" class="active"><a href="#logintabs" aria-controls="logintabs" role="tab" data-toggle="tab">登陆</a></li>
                        <li role="presentation"><a href="#register" aria-controls="profile" role="tab" data-toggle="tab">注册</a></li>
                     </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="logintabs">
                            <br>
                            <form action="${pageContext.request.contextPath}/user/login" method="post" role="form" class="form-horizontal" id="loginForm">
                                <div class="form-group">
                                    <label class="control-label col-md-3">用户名：</label>
                                    <div class="col-md-8">
                                        <input type="text" name="username" class="form-control">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3">密码:</label>
                                    <div class="col-md-8">
                                        <input type="password" name="password" class="form-control">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-5 col-md-offset-4">
                                        <input type="submit" class="btn btn-primary" value="&nbsp;&nbsp;登陆&nbsp;&nbsp;"></input>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="register">
                            <br>
                            <form action="#" method="post" class="form-horizontal" id="registerForm">
                                <div class="form-group">
                                    <label class="control-label col-md-3">用户名：</label>
                                    <div class="col-md-8">
                                        <input type="text" name="username" class="form-control">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3">电话：</label>
                                    <div class="col-md-8">
                                        <input type="text" name="iphone" class="form-control">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3">QQ：</label>
                                    <div class="col-md-8">
                                        <input type="text" name="qq" class="form-control">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3">密码:</label>
                                    <div class="col-md-6">
                                        <input type="password" name="password" class="form-control">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3">确认密码:</label>
                                    <div class="col-md-6">
                                        <input type="password" name="repassword" class="form-control">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-5 col-md-offset-4">
                                        <input type="button" class="btn btn-primary" onclick="doregister()" value="&nbsp;&nbsp;注册&nbsp;&nbsp;"></input>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
            <!--  loginForm end-->
            <div class="col-md-1"></div>
        </div>
    </div>

    <!-- 底部开始 -->
    <div class="footer prog_foot">
        <div class="footerCenter">
            <p class="bqsy">版权所有</p>
            <div class="list">
                <ul class="list-unstyled">
                    <li>大威平台</li>
                    <li>首页</li>
                    <li>关于我们</li>
                    <li>公司简介</li>
                </ul>
                <ul class="list-unstyled">
                    <li>联系我们</li>
                    <li>顾问邮箱：123456@qq.com</li>
                    <li>联系电话：123456@qq.com</li>
                </ul>
                <ul class="list-unstyled">
                    <li>新手指南</li>
                    <li>入驻服务商</li>
                    <li>免费发布需求</li>
                </ul>
                <ul class="list-unstyled">
                    <li>帮助中心</li>
                    <li>需求大厅</li>
                    <li>完成需求</li>
                    <li>进行需求</li>
                </ul>
                <ul class="list-unstyled">
                    <li>支持</li>
                    <li>安全中心</li>
                    <li>合同协议</li>
                    <li>平台安全条款</li>
                </ul>
                <ul class="weinxinqq list-unstyled">
                    <p><img src="${pageContext.request.contextPath}/static/images/weixin.png" alt="">微信</p><br>
                    <p><img src="${pageContext.request.contextPath}/static/images/qq.png" alt="">QQ</p>
                </ul>
                <ul class="qr list-unstyled">
                    <li><img src="${pageContext.request.contextPath}/static/images/qr.png" alt="" style="width: 73px;height: 73px"></li>
                    <li>平台公众号</li>
                </ul>
            </div>
            <div class="footer-copy">
                2016年logo 京ICP备14023790号-2 京公安网备1101080201180号
            </div>
        </div>
    </div>
    <!-- 底部结束 -->
</div>



<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/static/common/jquery-3.2.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/static/common/witkey.js"></script>
<script src="${pageContext.request.contextPath}/static/js/loginBefor.js"></script>
</body>
</html>
