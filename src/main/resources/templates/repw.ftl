<html>
<head>
    <title>找回密码页</title>
    <#include "common/header.ftl">
    <script language="JavaScript">
        function getObj(id) {
            return document.getElementById(id);
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
        <a class="gonggao-item" href="/index">
            <strong class="strong">游玩 G&P</strong>
        </a>
        <a class="gonggao-item">
            <strong class="strong">修改密码</strong>
        </a>
        <div style="clear: both;"></div>
    </div>
    <div id="main" style="border: 0px;border-top: 0px;height: auto;">
        <form action="/user/mdpw" method="post">
            <div class="t" style="background:#ffffff;">
                <table width="100%" cellspacing="0" cellpadding="0" align="center" class="t">
                    <tbody>
                    <tr style="height: 27px;">
                        <th class="h" style="font-weight: normal;font-size: 13px;text-align: right;padding-top: 0px;border: 0px;">修改密码</th>
                        <th class="h" style="padding-top: 0px;border: 0px;">&nbsp;</th>
                    </tr>
                    <tr style="height: 40px;font-size: 12px;">
                        <th width="30%" style="text-align: right;font-weight: normal;">
                            旧密码
                        </th>
                        <td style="padding-left: 36px;">
                            <input class="input gray" type="password" maxlength="16" onblur="checkpw('oldpw')";
                                   name="oldpw" id="oldpw" size="20" placeholder="当前密码"
                                   style="font-size: 12px;color: gray; margin-right: 4px;">
                            <span id="oldpwts" style="font-size: 12px;">请输入密码</span>
                        </td>
                    </tr>
                    <tr style="height: 40px;font-size: 12px;">
                        <th width="30%" style="text-align: right;font-weight: normal;">
                            新密码
                        </th>
                        <td style="padding-left: 36px;">
                            <input class="input gray" type="password" maxlength="16"
                                   name="newpw" size="20" id="newpw" onblur="checkpswd1('newpw')"
                                   style="font-size: 12px;color: gray; margin-right: 4px;">
                            <span id="newpwts" style="font-size: 12px;">请输入新密码</span>
                        </td>
                    </tr>
                    <tr style="height: 40px;font-size: 12px;">
                        <th width="30%" style="text-align: right;font-weight: normal;">
                            确认密码
                        </th>
                        <td style="padding-left: 36px;">
                            <input class="input gray" type="password" maxlength="16"
                                   name="newpwre" size="20" id="newpwre" onblur="checkrepswd()"
                                   style="font-size: 12px;color: gray; margin-right: 4px;">
                            <span id="newpwrets" style="font-size: 12px;">请重新输入新密码</span>
                        </td>
                    </tr>
                    <tr style="height: 40px;">
                        <th></th>
                        <td style="padding-left: 36px;">
                            <input class="btn" type="submit" value="提 交" style="width:80px;">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <script>
                function checkpswd2() {
                    //密码强度简单，仅有一种类型字符
                    var easy = /^(?:\d+|[a-zA-Z]+|[_]+)$/;
                    //密码强度一般，由两种类型组成
                    var normal = /^([a-zA-Z0-9]+|[a-zA-Z_]+|[0-9_]+)$/;
                    //密码强度困难，由多类型字符组成
                    var hard = /^([a-zA-Z0-9_]+)$/;
                    if (easy.exec(pwInput)) {
                        mmts.innerHTML = "&nbsp;密码格式正确，强度：<font color=red>弱</font>。";
                        mmts.style.border = "1px solid green";
                        mmts.style.backgroundColor = "rgba(0,255,0,0.25)";
                    } else if (normal.exec(pwInput)) {
                        mmts.innerHTML = "&nbsp;密码格式正确，强度：<font color='#ffa500'>中</font>。";
                        mmts.style.border = "1px solid green";
                        mmts.style.backgroundColor = "rgba(0,255,0,0.25)";
                    } else if (hard.exec(pwInput)) {
                        mmts.innerHTML = "&nbsp;密码格式正确，强度：<font color=blue>强</font>。";
                        mmts.style.border = "1px solid green";
                        mmts.style.backgroundColor = "rgba(0,255,0,0.25)";
                    }
                    return true;
                }

                function checkpw(id) {
                    //密码格式匹配正则式
                    var isPassword = /^(\w){5,15}$/;
                    //输入密码框
                    var pwInput = document.getElementById(id).value;
                    //输入密码后提示信息框
                    var mmts = document.getElementById(id + "ts");
                    //判断密码格式
                    if (!isPassword.exec(pwInput)) {
                        mmts.innerHTML = "&nbsp;密码格式错误。";
                        mmts.style.border = "1px solid red";
                        mmts.style.backgroundColor = "rgba(255,0,0,0.25)";
                        return false;
                    }
                }

                //密码验证及强度判断
                function checkpswd1(id) {
                    //密码格式匹配正则式
                    var isPassword = /^(\w){5,15}$/;
                    //输入密码框
                    var pwInput = document.getElementById(id).value;
                    //输入密码后提示信息框
                    var mmts = document.getElementById(id + "ts");
                    //判断密码格式
                    if (!isPassword.exec(pwInput)) {
                        mmts.innerHTML = "&nbsp;密码格式错误。";
                        mmts.style.border = "1px solid red";
                        mmts.style.backgroundColor = "rgba(255,0,0,0.25)";
                        return false;
                    }
                    //密码格式验证通过，判断密码强度
                    else {
                        checkpswd2();
                    }
                }
                //确认密码检查
                function checkrepswd() {
                    //用户密码框输入的密码
                    var pswd = document.getElementById("newpw").value;
                    //用户确认框输入的密码
                    var repw = document.getElementById("newpwre").value;
                    //确认密码提示信息
                    var repwts = document.getElementById("newpwrets");
                    //判断密码框是否为空
                    if (pswd == "") {
                        return false;
                    }
                    if (pswd == repw) {
                        repwts.innerHTML = "&nbsp;输入密码一致。"
                        repwts.style.border = "1px solid green";
                        repwts.style.backgroundColor = "rgba(0,255,0,0.25)";
                        return true;
                    } else {
                        repwts.innerHTML = "&nbsp;输入密码不一致。"
                        repwts.style.border = "1px solid red";
                        repwts.style.backgroundColor = "rgba(255,0,0,0.25)";
                        return false;
                    }
                }
            </script>
        </form>
    </div>
    <div style="clear: both;"></div>
</div>
</body>
<#include "common/footer.ftl">
</html>