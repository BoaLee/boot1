<%--
  Created by IntelliJ IDEA.
  User: liulx
  Date: 2018/9/10
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/header.jsp"%>
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
                <h3>懂友平台</h3>
                <p>做最懂你的朋友</p>
                <p>让我们在热爱的领域找到最好的朋友</p>
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
</div>
<%@include file="../common/footer.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/loginBefor.js"></script>

    </body>
    </html>
