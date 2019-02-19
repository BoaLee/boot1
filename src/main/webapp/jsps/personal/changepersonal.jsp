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
                <h3 class="panel-title">修改个人资料</h3>
            </div>
            <div class="panel-body">
                <!-- content begin -->
                <form action="${pageContext.request.contextPath}/corporation/alterOperation" id="changePersonalForm" method="post" role="form" class="form-horizontal" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${userc.id}">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">公司名称：</label>
                        <div class="col-sm-7">
                            <input type="text" name="corporateName" class="form-control" value="${userc.corporateName}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">所在地：</label>
                        <div class="col-sm-7">
                            <input type="hidden" name="provinceName" id="provinceName" value="${userc.provinceName}">
                            <div class="col-sm-4">
                                <select name="provinceCode" class="form-control" id="provinceCode">
                                    <option value="0">--请选择--</option>
                                </select>
                            </div>
                            <div class="col-sm-4">
                                <input type="hidden" name="cityName" id="cityName" value="${userc.cityName}">
                                <select name="cityCode" class="form-control" id="cityCode">
                                    <c:if test="${empty userc.cityCode }">
                                        <option value="0">--请选择--</option>
                                    </c:if>
                                    <c:if test="${not empty userc.cityCode }">
                                        <option value="${userc.cityCode}">${userc.cityName}</option>
                                    </c:if>
                                </select>
                            </div>
                            <div class="col-sm-4">
                                <input type="hidden" name="areaName" id="areaName" value="${userc.areaName}">
                                <select name="areaCode" class="form-control" id="areaCode" >
                                    <c:if test="${empty userc.areaCode }">
                                        <option value="0">--请选择--</option>
                                    </c:if>
                                    <c:if test="${not empty userc.areaCode }">
                                        <option value="${userc.areaCode}">${userc.areaName}</option>
                                    </c:if>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">公司详细地址：</label>
                        <div class="col-sm-7">
                            <input type="text" name="corporateAddress" class="form-control" value="${userc.corporateAddress}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">经营范围：</label>
                        <div class="col-sm-7">
                            <input type="text" name="scopeOperation" class="form-control" value="${userc.scopeOperation}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">营业执照：</label>
                        <div class="col-sm-4">
                            <img src="" id="businessLicense"  style="width: 200px;height: 120px">
                            <input type="hidden" name="businessLicense" value="${userc.businessLicense}">
                        </div>
                        <div class="col-sm-3">
                            <input type="file" name="file1" id="file1"/>
                            <input type="button" class="btn btn-info" onclick="uploadFile1()" value="重新上传"></input>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">公司logo：</label>
                        <div class="col-sm-4">
                            <img src="" id="logo"  style="width: 200px;height: 120px">
                            <input type="hidden" name="logo" value="${userc.logo}">
                        </div>
                        <div class="col-sm-3">
                            <input type="file" name="file2" id="file2"/>
                            <input type="button" class="btn btn-info" onclick="uploadFile2()" value="重新上传"></input>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-5 col-md-offset-4">
                            <input type="submit" class="btn btn-danger" value="&nbsp;&nbsp;提交&nbsp;&nbsp;"></input>
                        </div>
                    </div>

                </form>
                <!-- content end -->
            </div>
        </div>
    </div>
</div>
<%@include file="../common/footer.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/changepersonal.js"></script>
<script>
    $(function(){
        $("#personalLeft li:eq(3)").addClass("active");
    });
</script>
    </body>
    </html>
