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
        <a href="#">发布需求></a>
    </div>
</div>
<!-- 当前位置 结束 -->
<div class="row">
    <%@include file="personalLeftTree.jsp"%>
    <div class="col-md-9 col-sm-7">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    发布需求
                </h3>
            </div>
            <div class="panel-body">
                <br>
                <form action="#" method="post" role="form" class="form-horizontal" id="demandForm">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">项目名称：</label>
                        <div class="col-sm-7">
                            <input type="text" name="projectTitle" class="form-control" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">项目介绍：</label>
                        <div class="col-sm-9">
                            <iframe src="${pageContext.request.contextPath}/jsps/personal/mydemandUeditor.jsp" id="projectAbstract" style="width: 100%;height: 490px;"></iframe>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">发布截止日期：</label>
                        <div class="col-sm-7">
                            <input type="text" name="abortDate" class="form-control" id="datetimepicker" value="2018-10-15 00:00:00">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">项目周期：</label>
                        <div class="col-sm-7">
                            <input type="hidden" name="projectPeriod" id="projectPeriod">
                            <select name="projectPeriodId" class="form-control" id="projectPeriodId" >
                                <option value="0">--请选择--</option>
                                <c:if test="${not empty periods}">
                                    <c:forEach items="${periods}" var="p">
                                        <option value="${p.id}">${p.name}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">项目预算：</label>
                        <div class="col-sm-7">
                            <input type="hidden" name="projectBudget" id="projectBudget">
                            <select name="projectBudgetId" class="form-control" id="projectBudgetId" >
                                <option value="0">--请选择--</option>
                                <c:if test="${not empty budgets}">
                                    <c:forEach items="${budgets}" var="b">
                                        <option value="${b.id}">${b.name}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">项目类型：</label>
                        <div class="col-sm-7">
                            <div class="col-sm-5">
                                <select name="projectType" class="form-control" id="projectType">
                                    <option value="0">--请选择--</option>
                                    <c:if test="${not empty types}">
                                        <c:forEach items="${types}" var="t">
                                            <option value="${t.code}">${t.name}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </div>
                            <div class="col-sm-5">
                                <select name="projectSecondeType" class="form-control" id="projectSecondeType"></select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">所在地：</label>
                        <div class="col-sm-7">
                            <input type="hidden" name="provinceName" id="provinceName">
                            <div class="col-sm-4">
                                <select name="provinceCode" class="form-control" id="provinceCode">
                                    <option value="0">--请选择--</option>
                                    <c:if test="${not empty provinces}">
                                        <c:forEach items="${provinces}" var="p">
                                            <option value="${p.code}">${p.name}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </div>
                            <div class="col-sm-4">
                                <input type="hidden" name="cityName" id="cityName" >
                                <select name="cityCode" class="form-control" id="cityCode"></select>
                            </div>
                            <div class="col-sm-4">
                                <input type="hidden" name="areaName" id="areaName" >
                                <select name="areaCode" class="form-control" id="areaCode" ></select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="demandState" id="demandState" value="0">
                        <div class="col-md-2 col-md-offset-4">
                            <input type="button" onclick="saveDemand()" class="btn btn-primary" value="&nbsp;&nbsp;保存&nbsp;&nbsp;"></input>
                        </div>
                        <div class="col-md-2">
                            <input type="button" onclick="sumbitDemand()" class="btn btn-primary" value="&nbsp;&nbsp;发布&nbsp;&nbsp;"></input>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@include file="../common/footer.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/mydemand.js"></script>
</body>
    </html>
