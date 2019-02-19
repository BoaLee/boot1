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
        <a href="#">个人资料></a>
    </div>
</div>
<!-- 当前位置 结束 -->
<div class="row">
    <%@include file="personalLeftTree.jsp"%>
    <div class="col-md-9 col-sm-7">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    个人资料
                    <input type="button" class="btn btn-info" style="float:right;margin-top: -8px;" onclick="tochangePersonal()" value="&nbsp;&nbsp;修改个人资料&nbsp;&nbsp;">
                     </input>
                </h3>
            </div>
            <div class="panel-body">
                <br>
                <form action="#" method="post" role="form" class="form-horizontal">
                    <input type="hidden" name="id" id="id" value="${userc.id}">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">公司名称：</label>
                        <div class="col-sm-9">
                            <p class="form-control-static" id="corporateName">${userc.corporateName}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">所在地：</label>
                        <div class="col-sm-9">
                            <p class="form-control-static" id="corporate">
                                ${userc.provinceName}->${userc.cityName}->${userc.areaName}
                            </p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">公司详细地址：</label>
                        <div class="col-sm-9">
                            <p class="form-control-static" id="corporateAddress">
                                ${userc.corporateAddress}
                            </p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">经营范围：</label>
                        <div class="col-sm-9">
                            <p class="form-control-static" id="scopeOperation">
                                ${userc.scopeOperation}
                            </p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">营业执照：</label>
                        <div class="col-sm-9">
                            <img src="../../uploads/license/${userc.businessLicense}" id="businessLicense" height="180px" width="300px">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">公司logo：</label>
                        <div class="col-sm-9">
                            <img src="/uploads.logo/${userc.logo}" id="logo" height="180px" width="300px">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-5 col-md-offset-4">
                            <button type="button" class="btn btn-info" onclick="tochangePersonal()">
                                &nbsp;&nbsp;进一步完善信息&nbsp;&nbsp;
                            </button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
<%@include file="../common/footer.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/personal.js"></script>
<script>
    $(function(){
        $("#personalLeft li:eq(0)").addClass("active");
    });
</script>
</body>
    </html>
