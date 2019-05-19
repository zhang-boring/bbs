<html>
<head>
    <meta charset="UTF-8">
    <title>用户信息页</title>
    <#include "common/header.ftl">
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
    <link href="/css/css.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/header.js"></script>
    <style>
        .readbot {
            padding: 0px;
            margin: 0px;
        }

        .tr2 {
            background: #f8f8f8 url(/img/bg/bg-tr.gif) 0 repeat-x;
            color: #555555;
        }

        /*通用公告框*/
        #gonggao {
            border: 1px solid #dddddd;
            margin: 10px 0;
            overflow: hidden;
            height: 26px;
            padding: 0 1em 0 0;
            line-height: 26px;
            *line-height: 26px;
            font-weight: bold;
            background: url(/img/bg/body-bg.png) 0 repeat-x #f8f8f8;
        }

        #gonggao .gonggao-item {
            overflow: hidden;
            height: 26px;
            padding: 0 1.3em 0 1.3em;
            background: url("/img/bg/bg-gonggao.gif") right top no-repeat;
            float: left;
            position: relative;
            margin-right: -7px;
        }

        #gonggao .gonggao-item .strong {
            *line-height: 26px;
            _line-height: 26px;
        }

        #gonggao .gonggao-item i {
            position: absolute;
            height: 26px;
            width: 7px;
            left: 0px;
            top: 0
        }

        #gonggao .gonggao-item:hover {
            text-decoration: none;
            font-weight: bold
        }

        body {
            font-size: 12px;
            font-family: Arial, Helvetica, sans-serif;
            color: #555555;
            background-image: url(/img/bg/bg.gif);
            background-repeat: repeat-y;
            background-position: center center;
        }

        form, body {
            padding: 0;
            margin: 0;
        }

        td, th, div {
            word-break: break-all;
            word-wrap: break-word;
        }

        textarea, input, select {
            font: 12px Arial;
            padding: 1px 3px 0 3px;
            vertical-align: middle;
            margin-bottom: 1px
        }

        select {
            border: solid 1px #eeeeee;
        }

        form {
            display: inline;
        }

        textarea {
            border: 1px solid;
            border-color: #dddddd;
        }

        a {
            color: #000000;
            text-decoration: none;
        }

        a:hover {
            color: #bbbbbb;
            text-decoration: underline;
        }

        /*全局布局自上而下*/
        #wrapA {
            width: 100%;
            margin: auto;
        }

        /* 包含头部与中间 */
        #header {
            width: 920px;
            margin: auto;
        }

        /*头部*/
        #main {
            border-left: 1px solid #000000;
            border-right: 1px solid #000000;
            background: black repeat-x;
            position: relative;
            height: 28px;
        }

        /*中间*/
        #footer {
            width: 920px;
            margin: auto;
            border-top: 1px solid #dddddd;
            background: #f8f8f8;
        }

        /*底部*/
        .footer {
            width: 920px;
            text-align: right;
            margin: auto;
            padding: .8em 0 .3em;
        }

        #login {
            padding-left: 50px;
            color: #fff;
            padding-bottom: 5px;
        }

        #login a {
            margin-right: 8px;
        }

        #infobox {
            border: 1px solid #dddddd;
            border-top: 0px;
            padding: .2em .5em .5em;
            background: #ffffff url(/img/bg/body-bg.png) repeat-x;
        }

        .float_left {
            float: left;
        }

        .input {
            border: 1px solid;
            border-color: #dddddd;
            padding: 2px 0px 2px 1px;
            font-size: 12px;
            vertical-align: middle;
            color: #000000;
        }

        .gray {
            color: #888888;
        }

        .btn {
            color: #ffffff;
            font-weight: 700;
            background: url("/img/bg/bg-btn.gif") repeat-x #bbbbbb;
            border-width: 1px;
            padding-left: 15px;
            padding-right: 15px;
            vertical-align: middle;
            border: 1px solid #dddddd;
        }

        .banner img {
            vertical-align: middle;
        }

        .c {
            clear: both;
            height: 0px;
            font: 0px/0px Arial;
        }

        .input {
            border: 1px solid;
            border-color: #dddddd;
            padding: 2px 0px 2px 1px;
            font-size: 1.0em;
            vertical-align: middle;
            color: #000;
        }

        /*table*/
        .t {
            border: 1px solid #dddddd;
            margin: 0 auto 8px;
            height: auto;
            overflow: hidden;
        }

        .t table {
            border: 0px solid #ffffff;
            margin: 0;
            width: 100%;
            border-top: none;
        }

        .t2 {
            border-top: #dddddd 1px solid;
            margin: 0px auto 5px;
        }

        .t3 {
            margin: 4px auto 3px;
        }

        .t3 table {
            padding: 0px;
        }

        .t4 {
            padding: 0px;
        }

        .t5 {
            border: 1px solid #dddddd;
            margin: 0 auto 8px;
            height: auto;
            overflow: hidden;
        }

        .f_one, .t_one, .r_one {
            background: #ffffff;
        }

        /* tab */
        .tab {
            float: left;
            padding: 0 .8em 0;
            border: 1px solid #ffffff;
            background: #bbbbbb;
            border-bottom: 0;
            line-height: 200%;
            margin-top: 3px;
            cursor: pointer;
            margin: 2px 0;
        }

        .h span.activetab {
            border-color: #dddddd;
            cursor: default;
            font-weight: 700
        }

        /*table tr1*/
        .tr1 th {
            padding: 5px 10px;
            text-align: left;
            vertical-align: top;
            font-weight: normal;
        }

        .tr1 td.td1 {
            border-bottom: 1px solid #eeeeee;
        }

        /*table tr2*/
        .tr2 td, .tr2 th {
            line-height: 18px;
            border-bottom: 1px solid #eeeeee;
            padding: 2px 6px;
            *padding: 4px 6px 1px;
        }

        .tr2 a {
            color: #555555;
            margin: 0 2px 0
        }

        /*table tr3*/
        .tr3 {
            line-height: 130%;
        }

        .tr3 td, .tr3 th {
            border-bottom: 1px solid #eeeeee;
            padding: .3em .6em;
        }

        .tr3 th {
            text-align: left;
            font-weight: normal;
        }

        .z .tr3:hover {
            background: #ffffff;
        }

        .tr4 {
            background: #ffffff;
            padding-left: 12px;
            height: 27px;
            line-height: 27px;
        }

        .tr td, .tr th {
            padding: 2px
        }

        .fr {
            float: right
        }

        .tar {
            text-align: right
        }

        /*top信息开关*/
        #one-key {
            position: absolute;
            left: 0;
            bottom: 0;
            /*_top:-9px;*/
            width: 40px;
            height: 26px;
            cursor: pointer
        }

        .one-hidden {
            background: url(/img/showhide.gif) center center no-repeat;
        }

        .one-show {
            background: url(/img/showhide.gif) center center no-repeat;
            transform: rotate(180deg);
        }

        .fl {
            float: left
        }

        .h2 {
            background: url(/img/bg/bg_tb.gif) repeat-x #dddddd;
            color: #333333;
            text-align: left;
            padding: 0 12px;
            height: 26px;
            line-height: 26px;
            border: 1px solid #dddddd;
        }

        .tiptop {
            font-size: 12px;
            border-bottom: 1px dotted #ccc;
            padding: 0 0 0 1px;
            height: 27px;
            line-height: 27px;
            margin: 0 1em 1em 1em;
        }

        .bianji {
            background: none;
            margin-left: .8em;
        }

        .h1 {
            color: #bbbbbb;
            margin: 0 0 1em 0;
        }

        .tpc_content {
            font-family: Arial;
            padding: 0 2em 2em 2em;
            margin: 0;
            line-height: 2em;
            font-size: 14px;
        }

        .f14 {
            font-size: 14px
        }

        .user-pic {
            margin-left: 5px;
        }

        .w {
            white-space: nowrap
        }

        .user-info {
            position: absolute;
            line-height: 160%;
            margin-left: -1.5em;
        }

        .user-infoWrap {
            color: #555;
            background: #fff url(images/colorImagination/menubg.gif) center top repeat-x;
            border: 1px solid #bbbbbb;
            padding: .5em 1em;
            margin-left: 20px;
            display: block;
        }

        .tipad {
            font-size: 12px;
            margin: 2em 1em 0 1em;
            padding-bottom: 1em;
        }

        .f_two, .t_two, .r_two {
            background: #EEEEEE;
        }

        #u-wrap2 {
            width: 920px;
            margin: auto;
            background: url(/img/u-wrap.gif) repeat-x #ffffff;
        }

        .cc {
            zoom: 1;
            overflow: hidden;
            _overflow: inherit
        }

        #u-sidebar {
            width: 180px;
            float: left;
        }

        #u-portrait {
            padding: .7em;
            border: 1px dotted #eeeeee;
            background: #ffffff;
        }

        #u-content {
            width: 720px;
            float: right;
        }

        #u-top {
            width: 100%;
            height: 70px;
            position: relative;
        }

        .u-h1 {
            font-size: 16px;
            display: inline;
            padding: 0;
            margin: 0
        }

        #honor {
            color: #333;
            line-height: 1.3em;
            padding: .2em 0 0 .1em;
        }

        #u-top-nav {
            position: absolute;
            bottom: 0;
            height: 30px;
        }

        #u-top-nav ul, #u-top-nav li {
            height: 30px;
            float: left;
            padding: 0;
            margin: 0;
            list-style: none;
        }

        #u-top-nav li a {
            float: left;
            padding: 0 .8em;
            margin-right: .5em;
            font-size: 12px;
            background: #eeeeee;
            color: #333333;
            line-height: 27px;
            margin-top: 2px;
        }

        #u-top-nav li a:hover {
            text-decoration: none;
            background: #333333;
            color: #dddddd;
        }

        #u-top-nav li.current a {
            color: #555555;
            border: 1px solid #dddddd;
            border-bottom: 0;
            height: 29px;
            background: #ffffff;
            margin-top: 0
        }

        #u-top-nav li.current a:hover {
            color: #555555;
        }

        .u-content-66 {
            width: 63%;
        }

        .u-content-33 {
            width: 33%
        }

        .u-h5 {
            padding: 1em 0 .5em;
            margin: 0;
            font-size: 1.05em;
            position: relative;
            background: url(/img/dotline.gif) repeat-x 0 1.6em
        }

        .u-table td, .u-table th {
            border-bottom: 1px dotted #eeeeee;
            text-align: left;
            padding: .5em;
            vertical-align: top
        }

        .u-table td {
            color: #aaa;
        }

        .u-table th {
            font-weight: 100;
        }
        .info {
            border-bottom: 1px dotted #eeeeee;
            text-align: left;
            padding: .5em;
            vertical-align: top;
            font-weight: 100;
        }
    </style>
