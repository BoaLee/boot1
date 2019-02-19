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
<div class="programme_position breadcrumb">
    <div class="container">
        <span>当前位置：</span>
        <a href="#">用户中心></a>
        <a href="#">我的需求></a>
        <a href="#">查看需求</a>
    </div>
</div>
<!-- 当前位置 结束 -->
<div class="row">
    <%@include file="personalLeftTree.jsp"%>
    <div class="col-md-9 col-sm-7">
        <iframe src="/demand/demandHallDetail/${id}"  marginwidth="0" marginheight="0" frameborder="0" scrolling="auto"  width="100%" height="750px" ></iframe>
    </div>
</div>
<%@include file="../common/footer.jsp"%>
<script>
    $(function(){
        $("#personalLeft li:eq(4)").addClass("active");

       
    });
</script>
</body>
    </html>
