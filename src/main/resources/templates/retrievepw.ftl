<html>
<head>
    <title>找回密码页</title>
    <#include "common/header.ftl">
    <script language="JavaScript">
        function getObj(id) {
            return document.getElementById(id);
        }
        function IsElement(id) {
            return document.getElementById(id) != null ? true : false;
        }
        //邮箱格式验证
        function checkemail() {
            //输入框及提示框
            var emailInput = document.getElementById("email").value;
            var emailts = document.getElementById("emailts");
            //邮箱格式正则表达式
            var reg = /^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;
            if (emailInput == "") {
                emailts.innerHTML = "&nbsp;请输入邮箱。"
                emailts.style.border = "1px solid red";
                emailts.style.backgroundColor = "rgba(255,0,0,0.25)";
                return false;
            }
            if (reg.exec(emailInput)) {
                emailts.innerHTML = "&nbsp;邮箱格式正确。"
                emailts.style.border = "1px solid green";
                emailts.style.backgroundColor = "rgba(0,255,0,0.25)";
                return true;
            } else {
                emailts.innerHTML = "&nbsp;邮箱格式错误。"
                emailts.style.border = "1px solid red";
                emailts.style.backgroundColor = "rgba(255,0,0,0.25)";
                return false;
            }
        }
        //用户名检查
        function checkuname() {
            //输入的用户名去空格
            var input = document.getElementById("uname").value.toString().replace(/\s+/g,"");
            //用户名格式提示信息
            var unamets = document.getElementById("checkyhm");
            //用户名判断空
            if (input == "") {
                unamets.innerHTML = "&nbsp;请填写用户名。";
                unamets.style.border = "1px solid red";
                unamets.style.backgroundColor = "rgba(255,0,0,0.25)";
                return false;
            }
            //判断用户名长度
            if (input.length > 8 || input.length < 3) {
                unamets.innerHTML = "&nbsp;用户名格式错误。";
                unamets.style.border = "1px solid red";
                unamets.style.backgroundColor = "rgba(255,0,0,0.25)";
                return false;
            }  else {
                unamets.innerHTML = "&nbsp;用户名格式正确。";
                unamets.style.border = "1px solid green";
                unamets.style.backgroundColor = "rgba(0,255,0,0.25)";
                return true;
            }
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
            <strong class="strong">找回密码</strong>
        </a>
        <div style="clear: both;"></div>
    </div>
    <div id="main" style="border: 0px;border-top: 0px;height: auto;">
        <form action="/user/repw" method="get">
            <div class="t" style="background:#ffffff;">
                <table width="100%" cellspacing="0" cellpadding="0" align="center" class="t">
                    <tbody>
                    <tr style="height: 27px;">
                        <th class="h" style="font-weight: normal;font-size: 13px;text-align: right;padding-top: 0px;border: 0px;">找回密码程序</th>
                        <th class="h" style="padding-top: 0px;border: 0px;">&nbsp;</th>
                    </tr>
                    <tr style="height: 40px;font-size: 12px;">
                        <th width="30%" style="text-align: right;font-weight: normal;">
                            邮&nbsp;&nbsp;&nbsp;箱
                        </th>
                        <td style="padding-left: 36px;">
                            <input class="input gray" type="text" maxlength="16"
                                   name="email" size="20" onblur="checkemail()" id="email"
                                   style="font-size: 12px;color: gray; margin-right: 4px;">
                            <span id="emailts" style="font-size: 12px;">请输入注册账号时填写的邮箱</span>
                        </td>
                    </tr>
                    <tr style="height: 40px;font-size: 12px;">
                        <th width="30%" style="text-align: right;font-weight: normal;">
                            用户名
                        </th>
                        <td style="padding-left: 36px;">
                            <input class="input gray" type="text" maxlength="16"
                                   name="uname" size="20" onblur="checkuname()" id="uname"
                                   style="font-size: 12px;color: gray; margin-right: 4px;">
                            <span id="checkyhm" style="font-size: 12px;">请输入用户名</span>
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

        </form>
    </div>
    <div style="clear: both;"></div>
</div>
</body>
<#include "common/footer.ftl">
</html>