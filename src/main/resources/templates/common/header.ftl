<head>
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
    <link href="/css/css.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/header.js"></script>
    <style>
        .btn{
            color:#fff;font-weight:700;border-width:1px;padding-left:15px;
            background:url("/img/bg/bg-btn.gif") repeat-x #bbbbbb;
            padding-right:15px;vertical-align:middle;border:1px solid #dddddd;
        }
    </style>
</head>
<body style="background-image: url('/img/bg/bg.gif');repeat-y;background-position:center center;">
<div id="wrapA">
    <div id="header">
        <table cellspacing="0" cellpadding="0" align="center" width="100%">
            <tbody>
            <tr>
                <td class="banner">
                    <a href="/index" style="float: left;">
                        <img src="/img/banner/banner.png">
                    </a>
                    <a style="float: right;margin-top: -3px" href="/index">
                        <img src="/img/banner/banner.gif">
                    </a>
                </td>
                <td class="banner" id="banner" style="float: right"></td>
            </tr>
            <tr>
                <td align="center" height="1" colspan="2"></td>
            </tr>
            </tbody>
        </table>
        <div class="c"></div>
    <#-- 登录卡片 -->
        <div style="border: 1px solid black;background: black repeat-x;position: relative;height: 28px">
            <div style="padding-left:30px; color:#fff; padding-top:5px;">
                <div id="one-key" class="one-hidden" onclick="setTimeout(showInfoBox,100);"></div>
                <#--<#if ustate == "login">-->
                <#if Session.user??>
                    <table style="padding-left:8px;">
                        <tr>
                            <td>
                                <a href="/user/${Session.user.uid}?tag=index" style="color:#ffffff;margin-right:8px;font-size: 12px;">
                                    ${Session.user.uname}
                                </a>
                            </td>
                            <td>
                                <a href="/user/${Session.user.uid}?tag=msg" style="color:#ffffff;margin-right:8px;font-size: 12px;">
                                    <#if (Session.user.message)!="0">
                                        <#--TODO-->
                                        <img style="float: left;margin-top: 1px;" src="/img/icon/message.gif">
                                        <font style="color: red;height: 14px;margin: 0px;">&nbsp;(${Session.user.message})</font>
                                    <#else>
                                        <img style="float: left;" src="/img/icon/no-message.gif">
                                    </#if>
                                </a>
                            </td>
                            <td>
                                <a href="/user/${Session.user.uid}" style="color:#ffffff;margin-right:8px;font-size: 12px;">
                                    设置
                                </a>
                            </td>
                            <td>
                                <a href="/user/logout" style="color:#ffffff;margin-right:8px;font-size: 12px;">
                                    退出
                                </a>
                            </td>
                        </tr>
                    </table>
                <#else>
                    <a href="/login" style="color:#ffffff;margin-right:8px;margin-left: 8px;">登录</a>
                    <a href="/register" style="color:#bbbbbb;margin-right:8px;">注册</a>
                </#if>
            </div>
        </div>
        <#--信息页-->
        <div id="infobox" style="background: #ffffff url(/img/bg/body-bg.png) repeat-x;padding-bottom: 2px;">
            <table style="margin-top: 3px;" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                <tr>
                    <td width="53%" style="padding-right: 2em; position: relative">
                        <div style="padding:0 0 0 .1em;" class="float_left">
                            <#--<#if ustate == 'login'>-->
                            <#if !(Session.user)??>
                                <form action="/user/login" name="login_form" method="post">
                                    <div id="radiotype" value="0">
                                        <input type="radio" name="logintype" value="0" checked="checked" onclick="changeType(this)">
                                        <span id="login_0" style="font-size: 12px">用户名</span>
                                        <input type="radio" name="logintype" value="1"  onclick="changeType(this)">
                                        <span id="login_1" style="font-size: 12px">UID</span>
                                        <input type="radio" name="logintype" value="2"  onclick="changeType(this)">
                                        <span id="login_2" style="font-size: 12px">Email</span>
                                        <div>
                                            <input class="input gray" type="text" style="width: 85px;font-size: 12px;color: gray"
                                                   name="usercheck" id="usercheck" value="请输入用户名"
                                                   onfocus="focusInput(this)" onblur="blurInput(this, 'input')">
                                            <input class="input" type="password" style="width: 85px;font-size: 12px;height: 20px;" name="password">
                                            <input class="btn" type="submit" value="登 录" style="width: 80px;background:url(/img/bg/bg-btn.gif) repeat-x #bbbbbb;">
                                        </div>
                                    </div>
                                </form>
                            <#else>
                                <a href="/user/${Session.user.uid}?tag=index">
                                    <img src="${Session.user.icon}" style="float: left;bottom: 5px;width: 40px;height: 40px;position: absolute;"/>
                                </a>
                                <div style="margin-left: 50px;line-height: 180%">
                                    <div style="float: left;width: 100%">
                                        <div style="color: #555555;float: left;clear: right;margin-bottom: 3px;">
                                            <span style="float: left;font-size: 11px;height: 17px;">
                                                文章:${Session.user.postnum},
                                                等级:${Session.user.level}
                                            </span>
                                        </div>
                                        <div style="clear: both"></div>
                                        <span id="qianming" style="color: #333;line-height: 1.3em;height: 17px;margin-top: 3px;font-size: 11px;color: gray;">
                                            签名：${Session.user.signature}
                                        </span>
                                        <a id="editsigimg" onclick="openEdit()" style="color: #555;cursor: pointer;font-size: 11px;">
                                            (<img src="/img/icon/infobox-edit.gif">编辑)
                                        </a>
                                        <div id="editsignature" style="position: absolute;background: #fff;border: 1px solid #bbbbbb;z-index: 3000;opacity: 0.95;left: 321px;top: 168px;visibility: visible;display: none;">
                                            <div style="border: 5px solid #bbbbbb;">
                                                <form>
                                                    <input type="hidden" id="editsiguid" name="uid" value="${Session.user.uid}">
                                                    <table width="300" cellpadding="5" cellspacing="0">
                                                        <tbody>
                                                        <tr>
                                                            <th style="border-bottom: 1px solid #bbbbbb;background: url(/img/bg/bg-tb.gif) repeat-x #dddddd;
                                                            text-align: left;color: #333333;;line-height: 200%;font-size: 12px;">
                                                                <span style="float: right;margin-top: 2px;cursor:pointer;" onclick="closeEdit()">
                                                                    <img src="/img/close.gif">
                                                                </span>
                                                                个性签名编辑
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <td style="line-height: 20px;">
                                                                <textarea id="editedsig" name="signature" style="width: 95%;height: 60px;">${Session.user.signature}</textarea>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                    <ul style="padding: 0;margin: 0;">
                                                        <li style="list-style: none;text-align: center;padding: 4px 0;">
                                                            <input id="submitbtn" type="button" class="btn" value="提 交" onclick="tijiao()">
                                                        </li>
                                                    </ul>
                                                </form>
                                            </div>
                                        </div>
                                        <script language="JavaScript">
                                            //更改签名提交方法
                                            function tijiao() {
                                                var uid = document.getElementById("editsiguid").value;
                                                var sig = document.getElementById("editedsig").value;
                                                $.ajax({
                                                    url:"/user/changesignature?uid=" + uid + "&sig=" + sig,
                                                    contentType: "application/json;charset=utf-8",
                                                    dataType:"json",
                                                    type:"GET",
                                                    success:function (data) {
                                                        console.log(data);
                                                        var qianming = document.getElementById("qianming");
                                                        qianming.innerHTML = "签名：" + data;
                                                        closeEdit();
                                                    }
                                                });
                                            }
                                            //显示更改签名提交内容填写框
                                            function openEdit() {
                                                //更改签名框
                                                var editsig = document.getElementById("editsignature");
                                                //定位依据：更改图标按钮
                                                var editsigimg = document.getElementById("editsigimg").getBoundingClientRect();
                                                //先设置位置
                                                editsig.style.top = editsigimg.y + 14;
                                                editsig.style.left = editsigimg.x;
                                                //再设置显示
                                                editsig.style.display = 'block';
                                            }
                                            //关闭框
                                            function closeEdit() {
                                                var editsig = document.getElementById("editsignature");
                                                editsig.style.display = "none";
                                            }
                                        </script>
                                        <div style="clear: both"></div>
                                    </div>
                                </div>
                            </#if>
                        </div>
                    </td>
                    <td>
                        <div style=" padding:0px;font-size: 11px;color: #555555;" class="fr tar">
                            <center>
                                今日:${(Session.indexDTO.today)!''} | 昨日:${(Session.indexDTO.yestoday)!''} | 最高日:${(Session.indexDTO.mostday)!''} | 版块:${(Session.indexDTO.forums)!''}<br>
                                帖子:${(Session.indexDTO.posts)!''} | 用户: ${(Session.indexDTO.users)!''} | 新用户：${(Session.indexDTO.newest)!''}
                            </center>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
