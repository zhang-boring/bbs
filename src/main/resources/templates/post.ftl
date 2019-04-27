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
            <strong class="strong">${Session.partname}</strong>
        </a>
        <a class="gonggao-item" href="/forum/${Session.forumid}">
            <strong class="strong">${Session.forumname}</strong>
        </a>
        <a class="gonggao-item"">
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
                                        <#--                                        TODO : 用户页-->
                                        <a href="" target="_blank">
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
                            <#--                            TODO : 用户页-->
                            <a href="" target="_blank">
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

        <div class="t5 t2">
            <table cellspacing="0" cellpadding="0" width="100%" style="table-layout:fixed;border-top:0">
                <tbody>
                <tr class="tr1">
                    <th style="width:185px;padding:0;" rowspan="2" class="r_two">
                        <div class="user-pic"><br>
                            <table align="center" style="border:0;">
                                <tbody>
                                <tr>
                                    <td width="1">
                                        <a href="" target="_blank" style="cursor:pointer;">
                                            <img src="" border="0" alt="none.gif">
                                        </a>
                                    </td>
                                    <td style="vertical-align:top">
                                        <span id="sf_1"></span>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div align="center"><br>
                            <a href="" target="_blank">
                                <strong></strong>
                            </a><br> <br>
                            <span class="user-info" id="showface_1" style="display:none">
                                <span class="user-infoWrap">
                                    <span class="co"></span>
                                </span>
                            </span>
                        </div>
                    </th>
                    <th height="100%" class="r_one" valign="top" style="padding:0px;border:0;overflow:hidden">
                        <div class="tiptop" style="">
<#--                            TODO : 评论发布-->
                            <span class="fl gray" title="" style="white-space:nowrap;"></span>
                            <div class="c"></div>
                        </div>
                        <div class="c"></div>
                        <span id=""></span>
                        <div class="c"></div>
                        <div class="tpc_content">
                            <div id="" class="c"></div>
                            <div class="f14" id=""></div>
                        </div>
                    </th>
                </tr>
                <tr class="tr1 r_one" style="">
                    <th style="vertical-align:bottom;border:0;padding:0px;">
                        <div class="tpc_content" style="margin-bottom:0%;">
                            <div id="" class="c"></div>
                        </div>
                        <div class="c"></div>
                        <div class="tipad">
                            <div class="c"></div>
                            <span class="fr gray" title="">
                                <a href="javascript:scroll(0,0)" title="顶端">顶端</a>
                            </span>
                            <div class="c"></div>
                        </div>
                    </th>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>