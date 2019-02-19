var url="/order/findAllOrders";
var tableOptionOrder={//table容器的id
    url: url,//请求的url
    cache: false,//是否用缓存，false不用缓存。
    pagination: true,//分页的开关
    pageList: [5,10,15],//一页显示的行数的下拉列表
    pageSize: 5,//默认一页显示多少行
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
            field: 'title',
            title: '订单名称'
        }, {
            field: 'corporateName',
            title: '服务商'
        }, {
            field: 'money',
            title: '费用'
        }, {
            field: 'stutas',
            title: '状态',
            formatter:function(value,row,index){
                switch (value){
                    case 0:
                        return "未支付";
                    case 1:
                        return "已支付";
                    case 2:
                        return "已失效";
                    case 3:
                        return "未完成";
                    default:
                        return "已完成";
                }
            }
        },{
            title: "操作",
            field:'stutas',
            formatter:function(value,row,index){
                switch (value){
                    case 0:
                        return '<button class="btn btn-danger" onclick="payOrder(\'' + row.oid + '\',\'' + row.money + '\')">支付</button>&nbsp;&nbsp;'
                }
            }
        }
    ]
};
$(function () {
    $("#personalLeft li:eq(6)").addClass("active");
    $("#table_allOrder").bootstrapTable(tableOptionOrder);
    $('#demandTabs a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');
        var title=$(this).attr("href").substring(1);

        if(title=="unfinished"){
            url="/order/findOrders/0";
        }else if(title=="finished"){
            url="/order/findOrders/1";
        }else if(title="allOrder"){
            url="/order/findAllOrders";
        }
        tableOptionOrder.url=url;
        $("#table_"+title).bootstrapTable("destroy");
        $("#table_"+title).bootstrapTable(tableOptionOrder);
    })

});

function payOrder(oid,money){
    window.location.href="/jsps/personal/pay.jsp?oid="+oid+"&money="+money;
}
