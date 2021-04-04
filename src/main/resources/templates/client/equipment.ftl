<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta charset="UTF-8">
    <title>首页</title>
    <link rel="stylesheet" href="/css/index.css">
    <style>
        .btn-nav{
            margin-top:0.3rem;
            padding:0 0.3rem;
        }
        .temp-nav{
            text-align: center;
        }
        .temp-nav button{
            height:13vw;
            width:47%;
        }
        .up-btn{
            background: #FF473F;
            color:#fff;
        }
        .down-btn{
            background: #1E9FFF;
            color:#fff;
        }
        .mode-nav{
            margin-top:5vw;
            display: flex;
            justify-content: space-between;
            padding:0 1vw;
        }
        .mode-nav button{
            width:33vw;
            height:12vw;
            color:#fff;
        }
        .cold{
            background: #1E9FFF;
        }
        .hot{
            background: #FF473F;
        }
        .chushi{
            background: #2d8ac7;
        }
        .func-nav{
            margin-top:5vw;
            display: flex;
            justify-content: space-between;
            padding:0 1vw;
        }
        .func-nav button{
            width:33vw;
            height:12vw;
            color:#fff;
        }
        .fengsu{
            background: #5FB878;
        }
        .fengxiang{
            background:#7b4397;
        }
    </style>
</head>
<body>
<div class="index-content">
    <header class="index-header white">
        <div class="f-lex al-center">
            <h5 class="f-40" id="airName">XX空调</h5>
        </div>
    </header>
    <div class="btn-nav">
        <div class="temp-nav">
            <button class="up-btn" onclick="op('up');">升高1度</button>
            <button class="down-btn" onclick="op('down');">降低1度</button>
        </div>
        <div class="mode-nav">
            <button class="cold" onclick="op('cold');">制冷</button>
            <button class="hot" onclick="op('hot');">制热</button>
            <button class="chushi" onclick="op('chushi');">除湿</button>
        </div>
        <div class="func-nav">
            <button class="fengsu" onclick="op('fengsu');">风速</button>
            <button class="fengxiang" onclick="op('fengxiang');">风向</button>
        </div>
    </div>
</div>
<div class="footer fl-ar bg-black">
    <a href="/page/home">
        <img src="/images/icon/home_a_icon.png" alt="">
        <p >首页</p>
    </a>
</div>
<input type="hidden" value="${airId}" id="airId">
</body>
<script type="text/javascript" src="../js/jquery.js"></script>
<script>
    $(function () {
        initAir();
    })

    function initAir() {
        var airId = $('#airId').val();
        $.ajax({
            url: '/air/findByAirId',
            data:{
                airId:airId
            },
            dataType: 'json',
            success: function (res) {
                if (res.success) {
                    $('#airName').html(res.data.name);
                }
            }
        })
    }

    function op(mode){
        var airId = $('#airId').val()
        $.ajax({
            url: '/air/op',
            data:{
                airId:airId,
                mode:mode
            },
            dataType: 'json',
            success: function (res) {
                if (res.success) {
                    console.log('操作成功');
                }else{
                    alert(res.msg)
                }
            }
        })
    }

</script>
</html>