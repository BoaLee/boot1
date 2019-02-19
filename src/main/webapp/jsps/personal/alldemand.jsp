<%--
  Created by IntelliJ IDEA.
  User: liulx
  Date: 2018/9/10
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/bootstrap-table.min.css">
<style>
    #demandTabs li{background-color: #f0f0f0;}
</style>
<!-- 当前位置 开始 -->
<div class="programme_position breadcrumb">
    <div class="container">
        <span>当前位置：</span>
        <a href="#">用户中心></a>
        <a href="#">我的需求></a>
    </div>
</div>
<!-- 当前位置 结束 -->
<div class="row">
    <%@include file="personalLeftTree.jsp"%>
    <div class="col-md-9 col-sm-7">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist" id="demandTabs">
                <li role="presentation" class="active"><a href="#all" aria-controls="all" role="tab" data-toggle="tab">全部需求</a></li>
                <li role="presentation"><a href="#rough" aria-controls="rough" role="tab" data-toggle="tab">草稿箱</a></li>
                <li role="presentation"><a href="#publish" aria-controls="publish" role="tab" data-toggle="tab">已发布的需求</a></li>
                <li role="presentation"><a href="#complete" aria-controls="complete" role="tab" data-toggle="tab">已完成的需求</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="all">
                    <table id="table_all"></table>
                </div>
                <div role="tabpanel" class="tab-pane" id="rough">
                    <table id="table_rough"></table>
                </div>
                <div role="tabpanel" class="tab-pane" id="publish">
                    <table id="table_publish"></table>
                </div>
                <div role="tabpanel" class="tab-pane" id="complete">
                    <table id="table_complete"></table>
                </div>
            </div>
    </div>
</div>
<%@include file="../common/footer.jsp"%>
<script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/alldemand.js"></script>
</body>
    </html>
