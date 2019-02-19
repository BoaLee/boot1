var update1="<button class='btn btn-primary' onclick='updateMyDemand(" ;
var update2= ")'>修改</button>&nbsp;&nbsp;";
var del="<button class='btn btn-default'>删除</button>&nbsp;&nbsp;";
var publish="<button class='btn btn-danger'>发布</button>&nbsp;&nbsp;";
var show1="<button class='btn btn-primary' onclick='showMyDemand(";
var show2=")'>查看</button>&nbsp;&nbsp;";
var money="<button class='btn btn-success'>缴费</button>&nbsp;&nbsp;";
var fenshu="<button class='btn btn-success'>打分</button>&nbsp;&nbsp;";
var upload="<button class='btn btn-danger'>上传方案</button>&nbsp;&nbsp;";
var updateFile="<button class='btn btn-danger'>修改方案</button>&nbsp;&nbsp;";

var url="/demand/findAllCurrentDemand";
var tableOption={//table容器的id
    url: url,//请求的url
    cache: false,//是否用缓存，false不用缓存。
    pagination: true,//分页的开关
    pageList: [10,15,20],//一页显示的行数的下拉列表
    pageSize: 10,//默认一页显示多少行
    pageNumber: 1,//默认显示第几页
    sidePagination: 'client',//client:前端分页；server:后端分页
    sortName: 'id',//根据哪个字段排序
    sortOrder: 'asc',//排序方式
    columns: [//field对应的是entity中的属性  title:列名
        {
            field: 'id', // 返回json数据中的name
            title: '序号', // 表格表头显示文字
            formatter:function(value,row,index){
                return index+1;
            }
        }, {
            field: 'projectTitle',
            title: '项目名称'
        }, {
            field: 'demandState',
            title: '状态',
            formatter:function(value,row,index){
                switch (value){
                    case 0:
                        return "草稿";
                    case 1:
                        return "待审核";
                    case 2:
                        return "报名中";
                    case 3:
                        return "提交中";
                    case 4:
                        return "开发中";
                    case 5:
                        return "维护中";
                    case 6:
                        return "已完成";
                    default:
                        return "未知状态";
                }
            }
        },{
            title: "操作",
            field:'demandState',
            formatter:function(value,row,index){
                switch (value){
                    case 0:
                        return update1+""+row.id+""+update2+" "+show1+""+row.id+""+show2+" "+del+" "+publish;
                    case 1:
                        return update1+""+row.id+""+update2+" "+del+" "+show1+""+row.id+""+show2;
                    case 2:
                        return show1+""+row.id+""+show2;
                    case 3:
                        return show1+""+row.id+""+show2+" "+money+" "+upload+" "+updateFile;
                    case 4:
                        return show1+""+row.id+""+show2+" "+upload+" "+updateFile;
                    case 5:
                        return show1+""+row.id+""+show2+" "+money;
                    case 6:
                        return show1+""+row.id+""+show2+" "+money+" "+fenshu;
                    default:
                        return "未知状态";
                }
            }
        }
    ]
};
$(function () {
    $("#personalLeft li:eq(4)").addClass("active");
    $("#table_all").bootstrapTable(tableOption);
    $('#demandTabs a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');
        var title=$(this).attr("href").substring(1);

        if(title=="rough"){
            url="/demand/findCurrentDemandByDemandStatus/demandStatus/0";
        }else if(title=="publish"){
            url="/demand/findCurrentDemandByDemandStatus/demandRangeStatus/1/5";
        }else if(title=="complete"){
            url="/demand/findCurrentDemandByDemandStatus/demandStatus/6";
        }else if(title="all"){
            url="/demand/findAllCurrentDemand";
        }
        tableOption.url=url;
        $("#table_"+title).bootstrapTable("destroy");
        $("#table_"+title).bootstrapTable(tableOption);
    })

});
//根据需求的id修改需求
function updateMyDemand(did){
    window.location.href="/demand/toupdateMyDemand/"+did;
}

//根据需求的id查看需求
function showMyDemand(did){
    window.location.href="/demand/toshowMyDemand/"+did;
}