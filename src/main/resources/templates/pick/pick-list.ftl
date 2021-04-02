<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script src="/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <!--[if lt IE 9]>
    <script src="/js/html5.min.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->
    <style>
        .iconfont {
            font-family: "iconfont" !important;
            font-size: 16px;
            font-style: normal;
            -webkit-font-smoothing: antialiased;
            -webkit-text-stroke-width: 0.2px;
            -moz-osx-font-smoothing: grayscale;
        }
    </style>
</head>

<body>
<div class="x-nav">
            <span class="layui-breadcrumb">
                <a href="">首页</a>
                <a href="">演示</a>
                <a><cite>导航元素</cite></a>
            </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
    </a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-md12  layui-form-pane">
                        <div class="layui-form-item">
                            <label class="layui-form-label">选择学期</label>
                            <div class="layui-input-inline" style="width:300px;">
                                <select name="semester" id="semester" lay-filter="change">
                                    <option>请选择</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">

                </div>
                <div class="layui-card-body ">
                    <table id="LAY_table_user" class="layui-table">

                    </table>
                </div>

            </div>
        </div>
    </div>
</div>
</body>

<script>
    layui.use('laydate',
        function () {
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#start' //指定元素
            });

            //执行一个laydate实例
            laydate.render({
                elem: '#end' //指定元素
            });

        });
</script>
<script>
    layui.use('table', function () {
        var table = layui.table;

    });
</script>
<script>
    /*操作数据*/
    layui.use(['table', 'form'], function () {
        var table = layui.table;
        var form = layui.form;
        initSemester();
        /**
         * 监听下拉框变化
         * */
        form.on('select(change)', function (data) {
            getAllEssay(data.value);
        });

        function initSemester(){
            $.ajax({
                url: '/semester/findAll',
                dataType: 'json',
                success: function (res) {
                    if (res.success) {
                        var html = '<option value="" >请选择学期</option>';
                        $.each(res.data, function (i, val) {
                            html += '<option value="' + val.id + '">' + val.name + '</option>';
                        })
                        $('#semester').html(html);
                        form.render('select');
                    } else {
                        layer.msg(res.msg, {icon: 2, time: 2000});
                    }
                }
            })
        }

    });
</script>
<script th:inline="none">
    /*数据查询*/

    $(function () {
    })

    function pickLesson(classId){
        $.ajax({
            url:'/pick/pickLesson',
            data:{
                lessonClassId:classId
            },
            dataType:'json',
            success:function(res){
                if(res.success){
                    layer.msg('选课成功，请前往自选科目中查看', {icon: 1, time: 1000});
                }else{
                    layer.msg(res.msg, {icon: 2, time: 1000});
                }
            }
        })
    }

    /*获取全部文章*/
    function getAllEssay(semesterId) {
        layui.use('table',
            function () {
                var table = layui.table;
                table.render({
                    id: "checkboxTable",
                    url: '/lessonClass/findAllBySemesterId?semesterId='+semesterId,
                    elem: '#LAY_table_user',
                    page: true,
                    cols: [[
                        {checkbox: true},
                        {field: 'id', title: 'ID', width: 80},
                        {field: 'lesson', title: '课程名', sort: true, width: 120,templet:'<div>{{d.lesson.name}}</div>'},
                        {field: 'lesson', title: '授课教师', sort: true, width: 120,templet:'<div>{{d.lesson.teacherName}}</div>'},
                        {field: 'doClassTime', width: 80, title: '上课时间', sort: true},
                        {field: 'num', width: 80, title: '剩余坐席', sort: true},
                        {field: 'createTime', title: '创建时间', sort: true, width: 120},
                        {toolbar: '#barTeacher', title: '操作', width: 120}

                    ]]
                })

            });
    }


    /**
     * 判断字段是否为空
     * @param o
     * @returns {*}
     */
    function isNullFormat(o) {
        if (o) {
            return o;
        } else {
            return '暂无';
        }
    }

</script>
<script type="text/html" id="barTeacher">
    <a title="选课" onclick="pickLesson({{d.id}})" href="javascript:;">
        选课
    </a>
</script>

</html>