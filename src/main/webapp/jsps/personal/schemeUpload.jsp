<%--
  Created by IntelliJ IDEA.
  User: liulx
  Date: 2018/9/10
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/header.jsp"%>
<style type="text/css">
    html {
        font-family: Arial;
    }

    form {
        margin: 50px auto;
        width: 400px;
    }

    input {
        width: 300px;
        padding: 4px;
    }

    #uploadBtn {
        margin-top: -3px;
        margin-left: 5px;
        width: 60px;
        height: 30px;
        font-weight: bold;
        font-size: 12px;
    }

    #fileTest {
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 3px;
    }

    .file-temp {
        position: relative;
        display: none;
        width: 300px;
        height: 31px;
    }

    .file-temp-item {
        position: absolute;
        top: 4px;
        height: 24px;
    }

    .item-more-btn {
        display: inline-block;
        position: absolute;
        top: 18px;
        right: 0.5%;
        width: 10px;
        height: 10px;
        color: #777;
        cursor: pointer;
    }

    .item-more-btn:hover {
        border-top-color: #aaa;
    }

    .file-temp-name {
        display: inline-block;
        overflow: hidden;
        width: 90%;
        height: 26px;
        padding: 2px 15px 2px 5px;
        border-radius: 2px;
        background-color: #eaeaf3;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    .file-temp-btn {
        position: absolute;
        display: inline-block;
        top: 4px;
        right: 11%;
        width: 18px;
        height: 18px;
        line-height: 18px;
        text-align: center;
        border: 1px solid #ddd;
        background-color: #ccc;
        border-radius: 50%;
        color: #fff;
        font-size: 18px;
        cursor: pointer;
    }

    .item-more {
        position: absolute;
        overflow-y: auto;
        display: none;
        padding-left: 0;
        width: 300px;
        max-height: 150px;
        list-style: none;
    }

    .item-more li {
        position: relative;
        padding: 5px;
        border: 1px solid #ccc;
        border-top: none;
    }
    .item-more li:hover {
        background-color: #f5f5f9;
    }

    .file-item-more-name {
        display: inline-block;
        width: 90%;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    .file-item-more-btn {
        position: absolute;
        display: inline-block;
        top: 8px;
        right: 2%;
        width: 18px;
        height: 18px;
        line-height: 18px;
        text-align: center;
        border: 1px solid #ddd;
        background-color: #ddd;
        border-radius: 50%;
        color: #fff;
        font-size: 18px;
        cursor: pointer;
    }
    .file-item-more-btn:hover {
        background-color: #ccc;
    }

    .upload-tip {
        display: none;
        margin: 50px auto;
        text-align: center;
        font-size: 12px;
    }
    .titlep{
        height: 60px;
        line-height: 70px;
        font-weight: bolder;
        width: 80%;
        border-bottom: 2px solid #0ba1b5;
        margin-left: 10px;
    }
    #showFiles{
        margin: 30px;
        border: 1px solid #0f0f0f;
        padding: 30px;
        min-height: 160px;
    }
    .schemespan{
        margin-left: 30px;
    }
</style>
<!-- 当前位置 开始 -->
<div class="programme_position breadcrumb">
    <div class="container">
        <span>当前位置：</span>
        <a href="#">用户中心></a>
        <a href="#">承接需求></a>
        <a href="#">上传方案></a>
    </div>
</div>
<!-- 当前位置 结束 -->
<div class="row">
    <%@include file="personalLeftTree.jsp"%>
    <div class="col-md-9 col-sm-7">

        <p class="titlep">${demand.projectTitle}</p>
        <div class="col-md-6 col-xs-12">
            <div id="showFiles">
                <c:forEach items="${list}" var="scheme">
                    <p><span>${scheme}</span><button class=" btn btn-xs btn-primary schemespan" onclick="deleteScheme(this)">删除</button></p>
                </c:forEach>
            </div>
        </div>
        <div class="col-md-6 col-xs-12" style="padding-top: 40px">
            <p>项目类型：${demand.typeName1}/${demand.typeName2}</p>
            <p>发布时间：<fmt:formatDate value="${demand.publishDate}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
            <p>项目费用：${demand.projectBudgetId}万元</p>
            <p>项目周期：${demand.projectPeriod}</p>
        </div>
        <div class="col-md-9 col-xs-12">
            <form name="form" id="form" method="post" action="fileTest.php" enctype="multipart/form-data">
                <input type="hidden" name="demandId" value="${demand.id}">
                <!-- <input type="number" name="numberTest" value="100"> -->
                <input type="file" name="files" id="fileTest" multiple>
                <!-- 当前选择的文件列表（最多显示5条） -->
                <span class="file-temp"> </span>
                <!-- 查看更多文件 -->
                <ul class="item-more">

                </ul>
                <input type="button" class="btn btn-success" id="uploadBtn" value="上传">
                <p class="upload-tip">文件上传成功</p>
            </form>
            <!-- 当前选择的文件列表 文件信息模版 -->
            <div id="file-temp-item-tpl" style="display: none;">
                <span class="file-temp-item"style="{{style}}">
                        <span class="file-temp-name">{{name}}</span>
                        <span class="file-temp-btn">×</span>
                        </span>
            </div>
        </div>

    </div>

