<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>具体版块页</title>
    <#include "common/header.ftl">
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
    <link href="/css/css.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/header.js"></script>
    <#--    <script src="/js/jquery-3.3.1.js"></script>-->
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
    </style>
</head>
<body>
<div style="height: auto;width: 920px;margin:auto;">
    <div id="gonggao">
        <a class="gonggao-item" href="/index">
            <strong class="strong">游玩 G&P</strong>
        </a>
        <a class="gonggao-item">
            <strong class="strong">${Session.partname}</strong>
        </a>
        <a class="gonggao-item" href="/forum/${Session.forumid}">
            <strong class="strong">${Session.forumname}</strong>
        </a>
        <a class="gonggao-item" onload="window.location.reload();">
        <strong class="strong">${post.title}</strong>
        </a>
        <div style="clear: both;"></div>
    </div>
    <div style="margin: auto;border: 1px solid #dddddd;height: auto;overflow: hidden;">
        <div class="t3" style="margin-top:4px;">
            <span class="fr color" style="margin-left:.5em">
                <a href="/newpost">
                    <img src="/img/icon/post.png">
                </a>
            </span>
            <span class="fr color">
                <a href="#reply">
                    <img src="/img/icon/reply.png">
                </a>
            </span>
            <span class="fl"></span>
            <div class="c"></div>
        </div>
        <div class="h2">
            <span class="fl w"></span>
        </div>
        <div class="c"></div>

        <#if cpage == 1>
            <div class="t5 t2" style="border-top:0">
                <table cellspacing="0" cellpadding="0" width="100%" style="table-layout:fixed;border-top:0">
                    <tbody>
                    <tr class="tr1">
                        <th style="width:185px;padding:0;" rowspan="2" class="r_two">
                            <div class="user-pic"><br>
                                <table align="center" style="border:0;">
                                    <tbody>
                                    <tr>
                                        <td width="1">
                                            <a href="/user/${poster.uid}" target="_blank">
                                                <img src="${poster.icon}" width="150" height="150" border="0">
                                            </a>
                                        </td>
                                        <td style="vertical-align:top">
                                            <span id="sf_0"></span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div align="center">
                                <br>
                                <a href="/user/${poster.uid}" target="_blank">
                                    <strong>${poster.uname}</strong>
                                </a>
                                <br>
                            </div>
                        </th>
                        <th height="100%" class="r_one" valign="top" id="td_tpc"
                            style="padding:0px;border:0;overflow:hidden">
                            <div class="tiptop" style="">
                                <span class="fl gray" style="white-space:nowrap;">${post.committime}</span>
                                <div class="fl bianji">（${poster.signature}）</div>
                                <div class="c"></div>
                            </div>
                            <div class="c"></div>
                            <div class="h1 fl" style="margin-left:1em;">
                                <h1 class="fl" id="subject_tpc">${post.title}</h1>
                            </div>
                            <div class="c"></div>
                            <div class="tpc_content">
                                <div id="p_tpc" class="c"></div>
                                <div class="f14" id="read_tpc">
                                    ${post.content}
                                </div>
                            </div>
                        </th>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="c"></div>
        </#if>
        <#if comments ??>
            <#list comments.content as comment>
                <div class="t5 t2">
                    <table cellspacing="0" cellpadding="0" width="100%" style="table-layout:fixed;border-top:0">
                        <tbody>
                        <tr class="tr1">
                            <th style="width:185px;padding:0;" rowspan="2" class="r_two">
                                <div class="user-pic">
                                    <br>
                                    <table align="center" style="border:0;">
                                        <tbody>
                                        <tr>
                                            <td width="1">
                                                <a href="/user/${comment.firstuid}" target="_blank">
                                                    <img src="${comment.icon}"></img>
                                                </a>
                                            </td>
                                            <td style="vertical-align:top">
                                                <span id="sf_1"></span>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div align="center">
                                    <br>
                                    <a href="/user/${comment.firstuid}">${comment.uname}</a>
                                    <br><br>
                                </div>
                            </th>
                            <th height="100%" class="r_one" valign="top" id="td_8030401"
                                style="padding:0px;border:0;overflow:hidden">
                                <div class="tiptop">
                                    <span class="fl gray" style="white-space:nowrap;">
                                        ${comment.committime}
                                    </span>
                                    <div class="fl bianji">（${comment.signature}）</div>
                                    <div class="c"></div>
                                </div>
                                <div class="c"></div>
                                <#if comment.seconduid != 0>
                                    <div class="h1 fl" style="margin-left:1em;">
                                        <h1 class="fl">
                                            回复${comment.seconenduname}的评论
                                        </h1>
                                    </div>
                                    <div class="c"></div>
                                </#if>
                                <div class="tpc_content">
                                    <div class="f14">${comment.comment}</div>
                                </div>
                            </th>
                        </tr>
                        <tr class="tr1 r_one">
                            <th style="vertical-align:bottom;border:0;padding:0px;">
                                <div class="tpc_content" style="margin-bottom:0%;">
                                    <div class="c"></div>
                                </div>
                                <div class="c"></div>
                                <div class="tipad">
                                    <div class="c"></div>
                                    <span class="fr gray" title="">
                                        <a href="javascript:scroll(0,0)" title="顶端">顶端</a>
                                    </span>
                                    <ul class="fl readbot">
                                        <li class="huifu">
                                            <a title="回复此楼" style="cursor:pointer;" onclick="postreply('回${comment.uname}的评论', ${comment.firstuid});">回复</a>
                                        </li>
                                    </ul>
                                    <div class="c"></div>
                                </div>
                            </th>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="c"></div>
            </#list>
        </#if>

        <div class="t3" style="margin-top:4px;">
            <span class="fr color" style="margin-left:.5em">
                <a href="/newpost">
                    <img src="/img/icon/post.png">
                </a>
            </span>
            <span class="fr color">
                <a href="#reply" onclick="postreply('回${post.title}的评论', 0);">
                    <img src="/img/icon/reply.png">
                </a>
            </span>
            <span class="fl"></span>
            <div class="c"></div>
        </div>

        <div class="t5" style="margin-top:5px">
            <a name="reply" />
            <table cellspacing="0" cellpadding="0" align="center" width="100%">
                <tbody>
                <tr style="height:23px;line-height:23px;color:#666;">
                    <td class="h2" colspan="2">
                        <b>评论文章</b>
                    </td>
                    <td class="h2" style="text-align:right">
                        <a href="javascript:scroll(0,0)">顶端</a>
                    </td>
                </tr>
                <tr class="tr2">
                    <td colspan="100" style="border-bottom:0"></td>
                </tr>
                <tr>
                    <td colspan="2" class="f_one" style="padding:7px">
                        <div style="margin-left: 30%">
                            <form name="FORM" action="/post/comment" method="post">
                                <input name="firstuid" type="hidden" value="${Session.user.uid}" />
                                <input name="seconduid" type="hidden" value="0"/>
                                <input name="postid" type="hidden" value="${post.postid}" />
                                <div>
                                    <input type="text" class="input" name="atc_title" value="回复${post.title}的评论">
                                    <br>
                                </div>
                                <textarea name="atc_content" rows="8" style="width:96%"></textarea>
                                <div style="margin:5px 0">
                                    <div style="padding:4px 15px 4px 0;float:right;">
                                        <input type="submit" value="提交" class="btn">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
<script>
    function postreply(txt, uid) {
        document.FORM.atc_title.value = txt;
        document.FORM.seconduid.value = uid;
        document.FORM.atc_content.focus();
    }
</script>
<#include "common/footer.ftl" />
</html>