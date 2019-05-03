<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>公告列表页</title>
    <#include "common/header.ftl">
    <style>
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
        <a class="gonggao-item" onclick="window.location.reload();">
            <strong class="strong">公告列表</strong>
        </a>
        <div style="clear: both;"></div>
    </div>
    <#list gglist as gg>
        <div style="border: 1px solid #dddddd;margin: 0 auto 8px;height: auto;overflow: hidden;">
            <div style="background: #ffffff;">
                <table width="100%" style="border: 0px solid #ffffff;margin: 0;width: 100%;border-top: none;" cellspacing="0" cellpadding="3">
                    <tbody style="display: table-row-group;vertical-align: middle;border-color: inherit;">
                    <tr style="display: table-row;vertical-align: inherit;border-color: inherit;">
                        <td style="border-bottom: 1px solid #bbbbbb;background: url(/img/bg/bg-tb.gif) repeat-x #dddddd;
                    text-align: left;color: #333333;padding: 2px .5em 0;line-height: 200%;">
                            <font style="font-family: Arial;color: #333333">
                                ≡
                                <span style="color: red;">${gg.title}</span>
                                ≡<br>
                        </td>
                    </tr>
                    <tr style="display: table-row;vertical-align: inherit;border-color: inherit;">
                        <th style="padding: 15px;font-weight: normal;text-align: left;word-break: break-all;word-wrap: break-word;">
                            <a href="http://127.0.0.1:8080/post/${gg.postid}">http://127.0.0.1:8080/post/${gg.postid}</a>
                        </th>
                    </tr>
                    <tr style="display: table-row;vertical-align: inherit;border-color: inherit;">
                        <td style="word-break: break-all;word-wrap: break-word;display: table-cell;vertical-align: inherit;">
                            <div style="float: right;">时间:${gg.committime?string('yyyy-MM-dd hh:mm')}&nbsp;&nbsp;发布:${gg.uname}</div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </#list>
</div>
<#include "common/footer.ftl" />
</body>
</html>