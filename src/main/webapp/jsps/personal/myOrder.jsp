<%--
  Created by IntelliJ IDEA.
  User: zk
  Date: 2018/11/26
  Time: 10:49
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
        <a href="#">承接需求></a>
    </div>
</div>
<!-- 当前位置 结束 -->
<div class="row">
    <%@include file="personalLeftTree.jsp"%>
    <div class="col-md-9 col-sm-7">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist" id="demandTabs">
            <li role="presentation" class="active"><a href="#allOrder" aria-controls="all" role="tab" data-toggle="tab">全部</a></li>
            <li role="presentation"><a href="#unfinished" aria-controls="rough" role="tab" data-toggle="tab">未完成订单</a></li>
            <li role="presentation"><a href="#finished" aria-controls="publish" role="tab" data-toggle="tab">已完成订单</a></li>

        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="allOrder">
                <table id="table_allOrder"></table>
            </div>
            <div role="tabpanel" class="tab-pane" id="unfinished">
                <table id="table_unfinished"></table>
            </div>
            <div role="tabpanel" class="tab-pane" id="finished">
                <table id="table_finished"></table>
            </div>
        </div>
    </div>
</div>
<%@include file="../common/footer.jsp"%>
<script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/myOrder.js"></script>
</body>
</html>