</div>
<%@include file="../common/footer.jsp"%>
<script type="text/javascript">
    /**
     * 向文件列表元素中添加相应的文件项
     * @param {Array} files 当前的文件列表数组对象
     */
    function addItem(files) {
           var fileTempItemTpl = $('#file-temp-item-tpl').html(),
            fileMoreItemTpl = $('#file-more-item-tpl').html(),
            htmlTemp = [],
            htmlMoreTemp = [],
            // 文件列表中各文件坐标位置及所占空间
            left = 2,
            width = 100,
            // 最多取前5个文件
            fileTempLen = files.length > 5 ? 5 : files.length;
           for(var i = 0, j = files.length; i < j; ++i) {
           // 当i > 4，即第6个文件开始
            if(i > 4) {
                htmlMoreTemp.push(fileMoreItemTpl.replace('{{name}}', files[i].name));
                continue;
            }
            // 计算每一项坐标left、占宽width
            left = i === 0 ? 2 : 2 + i * (100 / fileTempLen);
            width = 100 / fileTempLen - 2;
            htmlTemp.push(fileTempItemTpl.replace('{{style}}','left: '+ left +'%;width: '+ width +'%;').replace('{{name}}', files[i].name)
            );
        }
         // 渲染相关元素内容
        $('.file-temp').html(''
            +'<input type="text" style="background-color:#fff;" class="form-control" id="fileTemp" readonly>'
            + htmlTemp.join('')
            + (files.length > 5
                    ?'<span class="item-more-btn" title="查看更多">=</span>'
                    :''
            )
        );
        $('.item-more').html(htmlMoreTemp.join(''));
    }
    // 保存当前选择的（更新后）文件列表
    var curFiles = [];
    // 初始选择文件时触发
    $('#fileTest').change(function() {
        var $this= $(this),
            $temp = $('.file-temp'),
            files =this.files;
        if(files && files.length) {
            // 原始FileList对象不可更改，所以将其赋予curFiles提供接下来的修改
            Array.prototype.push.apply(curFiles, files);
            addItem(curFiles);
            $this.hide();
            $temp.css('display','inline-block');
        }
    });
    $(document)
          // 取消选择某个文件时，在文件列表数组对象中删除这个值，并更新列表
        .on('click','.file-temp-btn, .file-item-more-btn',function() {
            $('.upload-tip').hide();
            var name = $(this).prev().text();
           // 去除该文件
            curFiles = curFiles.filter(function(file) {
                return file.name !== name;
            });
             // 文件列表数组对象长度大于5才显示“更多文件列表”下拉项
            if(curFiles.length <= 5) {
                $('.item-more').hide();
            }
              // 文件列表数组被清空则重置文件选择表单项
            if(!curFiles.length) {
                $('#fileTest').val('').show();
                $('.file-temp').css('display','none');
            }else{
                addItem(curFiles);
            }
            console.log(curFiles)
        })
        // 显示“更多文件列表”下拉项
        .on('click','.item-more-btn',function() {
            $('.upload-tip').hide();
            $('.item-more').show('normal');
        });
    // 上传操作
    $('#uploadBtn').click(function() {
        $('.upload-tip').hide();
       // 构建FormData对象
        var fd =new FormData($('#form')[0]);
       for(var i = 0, j = curFiles.length; i < j; ++i) {
            fd.append('myFileTest[]', curFiles[i]);
        }
        console.log(fd);
        $.ajax({
            url:'/demand/uploadDemandScheme',
            type:'post',
            data: fd,
            dataType:'json',
            processData:false,
            contentType:false,
            success:function(rs) {
                $('.upload-tip')
                    .addClass('text-success')
                    .removeClass('text-error')
                    .text(rs.length +'个文件上传成功!')
                    .show();
                var str=$("#showFiles").html();
                if(rs.length>0){
                    for(var i=0;i<rs.length;i++){
                        str+="<p><span>"+rs[i]+"</span><button class=\" btn btn-xs btn-primary schemespan\" onclick=\"deleteScheme(this)\">删除</button></p>";
                    }
                }
                $("#showFiles").html(str);
            },
            error:function(err) {
            }
        });
    });
    function deleteScheme(obj){
        $.ajax({
            url:'/demand/deleteSchemeByContent',
            type:'post',
            data: {"content":$(obj).prev().html()},
            dataType:'json',
            success:function(data) {
                if(data){
                    alert("删除成功！");
                    window.location.reload();
                }
            },
            error:function(err) {
            }
        });
    }
</script>
</body>
    </html>
