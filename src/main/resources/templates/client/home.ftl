<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta charset="UTF-8">
    <title>首页</title>
    <link rel="stylesheet" href="/css/index.css">
</head>
<body>
<div class="index-content">
    <header class="index-header white">
        <div class="f-lex al-center">
            <h5 class="f-40">智能之家</h5>
            <img class="down-icon ml-12" src="/images/icon/down_2_icon.png" alt="">
        </div>
        <p class="f-26 show-btn mt-12"><span id="airNum">12</span>台设备</p>
        <button class="add-btn">
            <img src="/images/icon/add_icon.png" alt="">
        </button>
    </header>
    <nav class="index-nav f-28 c-gray f-weight" id="roomList">
        <p class="nav-active">全部</p>
        <p>卧室</p>
        <p>2号卧室</p>
        <p>厨房</p>
        <p>客厅</p>
        <p>卫生间</p>
    </nav>
    <div class="f-lex fl-wrap block-list" id="airList">

    </div>
    <div class="f-lex fl-wrap block-list">
        <div class="block-icon">
            <div class="f-lex f-weight j-s-b">
                <p class="f-28 black-1">环境检测</p>
                <p class="f-24 gray-90">客厅</p>
            </div>
            <div class="f-lex j-s-b al-center mt-40">
                <img class="source-1" src="/images/source/furnishing_1.png" alt="">
                <div class="f-weight">
                    <p class="f-50">52 <span class="blue-1 f-26">良</span></p>
                    <p class="f-24 gray-90">PM2.5/1h</p>
                </div>
            </div>
        </div>
        <div class="block-icon">
            <div class="f-lex f-weight j-s-b">
                <p class="f-28 black-1">智能插座</p>
                <p class="f-24 gray-90">厨房</p>
            </div>
            <div class="f-lex j-s-b al-center mt-40">
                <img class="source-2" src="/images/source/furnishing_2.png" alt="">
                <div class="close-btn">
                    <img src="/images/icon/close_2_icon.png" alt="">
                </div>
            </div>
        </div>
        <div class="block-icon">
            <div class="f-lex f-weight j-s-b">
                <p class="f-28 black-1">洗衣机</p>
                <p class="f-24 gray-90">卫生间</p>
            </div>
            <div class="f-lex j-s-b al-center mt-40">
                <img class="source-3" src="/images/source/furnishing_3.png" alt="">
                <div class="f-weight">
                    <div class="close-btn">
                        <img src="/images/icon/close_2_icon.png" alt="">
                    </div>
                </div>
            </div>
        </div>
        <div class="block-icon">
            <div class="f-lex f-weight j-s-b">
                <p class="f-28 black-1">智能电视</p>
                <p class="f-24 gray-90">客厅</p>
            </div>
            <div class="f-lex j-s-b al-center mt-40">
                <img class="source-4" src="/images/source/furnishing_4.png" alt="">
                <div class="f-weight">
                    <div class="close-btn">
                        <img src="/images/icon/close_2_icon.png" alt="">
                    </div>
                </div>
            </div>
        </div>
        <div class="block-icon">
            <div class="f-lex f-weight j-s-b">
                <p class="f-28 black-1">台灯</p>
                <p class="f-24 gray-90">卧室</p>
            </div>
            <div class="f-lex j-s-b al-center mt-40">
                <img class="source-5" src="/images/source/furnishing_5.png" alt="">
                <div class="f-weight">
                    <div class="close-btn">
                        <img src="/images/icon/close_2_icon.png" alt="">
                    </div>
                </div>
            </div>
        </div>
        <div class="block-icon">
            <div class="f-lex f-weight j-s-b">
                <p class="f-28 black-1">微波炉</p>
                <p class="f-24 gray-90">厨房</p>
            </div>
            <div class="f-lex j-s-b al-center mt-40">
                <img class="source-6" src="/images/source/furnishing_6.png" alt="">
                <div class="f-weight">
                    <div class="close-btn is-open">
                        <img src="/images/icon/close_1_icon.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer fl-ar bg-black">
    <a>
        <img src="/images/icon/home_a_icon.png" alt="">
        <p class="blue-1">首页</p>
    </a>
</div>
</body>
<script type="text/javascript" src="../js/jquery.js"></script>
<script>
    $(function () {
        findAllRoom();
        initNum();
    })

    $('#roomList').on('click','p',function () {
        var roomId = $(this).data('id');
        $('#roomList p').removeClass('nav-active');
        $(this).addClass('nav-active');
        $.ajax({
            url: '/air/findById',
            data:{
                roomId:roomId
            },
            dataType: 'json',
            success: function (res) {
                if (res.success) {
                    var html = '';
                    $.each(res.data,function (i,r) {
                        html+='<div class="block-icon" onclick="location.href=\'/page/equipment?airId='+r.id+'\'">\n' +
                                '            <div class="f-lex f-weight j-s-b">\n' +
                                '                <p class="f-28 black-1">'+r.name+'</p>\n' +
                                '                <p class="f-24 gray-90">'+r.room.name+'</p>\n' +
                                '            </div>\n' +
                                '            <div class="f-lex j-s-b al-center mt-40">\n' +
                                '                <img class="source-5" src="/images/icon/air.jpg" alt="">\n' +
                                '                <div class="f-weight">\n' +
                                '                    <div class="close-btn">\n' +
                                '                        <img src="/images/icon/close_2_icon.png" alt="">\n' +
                                '                    </div>\n' +
                                '                </div>\n' +
                                '            </div>\n' +
                                '        </div>';
                    })
                    $('#airList').html(html);
                }
            }
        })
    })

    function findAllRoom() {
        $.ajax({
            url: '/room/getAll',
            dataType: 'json',
            success: function (res) {
                if (res.success) {
                    var html = '<p class="nav-active" data-id="0">全部</p>';
                    $.each(res.data,function (i, r) {
                        html+='<p data-id="'+r.id+'">'+r.name+'</p>';
                    })
                    $('#roomList').html(html);
                    $('#roomList p:first-child').click();
                }
            }
        })
    }

    function initNum(){
        $.ajax({
            url: '/air/findAll',
            dataType: 'json',
            success: function (res) {
                if (res.success) {
                   $('#airNum').html(res.data.length);
                }
            }
        })
    }
</script>
</html>