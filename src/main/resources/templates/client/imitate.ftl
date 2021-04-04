<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta charset="UTF-8">
    <title>首页</title>
    <link rel="stylesheet" href="/css/index.css">
    <style>
        .airList{

        }
        .airList div{
            padding:10vw;
        }
    </style>
</head>
<body>
    <div class="airList">

    </div>
    <div class="data-nav">

    </div>
</body>
<script type="text/javascript" src="../js/jquery.js"></script>
<script>
    $(function () {
        initAir();
    })

    function initAir(){
        $.ajax({
            url: '/air/findAll',
            dataType: 'json',
            success: function (res) {
                if (res.success) {
                    var data = res.data;
                    var html = '';
                    $.each(data, function (i, r) {
                        html = '<div onclick="findAir('+r.id+');">'+r.name+'</div>\n';
                    })
                    $('.airList').html(html);
                }else{
                    alert(res.msg)
                }
            }
        })
    }

    function findAir(id) {
        clearInterval();
        setInterval(function () {
            initData(id);
        },500);

    }

    function initData(id){
        $.ajax({
            url: '/air/findByAirId',
            data:{
                airId:id
            },
            dataType: 'json',
            success: function (res) {
                if (res.success) {
                    var data = res.data;
                    var html = '';
                    html+='<div>\n' +
                            '            温度：<span>'+data.temperature+'</span>℃\n' +
                            '        </div>\n' +
                            '        <div>\n' +
                            '            模式：<span>';
                    if(data.mode == 0){
                        html+='制冷';
                    }else if(data.mode == 1){
                        html+='制热';
                    }else if(data.mode == 2){
                        html+='除湿';
                    }
                    html+='</span>\n' +
                            '        </div>\n' +
                            '        <div>\n' +
                            '            风速：<span>'+data.fengsu+'</span>\n' +
                            '        </div>\n' +
                            '        <div>\n' +
                            '            风向：<span>'+data.fengxiang+'</span>\n' +
                            '        </div>';
                    $('.data-nav').html(html);
                }else{
                    alert(res.msg)
                }
            }
        })
    }

</script>
</html>