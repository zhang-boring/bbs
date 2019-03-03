<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>
        <#if useraction??>
            <#if useraction == "logout">
                登出
            <#elseif useraction == "login">
                登入
            <#elseif useraction == "register">
                注册
            </#if>
        <#else>
            操作
        </#if>
        完成
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
        您已成功
        <#if useraction??>
            <#if useraction == "logout">
                登出
            <#elseif useraction == "login">
                登入
            <#elseif useraction == "register">
                注册
            </#if>
        <#else>
            提交
        </#if>,
        <font id="time">3</font>s后返回首页
    </div>
    <div style="margin-top: 10px">
        <a href="/index" style="color: black">如果没有自动跳转，请点击此处立即跳转</a>
    </div>
</div>
</body>
</html>