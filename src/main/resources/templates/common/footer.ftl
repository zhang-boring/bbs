<html>
<head>
    <#--<link href="../../static/css/css.css" rel="stylesheet" type="text/css">-->
    <style>
        #footer{width:920px;margin: auto;border-top:1px solid #dddddd;background: #f8f8f8;}  /*底部*/
        .footer{width:920px;text-align:right;margin:auto;padding:.8em 0 .3em;}
        .gray{color:#888888;}
    </style>
</head>
<body>
<div id="footer">
    <div class="footer">
        <center class="gray">
            <div style="font-size: 11px;">
                Designed by ZhangBaoyun.Time now is:<span id="time"></span>
                <br>
                Code ©2018-2019
            </div>
        </center>
    </div>
</div>
<script language="JavaScript">
    var timeObj = document.getElementById("time");
    var date = new Date();
    var time = num(date.getMonth()+1) + "-" +
        num(date.getDate()) + " " + num(date.getHours()) + ":"
        + num(date.getMinutes());
    timeObj.innerText = time;

    function num(str) {
        var num;
        str>10?num=str:num="0"+str;
        return num;
    }
</script>
</body>
</html>