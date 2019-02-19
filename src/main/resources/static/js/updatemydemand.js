$(function(){
    $("#personalLeft li:eq(4)").addClass("active");


    $('#datetimepicker').datetimepicker({
       // minView: "month", //选择日期后，不会再跳转去选择时分秒
        language: 'zh-CN',
        format: 'yyyy-mm-dd hh:ii:ss',
        todayBtn: 1,
        autoclose: 1
    });

    $("#projectPeriodId").change(function(){
        $("#projectPeriod").val($(this).find("option:selected").text());
    });
    $("#projectBudgetId").change(function(){
        $("#projectBudget").val($(this).find("option:selected").text());
    });

    $("#projectType").change(function(){
        var ptype=$(this).val();
        $.ajax({
            type:"post",
            url: "/china/findProjectTypeByPtype/"+ptype,
            dataType:"json",
            success:function(data){
                var str="";
                if(null!=data && data.length>0){
                    for(var i=0;i<data.length;i++){
                        str+="<option value='"+data[i].code+"'>"+data[i].name+"</option>";
                    }
                }
                $("#projectSecondeType").html(str);
            },error:function(){
                alert("后台出错！");
            }
        });
    });
    $("#provinceCode").change(function(){
        $("#provinceName").val($(this).find("option:selected").text());
        $.ajax({
            url: "/china/findCityByPid/"+$(this).val(),//请求的action路径
            type:"post",
            dataType:"json",
            error: function (error) {//请求失败处理函数
                console.log(error);
                alert('请求失败');
            },
            success:function(data){
                if(null!=data && data.length>0){
                    var str="<option value=\"0\">--请选择--</option>";
                    for(var i=0;i<data.length;i++){
                        str+="<option value=\""+data[i].code+"\">"+data[i].name+"</option>";
                    }
                    $("#cityCode").html(str);
                }
            }
        });
    });

    $("#cityCode").change(function(){
        $("#cityName").val($(this).find("option:selected").text());
        $.ajax({
            url: "/china/findAreaByPid/"+$(this).val(),//请求的action路径
            type:"post",
            dataType:"json",
            error: function (error) {//请求失败处理函数
                console.log(error);
                alert('请求失败');
            },
            success:function(data){
                if(null!=data && data.length>0){
                    var str="<option value=\"0\">--请选择--</option>";
                    for(var i=0;i<data.length;i++){
                        str+="<option value=\""+data[i].code+"\">"+data[i].name+"</option>";
                    }
                    $("#areaCode").html(str);
                }
            }
        });
    });
    $("#areaCode").change(function(){
        $("#areaName").val($(this).find("option:selected").text());
    });
});

//保存需求
function saveDemand() {
    doupdateDemand();
}
//提交需求
function sumbitDemand() {
    $("#demandState").val("1");
    doupdateDemand();
}
function doupdateDemand(){
    var data=$("#demandForm").serialize();
    data+="&projectAbstract="+document.getElementById("projectAbstract").contentWindow.getContent();
    console.log(data);
    $.ajax({
        type:"post",
        url:"/demand/updateDemand",
        data:data,
        dataType:"json",
        success:function(data){
            if(data){
                alert("成功！");
                window.location.href="/jsps/personal/alldemand.jsp";
            }else{
                alert("失败！");
            }
        },error:function(){
            alert("失败！");
        }
    });
}