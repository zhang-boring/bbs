<#--<#if errorinfo??>-->
<#--    ${errorinfo}-->
<#--</#if>-->


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>
        错误提示
    </title>
    <script language="JavaScript">
        var t = 2;
        setInterval("refer()", 1000);

        function refer() {
            if (t == 0) {
                location = "/index";
            } else {
                document.getElementById("time").innerHTML = t;
                t--;
            }
        }
    </script>

</head>
<#--<#include "common/header.ftl">-->
<body>
<div style="text-align: center;position:absolute;left: 17%;top: 35%;height: 100px;width: 66%;border: 1px solid #333333;font-size: 11px;">
    <div style="margin-top: 15px;">游玩 G&P >> 提示信息</div>
    <div style="margin-top: 10px;color: gray;">
        操作出错<#if errorinfo??>
            ：${errorinfo}
        </#if>,
        <font id="time">3</font>s后返回首页
    </div>
    <div style="margin-top: 10px">
        <a href="/index" style="color: black">如果没有自动跳转，请点击此处立即跳转</a>
    </div>
</div>
</body>
</html>