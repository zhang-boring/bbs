<html>
<head>
    <title>login page</title>
    <#include "common/header.ftl">
    <script language="JavaScript">
        function getObj(id) {
            return document.getElementById(id);
        }
        function IsElement(id) {
            return document.getElementById(id) != null ? true : false;
        }
    </script>
    <style>
        .t{border:1px solid #dddddd;margin:0 auto 8px; height:auto; overflow:hidden;}
        .h{
            border-bottom:1px solid #bbbbbb;
            background:url(/img/bg/bg-tb.gif) repeat-x #dddddd;
            text-align:left;color:#333333;
            padding:2px .5em 0; line-height:200%;
        }
        .input{
            border: 1px solid; border-color:#dddddd;padding:2px 0px 2px 1px;
            font-size:1.0em;vertical-align:middle;color:#000;
        }
        .btn{
            color:#fff;font-weight:700;border-width:1px;padding-left:15px;
            background:url(/img/bg/bg-btn.gif) repeat-x #bbbbbb;
            padding-right:15px;vertical-align:middle;border:1px solid #dddddd;
        }
        #main{width:920px;margin: auto; padding:1px 0 0; background: white;}
        /*通用公告框*/
        #gonggao{
            border:1px solid #dddddd;margin:10px 0;overflow:hidden;
            height:26px; padding:0 1em 0 0;line-height:26px;
            *line-height:26px;font-weight:bold;
            background:url(/img/bg/body-bg.png) 0 repeat-x #f8f8f8;
        }
        #gonggao .gonggao-item{
            overflow:hidden; height:26px; padding:0 1.3em 0 1.3em;
            background:url("/img/bg/bg-gonggao.gif") right top no-repeat;
            float:left; position:relative ; margin-right:-7px;
        }
        #gonggao .gonggao-item .strong{*line-height:26px;_line-height:26px;}
        #gonggao .gonggao-item i { position:absolute; height:26px; width:7px; left:0px; top:0}
        #gonggao .gonggao-item:hover{ text-decoration:none;font-weight:bold}
    </style>
</head>
<body>
<div style="height: auto;width: 920px;margin:auto;">
    <div id="gonggao">
        <#--TODO-->
        <a class="gonggao-item" href="/index">
            <strong class="strong">游玩 G&P</strong>
        </a>
        <a class="gonggao-item">
            <strong class="strong">登录页</strong>
        </a>
        <div style="clear: both;"></div>
    </div>
    <div id="main" style="border: 0px;border-top: 0px;height: auto;">
        <form action="/user/login" method="post" name="login">
            <div class="t" style="background:#ffffff;">
                <table width="100%" cellspacing="0" cellpadding="0" align="center" class="t">
                    <tbody>
                    <tr style="height: 27px;">
                        <th class="h" style="font-weight: normal;font-size: 13px;text-align: right;padding-top: 0px;border: 0px;">登录</th>
                        <th class="h" style="padding-top: 0px;border: 0px;">&nbsp;</th>
                    </tr>
                    <tr style="height: 40px;font-size: 12px;">
                        <#--TODO-->
                        <th width="30%" style="text-align: right;font-weight: normal;">
                            <input type="radio" name="logintype" value="0" checked>
                            <span id="login_0" style="font-size: 12px">用户名</span>
                            <input type="radio" name="logintype" value="1">
                            <span id="login_1" style="font-size: 12px">UID</span>
                            <input type="radio" name="logintype" value="2">
                            <span id="login_2" style="font-size: 12px">Email</span>
                        </th>
                        <td style="padding-left: 36px;">
                            <input class="input gray" type="text" maxlength="20"
                                   name="usercheck" size="40"
                                   style="font-size: 12px;color: gray; margin-right: 4px;">
                            <#--TODO-->
                            <a href="/register">马上注册</a>
                        </td>
                    </tr>
                    <tr style="height: 40px;font-size: 12px;">
                    <th style="text-align: right;font-weight: normal;font-size: 12px;">密&nbsp;&nbsp;码</th>
                        <td style="padding-left: 36px;">
                        <input class="input" type="password" maxlength="20"
                                   name="password" size="40"
                                   style="font-size: 12px;color: gray; margin-right: 4px;">
                            <#--TODO-->
                            <a href="/retrievepw">忘记密码</a>
                        </td>
                    </tr>
                    <tr style="height: 40px;font-size: 12px;">
                        <th style="text-align: right;font-weight: normal;font-size: 12px;">隐身登陆</th>
                        <td style="padding-left: 36px;">
                            <input type="radio" name="hideid" value="0" checked>否
                            <input type="radio" name="hideid" value="1">是
                        </td>
                    </tr>
                    <tr style="height: 40px;">
                        <th></th>
                        <td style="padding-left: 36px;">
                            <input class="btn" type="submit" name="submit" value="登 录" style="width:80px;">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

        </form>
    </div>
    <div style="clear: both;"></div>
</div>
</body>
<#include "common/footer.ftl">
</html>