<script language="JavaScript">
    <#if page?? && page == "index">
    function showInfoBox(){
        if (IsElement('infobox')) {
            thisinfobox = getObj('infobox');
            if (thisinfobox.style.display == 'none') {
                thisinfobox.style.display = '';
                getObj('one-key').className = 'one-hidden';
            } else {
                thisinfobox.style.display = 'none';
                getObj('one-key').className = 'one-show';
            }
        }
    }
    <#else>
    getObj("infobox").style.display = 'none';
    </#if>
    // function focusInput(obj) {
    //     if (obj.className.indexOf('black') == -1) {
    //         obj.value = '';
    //         obj.className = obj.className.replace('gray', 'black');
    //     }
    // }
    // function blurInput(obj, val) {
    //     if (obj.value != obj.defaultValue && obj.value == '') {
    //         obj.className = obj.className.replace('black', 'gray');
    //         var logintypeobj = document.getElementsByName('logintype');
    //         for (var i = 0; i < logintypeobj.length; i ++) {
    //             if (logintypeobj[i].checked == true) {
    //                 var objValue = logintypeobj[i].value;
    //                 obj.value = obj.defaultValue = '请输入' + getObj('login_'+objValue).innerHTML;
    //             }
    //         }
    //     }
    // }
    // function changeType(obj) {
    //     var objValue = obj.value;
    //     var radioType = getObj('radiotype')
    //     if (objValue == radioType.value) {
    //         return;
    //     } else {
    //         getObj("usercheck").value = "请输入" + getObj("login_" + objValue).innerHTML;
    //         radioType.value = objValue;
    //     }if (getObj('usercheck').className.indexOf('black') != -1) {
    //         getObj('usercheck').className = getObj('usercheck').className.replace('black', 'gray');
    //     }
    // }
    // function getObj(id) {
    //     return document.getElementById(id);
    // }
    // function IsElement(id) {
    //     return document.getElementById(id) != null ? true : false;
    // }
</script>