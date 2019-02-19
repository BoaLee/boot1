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
    .platSafety{
        padding: 20px;
        margin: 10px;
        height: 200px;
        background-color: #eee;
        cursor: pointer;
    }
    .platSafety .p1{
         font-weight: bold;
        font-size: 14px;
    }
    .platSafety .p1 span{
        font-weight: normal;
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
    .f1{
        line-height: 40px;
    }
</style>
<!-- 当前位置 开始 -->
<div class="programme_position breadcrumb">
    <div class="container">
        <span>当前位置：</span>
        <a href="#">需求大厅></a>
        <a href="#">需求列表></a>
    </div>
</div>
<br>
<!-- 当前位置 结束 -->
<div class="container">
    <c:forEach items="${list}" var="demand" >
    <div class="col-md-6 col-sm-12">
    <div class="platSafety" demandId="${demand.id}">
        <p class="p1">${demand.projectTitle}
            <button type="button" class="btn btn-info btn-xs">报名中</button>
        </p>
        <div class="col-xs-7">
            <p class="p1">应用领域：<span>${demand.scopeOperation}</span></p>
            <p class="p1">区域：<span>${demand.provinceName}&nbsp;${demand.cityName}&nbsp;${demand.areaName}</span></p>
        </div>
        <div class="col-xs-5">
            <span class="glyphicon glyphicon-equalizer skeyblue fontSize fleft"></span>
            <p class="p1 f1">已报名：<span>${demand.applyNum}人</span></p>
        </div>
        <div class="col-xs-7">
            <p class="p1">
                <span class="glyphicon glyphicon-circle-arrow-right skeyblue"></span>
                项目类型：<span>${demand.typeName1}/${demand.typeName2}</span>
            </p>
            <p class="p1">
                <span class="glyphicon glyphicon-circle-arrow-right skeyblue"></span>
                发布时间：<span><fmt:formatDate value="${demand.publishDate}" pattern="yyyy-MM-dd"></fmt:formatDate> </span>
            </p>
        </div>
        <div class="col-xs-5">
            <p class="p1">项目预算：<span>${demand.projectBudget}</span></p>
            <p class="p1">截止时间：<span><fmt:formatDate value="${demand.abortDate}" pattern="yyyy-MM-dd"></fmt:formatDate></span></p>
        </div>
    </div>
    </div>
    </c:forEach>
</div>
</div>
<%@include file="../common/footer.jsp"%>
<script>
    $(function(){
        $("#navtitle #demand").addClass("active");
        $(".platSafety").each(function(){
            $(this).click(function(){
                 var demandId=$(this).attr("demandId");
                 window.location.href="/jsps/demand/demandDetail.jsp?demandId="+demandId;
            });
        });
    });
</script>
</body>
    </html>
