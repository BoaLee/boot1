<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 底部开始 -->
    <div class="footer prog_foot">
        <div class="footerCenter">
            <p class="bqsy">版权所有</p>
            <div class="list">
                <ul class="list-unstyled">
                    <li>大威平台</li>
                    <li>首页</li>
                    <li>关于我们</li>
                    <li>公司简介</li>
                </ul>
                <ul class="list-unstyled">
                    <li>联系我们</li>
                    <li>顾问邮箱：123456@qq.com</li>
                    <li>联系电话：123456@qq.com</li>
                </ul>
                <ul class="list-unstyled">
                    <li>新手指南</li>
                    <li>入驻服务商</li>
                    <li>免费发布需求</li>
                </ul>
                <ul class="list-unstyled">
                    <li>帮助中心</li>
                    <li>需求大厅</li>
                    <li>完成需求</li>
                    <li>进行需求</li>
                </ul>
                <ul class="list-unstyled">
                    <li>支持</li>
                    <li>安全中心</li>
                    <li>合同协议</li>
                    <li>平台安全条款</li>
                </ul>
                <ul class="weinxinqq list-unstyled">
                    <p><img src="${pageContext.request.contextPath}/static/images/weixin.png" alt="">微信</p><br>
                    <p><img src="${pageContext.request.contextPath}/static/images/qq.png" alt="">QQ</p>
                </ul>
                <ul class="qr list-unstyled">
                    <li><img src="${pageContext.request.contextPath}/static/images/qr.png" alt="" style="width: 73px;height: 73px"></li>
                    <li>平台公众号</li>
                </ul>
            </div>
            <div class="footer-copy">
                2016年logo 京ICP备14023790号-2 京公安网备1101080201180号
            </div>
        </div>
    </div>

<!-- 查看账户信息-->
<div class="modal fade" id="showAccount" tabindex="-1" role="dialog" aria-labelledby="showAccountLable">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="showAccountLable">查看账户信息</h4>
            </div>
            <div class="modal-body">
                <form action="#" method="post" role="form" class="form-horizontal">
                   <div class="form-group">
                        <label class="col-sm-3 control-label">用户名称：</label>
                        <div class="col-sm-9">
                            <p class="form-control-static">${sessionScope.user.username}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">电话：</label>
                        <div class="col-sm-9">
                            <p class="form-control-static">${sessionScope.user.iphone}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">QQ：</label>
                        <div class="col-sm-9">
                            <p class="form-control-static">${sessionScope.user.qq}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">创建人：</label>
                        <div class="col-sm-9">
                            <p class="form-control-static">${sessionScope.user.createName}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">创建时间：</label>
                        <div class="col-sm-9">
                            <p class="form-control-static">
                                <c:if test="${not empty sessionScope.user.createDate}">
                                    <fmt:formatDate value="${sessionScope.user.createDate}" pattern="yyyy-MM-dd HH-mm-ss"></fmt:formatDate>
                                </c:if>
                            </p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">修改人：</label>
                        <div class="col-sm-9">
                            <p class="form-control-static">${sessionScope.user.updateName}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">修改时间：</label>
                        <div class="col-sm-9">
                            <p class="form-control-static">
                                <c:if test="${not empty sessionScope.user.updateDate}">
                                    <fmt:formatDate value="${sessionScope.user.updateDate}" pattern="yyyy-MM-dd HH-mm-ss"></fmt:formatDate>
                                </c:if>
                            </p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">备注信息：</label>
                        <div class="col-sm-9">
                            <p class="form-control-static">${sessionScope.user.remarks}</p>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- 修改账户信息-->
<div class="modal fade" id="editAccount" tabindex="-1" role="dialog" aria-labelledby="editAccountLable">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="editAccountLable">修改账户信息</h4>
            </div>
            <div class="modal-body">
                <form action="#" method="post" role="form" class="form-horizontal" id="updateUserAccount">
                    <input type="hidden" name="id" value="${sessionScope.user.id}">
                    <div class="form-group">
                        <label class="control-label col-md-3">用户名：</label>
                        <div class="col-md-8">
                            <input type="text" name="username" class="form-control" value="${sessionScope.user.username}">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">电话:</label>
                        <div class="col-md-8">
                            <input type="text" name="iphone" class="form-control" value="${sessionScope.user.iphone}">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">QQ:</label>
                        <div class="col-md-8">
                            <input type="text" name="qq" class="form-control" value="${sessionScope.user.qq}">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">备注信息:</label>
                        <div class="col-md-8">
                            <input type="text" name="remarks" class="form-control" value="${sessionScope.user.remarks}">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="editUserAccount()">确认修改</button>
            </div>
        </div>
    </div>
</div>


<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/static/common/witkey.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/datepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/datepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
