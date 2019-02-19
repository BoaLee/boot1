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
        <a href="#">需求大厅></a>
        <a href="#">需求列表></a>
        <a href="#">需求详情></a>
    </div>
</div>
<br>
<!-- 当前位置 结束 -->
<div class="container">
    <iframe src="/demand/demandHallDetail/${param.demandId}"  marginwidth="0" marginheight="0" frameborder="0" scrolling="auto"  width="100%" height="750px" ></iframe>
</div>
</div>
<%@include file="../common/footer.jsp"%>
<script>
    $(function(){
        $("#navtitle #demand").addClass("active");
    });
</script>
</body>
    </html>
