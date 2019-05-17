<html>
<head>
    <title>register page</title>
    <#include "common/header.ftl">
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="/js/register.js"></script>
    <script language="JavaScript">
        function getObj(id) {
            return document.getElementById(id);
        }
        function IsElement(id) {
            return document.getElementById(id) != null ? true : false;
        }
        //验证码检查
        function checkyzm() {
            //用户输入的验证码
            var yzminput = document.getElementById("vcode").value;
            var yzm = '${Session.imagecode}';
            //验证码提示信息
            var checkyzm = document.getElementById("checkyzm");
            //判断空值
            if (yzminput == "") {
                checkyzm.innerHTML = "&nbsp;请填写验证码。";
                checkyzm.style.border = "1px solid red";
                checkyzm.style.backgroundColor = "rgba(255,0,0,0.25)";
                return false;
            }
            //忽略大小写进行比较
            if (yzminput.toLowerCase() == yzm.toLowerCase()) {
                checkyzm.innerHTML = "&nbsp;验证码正确。";
                checkyzm.style.border = "1px solid green";
                checkyzm.style.backgroundColor = "rgba(0,255,0,0.25)";
                return true;
            } else {
                checkyzm.innerHTML = "&nbsp;验证码错误。";
                checkyzm.style.border = "1px solid red";
                checkyzm.style.backgroundColor = "rgba(255,0,0,0.25)";
                return false;
            }
        }
        //验证码图片显示隐藏
        function hideImage() {
            //验证码图片div元素
            var imagediv = document.getElementById("image");
            //填写验证码的文本框，图片在文本框正上方显示
            var dianji = document.getElementById("vcode").getBoundingClientRect();
            //图片左上角坐标
            imagediv.style.top = dianji.y - 53;
            imagediv.style.left = dianji.x;
            //设置显示或隐藏
            if (imagediv.style.display == 'none') {
                imagediv.style.display = 'block';
            } else {
                imagediv.style.display = 'none';
            }
        }
        function hsimage() {
            var imagediv = document.getElementById("image");
            if (imagediv.style.display == 'block') {
                imagediv.style.display = 'none';
            }
            checkyzm();
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
        .menu{position: absolute;background: #fff;border: 1px solid #bbbbbb;}
    </style>
</head>
<body>
<div class="menu" id="image" style="opacity: 0.95;left: 371px;top: 159px;z-index: 3000;visibility: visible;display: none;">
    <#if imagebase64??>
        <img src="data:image/jpg;base64,${imagebase64}" style="vertical-align: middle;">
    </#if>
</div>
<div style="height: auto;width: 920px;margin:auto;">
    <div id="gonggao">
        <a class="gonggao-item" href="/index">
            <strong class="strong">游玩 G&P</strong>
        </a>
        <a class="gonggao-item">
            <strong class="strong">注册页</strong>
        </a>
        <div style="clear: both;"></div>
    </div>
    <div id="main" style="border: 0px;border-top: 0px;height: auto;">
        <form action="/user/register" method="post" name="register" id="register" onsubmit="return checkInfo();">
            <div class="t" style="background:#ffffff;">
                <table width="100%" cellspacing="0" cellpadding="0" align="center" class="t">
                    <tbody>
                    <tr style="height: 27px;">
                        <th class="h" style="font-weight: normal;font-size: 13px;text-align: right;padding-top: 0px;border: 0px;">
                            填写信息(<font color="red">*</font>为必填)
                        </th>
                        <th class="h" style="padding-top: 0px;border: 0px;">&nbsp;</th>
                    </tr>
                    <tr style="height: 40px;font-size: 12px;">
                        <th width="30%" style="text-align: right;font-weight: normal;">
                            验证码<font color="red">*</font>
                        </th>
                        <td style="padding-left: 36px;">
                            <input class="input" type="text" id="vcode" size="6" onblur="hsimage()">
                            <font id="yzmts" onclick="hideImage()">&nbsp;点击显示验证码</font>
                            <span id="checkyzm"></span>
                        </td>
                    </tr>
                    <tr style="height: 40px;font-size: 12px;">
                        <th width="30%" style="text-align: right;font-weight: normal;">
                            用户名<font color="red">*</font>
                        </th>
                        <td style="padding-left: 36px;">
                            <input class="input" type="text" size="20" maxlength="15" name="uname" id="uname">
                            <font id="checkyhm">&nbsp;可以包含中文和特殊字符，不能有空格，区分大小写</font>
                            <script language="JavaScript">
                                $('#uname').blur(function () {
                                    var uname = $(this).val();
                                    if (uname != "" && checkuname()) {
                                        $.ajax({
                                            url:"/user/unameajax",
                                            contentType: "application/json;charset=utf-8",
                                            dataType:"json",
                                            data:uname,
                                            type:"POST",
                                            success:function(data) {
                                                //解决ajax回调函数alert(data)为Object object问题，解析返回数据为json字符串
                                                var json = JSON.parse(JSON.stringify(data));
                                                console.log(json);
                                                if (json.msg=="1") {
                                                    $('#checkyhm').css("border", "1px solid green");
                                                    $('#checkyhm').css("background-color", "rgba(0,255,0,0.25)");
                                                    $('#checkyhm').html("用户名可使用");
                                                } else {
                                                    $('#checkyhm').css("border", "1px solid red");
                                                    $('#checkyhm').css("background-color", "rgba(255,0,0,0.25)");
                                                    $('#checkyhm').html("用户名已注册");
                                                }
                                            }
                                        })
                                    }
                                });
                            </script>
                        </td>
                    </tr>
                    <tr style="height: 40px;font-size: 12px;">
                        <th width="30%" style="text-align: right;font-weight: normal;">
                            密&nbsp;&nbsp;码<font color="red">*</font>
                        </th>
                        <td style="padding-left: 36px;">
                            <input class="input" type="password" size="20" maxlength="16" name="password" id="password" onblur="checkpswd()">
                            <font id="checkmm">&nbsp;请输入密码，密码格式为：数字、密码、下划线</font>
                        </td>
                    </tr>
                    <tr style="height: 40px;font-size: 12px;">
                        <th width="30%" style="text-align: right;font-weight: normal;">
                            确认密码<font color="red">*</font>
                        </th>
                        <td style="padding-left: 36px;">
                            <input class="input" type="password" size="20" maxlength="16" id="repassword" onblur="checkrepswd()">
                            <font id="repwts">&nbsp;请再次输入密码</font>
                        </td>
                    </tr>
                    <tr style="height: 40px;font-size: 12px;">
                        <th width="30%" style="text-align: right;font-weight: normal;">
                            Email<font color="red">*</font>
                        </th>
                        <td style="padding-left: 36px;">
                            <input class="input" type="text" name="email" size="20" maxlength="32" id="email" onblur="checkemail()">
                            <font id="emailts">&nbsp;请输入邮箱，找回密码用。</font>
                            <script language="JavaScript">
                                $('#email').blur(function () {
                                    var email = $(this).val();
                                    if (email != "" && checkemail()) {
                                        $.ajax({
                                            url:"/user/emailajax",
                                            contentType: "application/json;charset=utf-8",
                                            dataType:"json",
                                            data:email,
                                            type:"POST",
                                            success:function(data) {
                                                //解决ajax回调函数alert(data)为Object object问题，解析返回数据为json字符串
                                                var json = JSON.parse(JSON.stringify(data));
                                                console.log(json);
                                                if (json.msg=="1") {
                                                    $('#emailts').css("border", "1px solid green");
                                                    $('#emailts').css("background-color", "rgba(0,255,0,0.25)");
                                                    $('#emailts').html("该邮箱可使用");
                                                } else {
                                                    $('#emailts').css("border", "1px solid red");
                                                    $('#emailts').css("background-color", "rgba(255,0,0,0.25)");
                                                    $('#emailts').html("该邮箱已注册");
                                                }
                                            }
                                        })
                                    }
                                })
                            </script>
                        </td>
                    </tr>
                    <tr style="height: 40px;font-size: 12px;">
                        <th width="30%" style="text-align: right;font-weight: normal;">
                            性别
                        </th>
                        <td style="padding-left: 36px;">
                            <div style="margin-top: 10px;">
                                <input type="radio" name="gender" value="0" checked>保密&nbsp;
                                <input type="radio" name="gender" value="1">男&nbsp;&nbsp;
                                <input type="radio" name="gender" value="2">女
                            </div>
                        </td>
                    </tr>
                    <tr style="height: 40px;font-size: 12px;">
                        <th width="30%" style="text-align: right;font-weight: normal;">
                            手机号
                        </th>
                        <td style="padding-left: 36px;">
                            <input class="input" type="text" name="phone" size="20" id="phone" onblur="checkphone()">
                            <font id="phonets"></font>

                        </td>
                    </tr>
                    <tr style="height: 40px;font-size: 12px;">
                        <th width="30%" style="text-align: right;font-weight: normal;">
                            个性签名
                        </th>
                        <td style="padding-left: 36px;">
                            <textarea cols="50" name="signature" rows="4"></textarea>
                        </td>
                    </tr>
                    <tr style="height: 40px;font-size: 12px;">
                        <th width="30%" style="text-align: right;font-weight: normal;">
                            选择头像
                        </th>
                        <td style="padding-left: 36px;">
                            <div style="margin-top: 10px;">
                                <input type="radio" name="icon" value="1" checked>
                                <img src="/img/head/1.gif">&nbsp;&nbsp;
                                <input type="radio" name="icon" value="2">
                                <img src="/img/head/2.gif">&nbsp;&nbsp;
                                <input type="radio" name="icon" value="3">
                                <img src="/img/head/3.gif">&nbsp;&nbsp;
                                <input type="radio" name="icon" value="4">
                                <img src="/img/head/4.gif">&nbsp;&nbsp;
                                <input type="radio" name="icon" value="5">
                                <img src="/img/head/5.gif">
                            </div>
                        </td>
                    </tr>
                    <tr style="height: 40px;font-size: 12px;">
                        <th width="30%" style="text-align: right;font-weight: normal;">
                            生日
                        </th>
                        <td style="padding-left: 36px;">
                            <input type="date" name="birthday" class="input">
                        </td>
                    </tr>
                    <tr style="height: 40px;font-size: 12px;">
                        <th width="30%" style="text-align: right;font-weight: normal;">
                        </th>
                        <td style="padding-left: 36px;">
                            <input class="btn" type="submit" value="提 交">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </form>
    </div>
    <script language="JavaScript">
        <#--//手机号检查-->
        <#--function checkphone() {-->
            <#--//手机号正则及输入的手机号-->
            <#--var reg = /^1[3|5|7|8][0-9]\d{4,8}$/;-->
            <#--var phone = document.getElementById("phone").value;-->
            <#--//手机号提示信息-->
            <#--var phonets = document.getElementById("phonets");-->
            <#--//手机号为空，则不做判断-->
            <#--if (phone == "") {-->
                <#--phonets.innerHTML = "";-->
                <#--phonets.style.border = "";-->
                <#--phonets.style.backgroundColor = "";-->
                <#--return true;-->
            <#--}-->
            <#--//验证手机号格式-->
            <#--if (!reg.exec(phone)) {-->
                <#--phonets.innerHTML = "&nbsp;手机号格式错误。";-->
                <#--phonets.style.border = "1px solid red";-->
                <#--phonets.style.backgroundColor = "rgba(255,0,0,0.25)";-->
                <#--return false;-->
            <#--} else {-->
                <#--phonets.innerHTML = "&nbsp;手机号格式正确。";-->
                <#--phonets.style.border = "1px solid green";-->
                <#--phonets.style.backgroundColor = "rgba(0,255,0,0.25)";-->
                <#--return true;-->
            <#--}-->
        <#--}-->
        <#--//用户名检查-->
        <#--function checkuname() {-->
            <#--//输入的用户名去空格-->
            <#--var input = document.getElementById("uname").value.toString().replace(/\s+/g,"");-->
            <#--//用户名格式提示信息-->
            <#--var unamets = document.getElementById("checkyhm");-->
            <#--//用户名判断空-->
            <#--if (input == "") {-->
                <#--unamets.innerHTML = "&nbsp;请填写用户名。";-->
                <#--unamets.style.border = "1px solid red";-->
                <#--unamets.style.backgroundColor = "rgba(255,0,0,0.25)";-->
                <#--return false;-->
            <#--}-->
            <#--//判断用户名长度-->
            <#--if (input.length > 8 || input.length < 3) {-->
                <#--unamets.innerHTML = "&nbsp;用户名格式错误。";-->
                <#--unamets.style.border = "1px solid red";-->
                <#--unamets.style.backgroundColor = "rgba(255,0,0,0.25)";-->
                <#--return false;-->
            <#--}  else {-->
                <#--// unamets.innerHTML = "&nbsp;用户名格式正确。";-->
                <#--// unamets.style.border = "1px solid green";-->
                <#--// unamets.style.backgroundColor = "rgba(0,255,0,0.25)";-->
                <#--return true;-->
            <#--}-->
        <#--}-->
        <#--//验证码检查-->
        <#--function checkyzm() {-->
            <#--//用户输入的验证码-->
            <#--var yzminput = document.getElementById("vcode").value;-->
            <#--var yzm = '${Session.imagecode}';-->
            <#--//验证码提示信息-->
            <#--var checkyzm = document.getElementById("checkyzm");-->
            <#--//判断空值-->
            <#--if (yzminput == "") {-->
                <#--checkyzm.innerHTML = "&nbsp;请填写验证码。";-->
                <#--checkyzm.style.border = "1px solid red";-->
                <#--checkyzm.style.backgroundColor = "rgba(255,0,0,0.25)";-->
                <#--return false;-->
            <#--}-->
            <#--//忽略大小写进行比较-->
            <#--if (yzminput.toLowerCase() == yzm.toLowerCase()) {-->
                <#--checkyzm.innerHTML = "&nbsp;验证码正确。";-->
                <#--checkyzm.style.border = "1px solid green";-->
                <#--checkyzm.style.backgroundColor = "rgba(0,255,0,0.25)";-->
                <#--return true;-->
            <#--} else {-->
                <#--checkyzm.innerHTML = "&nbsp;验证码错误。";-->
                <#--checkyzm.style.border = "1px solid red";-->
                <#--checkyzm.style.backgroundColor = "rgba(255,0,0,0.25)";-->
                <#--return false;-->
            <#--}-->
        <#--}-->
        <#--//验证码图片显示隐藏 -->
        <#--function hideImage() {-->
            <#--//验证码图片div元素-->
            <#--var imagediv = document.getElementById("image");-->
            <#--//填写验证码的文本框，图片在文本框正上方显示-->
            <#--var dianji = document.getElementById("vcode").getBoundingClientRect();-->
            <#--//图片左上角坐标-->
            <#--imagediv.style.top = dianji.y - 53;-->
            <#--imagediv.style.left = dianji.x;-->
            <#--//设置显示或隐藏-->
            <#--if (imagediv.style.display == 'none') {-->
                <#--imagediv.style.display = 'block';-->
            <#--} else {-->
                <#--imagediv.style.display = 'none';-->
            <#--}-->
        <#--}-->
        <#--function hsimage() {-->
            <#--var imagediv = document.getElementById("image");-->
            <#--if (imagediv.style.display == 'block') {-->
                <#--imagediv.style.display = 'none';-->
            <#--}-->
            <#--checkyzm();-->
        <#--}-->
        <#--//密码验证及强度判断-->
        <#--function checkpswd() {-->
            <#--//密码格式匹配正则式-->
            <#--var isPassword = /^(\w){6,15}$/;-->
            <#--//输入密码框-->
            <#--var pwInput = document.getElementById("password").value;-->
            <#--//输入密码后提示信息框-->
            <#--var mmts = document.getElementById("checkmm");-->
            <#--//判断密码格式-->
            <#--if (!isPassword.exec(pwInput)) {-->
                <#--mmts.innerHTML = "&nbsp;密码格式错误。";-->
                <#--mmts.style.border = "1px solid red";-->
                <#--mmts.style.backgroundColor = "rgba(255,0,0,0.25)";-->
                <#--return false;-->
            <#--}-->
            <#--//密码格式验证通过，判断密码强度-->
            <#--else {-->
                <#--//密码强度简单，仅有一种类型字符-->
                <#--var easy = /^(?:\d+|[a-zA-Z]+|[_]+)$/;-->
                <#--//密码强度一般，由两种类型组成-->
                <#--var normal = /^([a-zA-Z0-9]+|[a-zA-Z_]+|[0-9_]+)$/;-->
                <#--//密码强度困难，由多类型字符组成-->
                <#--var hard = /^([a-zA-Z0-9_]+)$/;-->
                <#--if (easy.exec(pwInput)) {-->
                    <#--mmts.innerHTML = "&nbsp;密码格式正确，强度：<font color=red>弱</font>。";-->
                    <#--mmts.style.border = "1px solid green";-->
                    <#--mmts.style.backgroundColor = "rgba(0,255,0,0.25)";-->
                <#--} else if (normal.exec(pwInput)) {-->
                    <#--mmts.innerHTML = "&nbsp;密码格式正确，强度：<font color='#ffa500'>中</font>。";-->
                    <#--mmts.style.border = "1px solid green";-->
                    <#--mmts.style.backgroundColor = "rgba(0,255,0,0.25)";-->
                <#--} else if (hard.exec(pwInput)) {-->
                    <#--mmts.innerHTML = "&nbsp;密码格式正确，强度：<font color=blue>强</font>。";-->
                    <#--mmts.style.border = "1px solid green";-->
                    <#--mmts.style.backgroundColor = "rgba(0,255,0,0.25)";-->
                <#--}-->
                <#--return true;-->
            <#--}-->
        <#--}-->
        <#--//确认密码检查-->
        <#--function checkrepswd() {-->
            <#--//用户密码框输入的密码-->
            <#--var pswd = document.getElementById("password").value;-->
            <#--//用户确认框输入的密码-->
            <#--var repw = document.getElementById("repassword").value;-->
            <#--//确认密码提示信息-->
            <#--var repwts = document.getElementById("repwts");-->
            <#--//判断密码框是否为空-->
            <#--if (pswd == "") {-->
                <#--return false;-->
            <#--}-->
            <#--if (pswd == repw) {-->
                <#--repwts.innerHTML = "&nbsp;输入密码一致。"-->
                <#--repwts.style.border = "1px solid green";-->
                <#--repwts.style.backgroundColor = "rgba(0,255,0,0.25)";-->
                <#--return true;-->
            <#--} else {-->
                <#--repwts.innerHTML = "&nbsp;输入密码不一致。"-->
                <#--repwts.style.border = "1px solid red";-->
                <#--repwts.style.backgroundColor = "rgba(255,0,0,0.25)";-->
                <#--return false;-->
            <#--}-->
        <#--}-->
        <#--//邮箱格式验证-->
        <#--function checkemail() {-->
            <#--//输入框及提示框-->
            <#--var emailInput = document.getElementById("email").value;-->
            <#--var emailts = document.getElementById("emailts");-->
            <#--//邮箱格式正则表达式-->
            <#--var reg = /^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;-->
            <#--if (emailInput == "") {-->
                <#--emailts.innerHTML = "&nbsp;请输入邮箱。"-->
                <#--emailts.style.border = "1px solid red";-->
                <#--emailts.style.backgroundColor = "rgba(255,0,0,0.25)";-->
                <#--return false;-->
            <#--}-->
            <#--if (reg.exec(emailInput)) {-->
                <#--// emailts.innerHTML = "&nbsp;邮箱格式正确。"-->
                <#--// emailts.style.border = "1px solid green";-->
                <#--// emailts.style.backgroundColor = "rgba(0,255,0,0.25)";-->
                <#--return true;-->
            <#--} else {-->
                <#--emailts.innerHTML = "&nbsp;邮箱格式错误。"-->
                <#--emailts.style.border = "1px solid red";-->
                <#--emailts.style.backgroundColor = "rgba(255,0,0,0.25)";-->
                <#--return false;-->
            <#--}-->
        <#--}-->
        <#--//提交时检查数据-->
        <#--function checkInfo() {-->
            <#--var checkyzm = document.getElementById("checkyzm");-->
            <#--var checkyhm = document.getElementById("checkyhm");-->
            <#--var checkmm = document.getElementById("checkmm");-->
            <#--var repwts = document.getElementById("repwts");-->
            <#--var emailts = document.getElementById("emailts");-->
            <#--var phonets = document.getElementById("phonets");-->
            <#--if (checkpswd() & checkemail() & checkphone() &-->
                <#--checkrepswd() & checkuname()) {-->
                <#--document.getElementById("register").submit();-->
                <#--return true;-->
            <#--} else {-->
                <#--return false;-->
            <#--}-->
        <#--}-->
        </script>
    <div style="clear: both;"></div>
</div>
</body>
<#include "common/footer.ftl">
</html>