</head>
<body>
<div style="height: auto;width: 920px;margin:auto;">
    <div id="gonggao">
        <a class="gonggao-item" href="/index">
            <strong class="strong">游玩 G&P</strong>
        </a>
        <a class="gonggao-item" onload="window.location.reload();">
            <strong class="strong">用户中心</strong>
        </a>
        <a class="gonggao-item" onload="window.location.reload();">
            <strong class="strong">我的</strong>
        </a>
        <div style="clear: both;"></div>
    </div>

    <div id="u-wrap2" class="cc">
        <div id="u-sidebar">
            <div id="u-portrait">
                <div align="center">
                    <img src="${user.icon}" border="0"/>
                </div>
                <div style="padding:.6em 1.2em;background: #FFFFFF">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                        <tr style="color: #333;font-size: 11px;">
                            <td>等级</td>
                            <td>${user.identity}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div id="u-content">
            <div id="u-top">
                <table border="0" cellspacing="0" cellpadding="0"
                       style="margin-top:.2em; float:left; height:40px; vertical-align:middle">
                    <tbody>
                    <tr>
                        <td>
                            <h1 class="u-h1">${user.uname}</h1>
                        </td>
                        <td style="padding-left:1em; line-height:120%">
                            <span id="honor">
                                ${user.signature}
                            </span>
                            <#if (Session.user.uid)?? && Session.user.uid == user.uid >
                                <a id="editsigimg" onclick="openEdit()"
                                   style="color: #555;cursor: pointer;font-size: 11px;">
                                    <img src="/img/icon/infobox-edit.gif">编辑
                                </a>
                                <div id="editsignature"
                                     style="position: absolute;background: #fff;border: 1px solid #bbbbbb;z-index: 3000;opacity: 0.95;left: 321px;top: 168px;visibility: visible;display: none;">
                                    <div style="border: 5px solid #bbbbbb;">
                                        <form>
                                            <input type="hidden" id="editsiguid" name="uid" value="${user.uid}">
                                            <table width="300" cellpadding="5" cellspacing="0">
                                                <tbody>
                                                <tr>
                                                    <th style="border-bottom: 1px solid #bbbbbb;background: url(/img/bg/bg-tb.gif) repeat-x #dddddd;
                                                                text-align: left;color: #333333;;line-height: 200%;font-size: 12px;">
                                                        <span style="float: right;margin-top: 2px;cursor:pointer;"
                                                              onclick="closeEdit()">
                                                            <img src="/img/close.gif">
                                                        </span>
                                                        个性签名编辑
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <td style="line-height: 20px;">
                                                        <textarea id="editedsig" name="signature"
                                                                  style="width: 95%;height: 60px;">${user.signature}</textarea>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <ul style="padding: 0;margin: 0;">
                                                <li style="list-style: none;text-align: center;padding: 4px 0;">
                                                    <input id="submitbtn" type="button" class="btn" value="提 交"
                                                           onclick="tijiao()">
                                                </li>
                                            </ul>
                                        </form>
                                    </div>
                                </div>
                            </#if>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="c"></div>
                <div id="u-top-nav">
                    <ul class="b">
                        <li <#if tag == "index">id="u_show" class="current"</#if>>
                            <a href="/user/${user.uid}?tag=index">资料</a>
                        </li>
                        <#if (Session.user.uid)?? && Session.user.uid == user.uid >
                            <li <#if tag == "msg">id="u_show" class="current"</#if>>
                                <a href="/user/${user.uid}?tag=msg">未读消息</a>
                            </li>
                            <li <#if tag == "modify">id="u_show" class="current"</#if>>
                                <a href="/user/${user.uid}?tag=modify">修改信息</a>
                            </li>
                            <li <#if tag == "mypost">id="u_show" class="current"</#if>>
                                <a href="/user/${user.uid}?tag=mypost">我的发布</a>
                            </li>
                        </#if>
                    </ul>
                </div>
            </div>
            <#if tag == "index">
                <div class="u-content-66 fl">
                    <div id="u-profile">
                        <h5 class="u-h5">
                            <span style="background: #FFFFFF;padding-right: .5em">个人信息</span>
                        </h5>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="u-table"
                               style="table-layout:fixed;font-size: 11px">
                            <tbody>
                            <tr>
                                <td>UID</td>
                                <td width="75%">${user.uid}</td>
                            </tr>
                            <tr>
                                <td>性别</td>
                                <td>
                                    <#if user.gender == 0>
                                        保密
                                    <#elseif user.gender == 1>
                                        男
                                    <#else>
                                        女
                                    </#if>
                                </td>
                            </tr>
                            <tr>
                                <td>生日</td>
                                <td>${user.birthday}</td>
                            </tr>
                            <tr>
                                <td>昵称</td>
                                <td>${user.uname}</td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td>${user.email}</td>
                            </tr>
                            <tr>
                                <td>注册时间</td>
                                <td>${user.signUpTime}</td>
                            </tr>
                            <tr>
                                <td>上次登录</td>
                                <td>${user.checkInDate}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            <#elseif tag == "msg">
                <div id="u-profile">
                    <h5 class="u-h5">
                        <span style="background: #FFFFFF;padding-right: .5em">未读消息</span>
                    </h5>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="u-table"
                           style="table-layout:fixed;font-size: 11px">
                        <tbody>
                        <tr>
                            <th width="30%">文章</th>
                            <th width="20%">评论者</th>
                            <th width="20%">消息数量</th>
                            <th width="30%"><a href="/user/readmsg?postid=0&posteruid=0">全部已读</a></th>
                        </tr>
                        <#if (messages?size < 1)>
                            <tr>
                                <td colspan="4" style="color: grey;">
                                    无新消息
                                </td>
                            </tr>
                        </#if>
                        <#list messages as message>
                            <tr>
                                <td>
                                    <a href="/post/${message.postid}" onclick="readMsg(${message.postid}, ${message.posteruid})">${message.postName}</a>
                                </td>
                                <td>
                                    <a href="/user/${message.posteruid}">${message.posterUname}</a>
                                </td>
                                <td>
                                    ${message.nums}
                                </td>
                            </tr>
                        </#list>
                        </tbody>
                        <script>
                            function readMsg(postid, posteruid) {
                                $.ajax("/user/readmsg?postid=" + postid + "&posteruid=" + posteruid, function () {
                                });
                            }
                        </script>
                    </table>

                </div>
            <#elseif tag == "modify">
                <div id="u-profile">
                    <h5 class="u-h5">
                        <span style="background: #FFFFFF;padding-right: .5em">修改资料</span>
                    </h5>
                    <form action="/user/modify" method="post">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="u-table"
                               style="table-layout:fixed;font-size: 11px">
                            <tbody>
                            <tr>
                                <td style="width: 30%">Email</td>
                                <td>
                                    <input name="email" type="text" value="${info.email}">
                                </td>
                            </tr>
                            <tr>
                                <td>手机号</td>
                                <td>
                                    <input name="phone" value="<#if info.phone??>${info.phone}</#if>">
                                </td>
                            </tr>
                            <tr>
                                <td>生日</td>
                                <td>
                                    <input type="date" name="birthday" value="${info.birthday}">
                                </td>
                            </tr>
                            <tr>
                                <td>性别</td>
                                <td>
                                    <input type="radio" name="gender" value="0" <#if info.gender == 0>checked</#if>>保密&nbsp;
                                    <input type="radio" name="gender" value="1" <#if info.gender == 1>checked</#if>>男&nbsp;&nbsp;
                                    <input type="radio" name="gender" value="2" <#if info.gender == 2>checked</#if>>女
                                </td>
                            </tr>
                            <tr>
                                <td>选择头像</td>
                                <td>
                                    <input type="radio" name="icon" value="1" <#if info.icon =="/img/head/1.gif">checked</#if> >
                                    <img src="/img/head/1.gif">&nbsp;&nbsp;
                                    <input type="radio" name="icon" value="2" <#if info.icon == "/img/head/2.gif">checked</#if>>
                                    <img src="/img/head/2.gif">&nbsp;&nbsp;
                                    <input type="radio" name="icon" value="3" <#if info.icon == "/img/head/3.gif">checked</#if>>
                                    <img src="/img/head/3.gif">&nbsp;&nbsp;
                                    <input type="radio" name="icon" value="4" <#if info.icon == "/img/head/4.gif">checked</#if>>
                                    <img src="/img/head/4.gif">&nbsp;&nbsp;
                                    <input type="radio" name="icon" value="5" <#if info.icon == "/img/head/5.gif">checked</#if>>
                                    <img src="/img/head/5.gif">
                                </td>
                            </tr>
                            <tr>
                                <th width="30%" style="text-align: right;font-weight: normal;">
                                </th>
                                <td style="padding-left: 36px;">
                                    <input class="btn" type="submit" value="提 交">
                                    <input class="btn" type="button" value="修改密码" onclick="resetpw()">
                                    <script>
                                        function resetpw() {
                                            location="/user/resetpw";
                                        }
                                    </script>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            <#elseif tag == "mypost">
                <div id="u-profile">
                    <h5 class="u-h5">
                        <span style="background: #FFFFFF;padding-right: .5em">我的文章</span>
                    </h5>
                    <form action="" method="post">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="u-table"
                               style="table-layout:fixed;font-size: 11px">
                            <thead>
                            <tr style="color: black">
                                <th width="30%">文章标题</th>
                                <th>所属版块</th>
                                <th>发布时间</th>
                                <th>最新回复</th>
                                <th>评论数量</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list myposts as mypost>
                            <tr>
                                <td><a href="/post/${mypost.postid}">${mypost.title}</a></td>
                                <td>${mypost.forumname}</td>
                                <td>${mypost.committime}</td>
                                <td>${mypost.lastchagetime}</td>
                                <td>${mypost.replyNum}</td>
                                <td><a href="/post/delete?postid=${mypost.postid}">删除</a></td>
                            </tr>
                            </#list>
                            </tbody>
                        </table>
                    </form>
                </div>
            </#if>
        </div>
    </div>
</div>
</body>
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
<#--<div style="position:absolute;bottom:0;width:100%;height:100px;">-->
    <#include "common/footer.ftl" />
<#--</div>-->
</html>