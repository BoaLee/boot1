var url="/demand/findAllAppliedDemand";
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
            title: '项目名称',
            formatter:function(value,row,index){
                return "<a href='/jsps/demand/demandDetail.jsp?demandId="+row.id+"'>"+value+"</a>";
            }
        }, {
            field: 'applyStatus',
            title: '报名状态',
            formatter:function(value,row,index){
                switch (value){
                    case 0:
                        return "报名中";
                    case 1:
                        return "报名成功";
                    case 2:
                        return "报名失败";
                    default:
                        return "未知状态";
                }
            }
        },{
            title: "操作",
            field:'applyStatus',
            formatter:function(value,row,index){
                switch (value){
                    case 1:
                        return "<button class='btn btn-danger' onclick='uploadScheme("+row.id+")'>上传方案</button>&nbsp;&nbsp;";
                }
            }
        }
    ]
};
$(function () {
    $("#personalLeft li:eq(5)").addClass("active");
    $("#table_all").bootstrapTable(tableOption);
    $('#demandTabs a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');
        var title=$(this).attr("href").substring(1);
/*
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
        $("#table_"+title).bootstrapTable(tableOption);*/
    })

});

function uploadScheme(demandId){
    window.location.href="/demand/findDemandHallVoByDemandId/"+demandId;
}
