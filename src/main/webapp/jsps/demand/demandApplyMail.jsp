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
    .p1{
        font-size: 15px;
        font-weight: bolder;
    }
    .skeyblue{
        color: #2aabd2;
    }
    .fontSize{
        font-size: 43px;
    }
    .fleft{
        float:left;
        margin-right: 10px;
    }
    .btndiv{
        margin: 20px auto;
        width:300px;

    }
    textarea{
        border:0;
        background-color:transparent;
        /*scrollbar-arrow-color:yellow;
        scrollbar-base-color:lightsalmon;
        overflow: hidden;*/
        color: #666464;
        height: 260px;
        width: 100%;
    }
</style>
<!-- 当前位置 开始 -->
<div class="programme_position breadcrumb">
    <div class="container">
        <span>当前位置：</span>
        <a href="#">需求大厅></a>
        <a href="#">需求列表></a>
        <a href="#">需求详情></a>
        <a href="#">我要报名></a>
        <a href="#">报名函></a>
    </div>
</div>
<br>
<!-- 当前位置 结束 -->
<div class="container">
    <div class="row">
        <p class="p1">${demand.projectTitle}</p>
        <div class="col-xs-4">
            <p>发布时间：<span><fmt:formatDate value="${demand.publishDate}" pattern="yyyy-MM-dd"></fmt:formatDate> </span></p>
            <p>应用领域：<span>${demand.scopeOperation}</span></p>
            <p>项目周期：<span>${demand.projectPeriod}</span></p>
        </div>
        <div class="col-xs-4">
            <p>截止时间：<span><fmt:formatDate value="${demand.abortDate}" pattern="yyyy-MM-dd"></fmt:formatDate></span></p>
            <p>发布区域：<span>${demand.provinceName}&nbsp;${demand.cityName}&nbsp;${demand.areaName}</span></p>
        </div>
        <div class="col-xs-4">
            <span class="glyphicon glyphicon-equalizer skeyblue fontSize fleft"></span>
            <p class="f1">已报名：<span>3人</span></p>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                报名函
            </h3>
        </div>
        <div class="panel-body">
            <form action="/demand/doDemandApply" method="post" id="form1">
                <input type="hidden" name="demandId" value="${demand.id}">
                <p>项目费用：<input type="text" name="demandMoney" >单位：万元
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    项目周期：<input type="text" name="demandPeriod" > 单位：月</p>
                <textarea name="applyContent"></textarea>
            </form>
        </div>
    </div>
    <div class="btndiv">
    <button type="button" class="btn btn-primary btn-lg" id="doApplyBtn">&nbsp;&nbsp;立即提交报名&nbsp;&nbsp;</button>
    </div>
</div>
<%@include file="../common/footer.jsp"%>
<script>
    $(function(){
        $("#navtitle #demand").addClass("active");
        $("#doApplyBtn").click(function(){
            $.ajax({
                url:"/demand/doDemandApply", //你的路由地址
                type:"post",
                dataType:"json",
                data:$("#form1").serialize(),
                success:function(data){
                    if(data.flag){
                        alert("报名成功！");
                        $("#doApplyBtn").attr('disabled',true);
                    }else{
                        alert(" "+data.message);
                    }
                },
                error:function(e){
                    alert(""+e);
                }
            });
        });
    });
</script>
</body>
    </html>
