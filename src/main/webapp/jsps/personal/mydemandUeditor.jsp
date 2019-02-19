<%--
  Created by IntelliJ IDEA.
  User: liulx
  Date: 2018/9/25
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body{
            margin: 0;padding: 0;
        }
    </style>
    <link href="${pageContext.request.contextPath}/static/Ueditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
</head>
<body>
<div>
    <script type="text/plain" id="myEditor" style="width:100%;height:400px;">
        <p>这里我可以写一些输入提示</p>
    </script>
</div>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/static/common/jquery-3.2.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/Ueditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/Ueditor/umeditor.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/Ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    $(function(){
        //实例化编辑器
        var um = UM.getEditor('myEditor');
        var content="<p style=\"white-space: normal;\"><strong>一、产品介绍</strong></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><strong>二、主要功能点</strong></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><strong>三、可参考品</strong></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><strong>四、人员要求</strong></p><p><br/></p> ";
        UM.getEditor('myEditor').setContent(content);
    });
    //获取content内容
    function getContent() {
        return UM.getEditor('myEditor').getContent();
    }
</script>

</body>
</html>
