$(function(){
    //总的导航菜单
   var pathname= window.location.pathname;
   $("#navtitle a").each(function(){
       if($(this).attr("href")==pathname){
           $(this).parent("li").addClass("active");
       }
   });
});

//form表单校验正确
function isOk(obj,text){
    obj.parent().parent().removeClass("has-error");
    obj.parent().parent().addClass("has-success");
    obj.next("span").html(text);
}
//form表单校验失败的情况
function isError(obj,text){
    obj.parent().parent().removeClass("has-success");
    obj.parent().parent().addClass("has-error");
    obj.next("span").html(text);
}
//修改账户信息
function editUserAccount(){
    $.ajax({
        type: "post",
        url: "/user/updateUserAccount",
        data:$("#updateUserAccount").serialize(),
        dataType:"json",
        success: function(dat) {
            if(dat){
                alert("修改账户信息成功！");
                //$('#editAccount').modal("hide");
                window.location.href="/user/logout";
            }else{
                alert("修改账户信息失败！");
            }
        },error:function(){
            alert("修改账户信息失败！");
        }
    });
}

//图片预览路径
function getObjectURL(file) {
    var url = null;
    if(window.createObjectURL != undefined) { // basic
        url = window.createObjectURL(file);
    } else if(window.URL != undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file);
    } else if(window.webkitURL != undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file);
    }
    return url;
}

function doSendDemand(){
    //判断当前用户是否是已审核用户
    $.ajax({
        type:"post",
        url: "/corporation/isAuditUser",
        dataType:"json",
        success:function(data){
            if(data.flag){
                window.location.href="/demand/initPage";
            }else{
                alert(data.message);
            }
        },error:function(){
            alert("后台出错！");
        }
    });

}