<!DOCTYPE html>
<html lang="en">
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

</div>
</body>
</html>