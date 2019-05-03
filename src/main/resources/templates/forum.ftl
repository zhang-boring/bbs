<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>具体版块页</title>
    <#include "common/header.ftl">
    <script src="/js/jquery-3.3.1.js"></script>
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
        <a class="gonggao-item" href="/index">
            <strong class="strong">游玩 G&P</strong>
        </a>
        <a class="gonggao-item">
            <strong class="strong">${Session.partname}</strong>
        </a>
        <a class="gonggao-item">
            <strong class="strong">${Session.forumname}</strong>
        </a>
        <div style="clear: both;"></div>
    </div>
    <div style="margin: auto;border: 1px solid #dddddd;height: auto;overflow: hidden;">
        <table cellspacing="0" cellpadding="0" width="100%"
               style="border: 0px solid #ffffff;margin: 0;width: 100%;border-top: none;">
            <tbody>
            <tr style="padding: 0px;margin: 0px;border-bottom: 1px solid #bbbbbb;background: url(/img/bg/bg-tb.gif) repeat-x #dddddd;text-align: left;color: #333333;line-height: 200%;">
                <td style="text-align: center;">文章</td>
                <td style="width:8em;line-height: 18px;border-bottom: 1px solid #eeeeee;padding: 2px 6px;">作者</td>
                <td style="width:6em;line-height: 18px;border-bottom: 1px solid #eeeeee;padding: 2px 6px;text-align: left;">
                    回复
                </td>
                <td style="width:9em;line-height: 18px;border-bottom: 1px solid #eeeeee;padding: 2px 6px;">最新回复</td>
            </tr>
            <#list postDTOPage.content as post>
                <tr style="line-height: 130%;background: #ffffff;" align="center">
                    <td style="text-align:left;line-height:23px;border-bottom: 1px solid #eeeeee;padding: .3em .6em;">
                        <h3 style="font-weight: normal;display: inline;font-size: 12px;">
                            <a href="/post/${post.postid}">
                                <span style="padding-left: 12px;">${post.title}</span>
                            </a>
                        </h3>
                    </td>
                    <td style="text-align: left;border-bottom: 1px solid #eeeeee;padding: .3em .6em;">
                        <a>${post.uname}</a>
                        <div style="color: #555;font-size: 11px;">${post.committime?string('yyyy-MM-dd')}</div>
                    </td>
                    <td style="border-bottom: 1px solid #eeeeee;padding: .3em .6em;font-size: 11px;text-align: left;">
                        ${post.replyNum}
                    </td>
                    <td style="text-align: left;border-bottom: 1px solid #eeeeee;padding: .3em .6em;">
                        ${post.lastchagetime?string('yyyy-MM-dd HH:mm')}<br>
                        <span style="color: #555;">
                            <#if (post.replyUname)??>
                                by: ${post.replyUname}
                            <#else>
                            </#if>
                        </span>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
        <br/>
        <div style="margin: 4px auto 3px;">
            <span style="float: right;">
                <a href="/newpost">
                    <img src="/img/icon/post.png">
                </a>
            </span>
            <span style="float:left;">
                <div style="float: left;border: 1px solid #dddddd;height: 22px;line-height: 22px;margin: 2px 5px 3px 0;">
                <ul style="padding: 0;margin: 0;">
                    <li style="list-style: none;float: left;">
                        <a href="/forum/${forumid}?page=1"
                           style="display: block;padding: 0 7px 0 7px;font-weight: bold;color: #000000;text-decoration: none;">«</a>
                    </li>
                    <#list 1..postDTOPage.totalPages as index>
                        <#if currentPage == index>
                            <li style="list-style: none;float: left;">
                                <b style="padding: 0 5px 0 9px;background: #bbbbbb;display: block;color: #fff;">${index}</b>
                            </li>
                        <#else>
                            <li style="list-style: none;float: left;">
                                <a href="/forum/${forumid}?page=${index}"
                                   style="display: block;padding: 0 7px 0 7px;font-weight: bold;color: #000000;text-decoration: none;">${index}</a>
                            </li>
                        </#if>
                    </#list>
                    <li style="list-style: none;float: left;">
                        <a href="/forum/${forumid}?page=${postDTOPage.totalPages}"
                           style="display: block;padding: 0 7px 0 7px;font-weight: bold;color: #000000;text-decoration: none;">»</a>
                    </li>
                    <li style="height: 22px;margin-left: 5px;border-left: 1px solid #eeeeee;padding-left: 12px;float: left;list-style: none;">Pages:${currentPage}/${postDTOPage.totalPages}&nbsp;&nbsp;&nbsp;Go:<input
                                type="text" size="3" id="pageinput"
                                style="border: 1px solid #eeeeee;font: 12px/15px Verdana;height: 14px;color: #555555;margin-right: 5px;margin-bottom: 3px;padding: 1px 3px 0 3px;vertical-align: middle;"/>
                    </li>
                    <script language="JavaScript">
                            $('#pageinput').bind('keypress', function (event) {
                                if (event.keyCode == "13") {
                                    var page = $('#pageinput').val();
                                    if (page >= ${postDTOPage.totalPages}) {
                                        window.location.href = "/forum/${forumid}?page=${postDTOPage.totalPages}";
                                    } else if (page <= 1) {
                                        window.location.href = "/forum/${forumid}?page=1";
                                    } else {
                                        window.location.href = "/forum/${forumid}?page=" + page;
                                    }
                                }
                            })
                    </script>
                </ul>
            </div>
                <div style="clear: both;"></div>
            </span>
        </div>
    </div>
</div>
<#include "common/footer.ftl" />
</body>
</html>