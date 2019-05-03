<html>
<title>主页</title>
<#include "./common/header.ftl">
<head>
    <style>
        #wrapB{width: 920px;margin: auto;}
        #main{
            border-left:1px solid #000000;
            border-right:1px solid #000000;
            /*background:white repeat-x;*/
            position:relative;
        }  /*中间*/
        .c{clear: both;}
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
        #notice{padding:.3em 1.4em;height:18px;}
        /*table*/
        .t{border:1px solid #dddddd;margin:0 auto 8px; height:auto;
            overflow:hidden;
        }
        .t table{border:0px solid #ffffff;margin:0; width:100%;border-top:none;}
        .h{
            border-bottom:1px solid #bbbbbb; background:url(/img/bg/bg-tb.gif) repeat-x #dddddd;
            text-align:left;color:#333333;padding:2px .5em 0; line-height:200%;
        }
        .h span{font-weight:normal;}
        .h h2{font-weight:bold}
        .h span{font-family:Arial;color:#333333}
        .h span a,.h span{color:#ffffff;}
        .h a{margin-left:12px;}
        .h2 a{color:#333333;}
        .tac{text-align:center}
    </style>
    <script language="JavaScript">
        function getObj(id) {
            return document.getElementById(id);
        }
    </script>
</head>
<body
        <#--style="background-image: url('../static/img/bg/bg.gif') repeat-y;background-position:center center;"-->
>
<div id="wrapB" style="width: 920px;">
    <div id="main" style="border: 0px;background: #FFF;height: auto">
        <div id="gonggao">
            <a class="gonggao-item" href="/post/gonggao">
                <strong class="strong">公告</strong>
            </a>
            <div id="notice" style="overflow: hidden;">
                <div style="width:98%;height: 18px;line-height:18px;overflow-y:hidden;">
                    <a href="/post/${Session.indexDTO.announceId}">
                        <span style="color:red">${Session.indexDTO.announceName}</span></a>
                </div>
            </div>
            <div class="c"></div>
        </div>
        <div id="content">
            <#list Session.parts as part>
                <div class="t">
                    <table cellspacing="0" cellpadding="0" width="100%">
                        <tbody>
                        <tr>
                            <th class="h" style="height: 27px;" colspan="5">
                                <h2 style="height: 27px;margin: 0px">
                                    <span style="font-size:12px;color:#333333;font-weight:bold">${part.partname}</span>
                                </h2>
                            </th>
                        </tr>
                        <tr></tr>
                        </tbody>
                        <tbody>
                        <tr style="background: url('/img/bg/bg-tr.gif') 0 repeat-x #f8f8f8;height: 23px;border-bottom:1px solid #eeeeee;padding:.3em .6em;">
                            <td class="tac" width="*" colspan="2" style="font-size: 12px;">版块</td>
                            <td class="tac" style="width:80px;font-size: 12px;">文章</td>
                            <td class="tac" style="width:20%;font-size: 12px;">最后发表</td>
                            <td class="tac" style="width:140px;font-size: 12px;">版主</td>
                        </tr>
                        <#list Session.forums as forum>
                            <#if forum.partid == part.partid>
                                <tr style="border-bottom:1px solid #eeeeee;padding:.3em .6em;">
                                    <td class="tac" style="width: 35px;padding: 6px;">
                                        <a href="/forum/${forum.forumid}">
                                            <#if (forum.icon)??>
                                                <img style="height: 35px; width: 35px;" src="${forum.icon}">
                                            <#else>
                                                <img style="height: 35px; width: 35px;" src="/img/icon/logo.gif"/>
                                            </#if>
                                        </a>
                                    </td>
                                    <th style="padding-left: 5px;">
                                        <h3 style="margin: 0px;float: left;font-size: 12px;">
                                            <a href="/forum/${forum.forumid}">${forum.forumname}</a>
                                        </h3>
                                        <span style="font-size:11px;float: left;color: gray;margin-left: 10px;font-weight: 100;">(${forum.newPosts})</span><br>
                                        <span style="color:#888;float: left;font-size: 11px;">
                                            <#if (forum.description)??>
                                                ${forum.description}
                                            </#if>
                                        </span>
                                    </th>
                                    <td style="text-align: left;font-size: 11px;">${forum.todayPosts}/${forum.allPosts}</td>
                                    <td>
                                        <#if (forum.postid)??>
                                            <a href="/post/${forum.postid}" style="font-size: 12px;">
                                                ${forum.title}
                                            </a><br>
                                            <span class="gray">
                                            <span style="font-size: 11px;">${forum.uname}</span>
                                            <span style="font-size: 11px;">${forum.committime?string('yyyy-MM-dd hh:mm')}</span>
                                        </span>
                                        </#if>
                                    </td>
                                    <td>
                                        <#if forum.moderator != 0>
                                        <a href="/user/${forum.moderator}" style="font-size: 12px;">
                                                ${forum.moderatorName}
                                        </a>
                                        <#else>

                                        </#if>
                                    </td>
                                </tr>
                            </#if>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </#list>
        </div>
    </div>
</div>
<#include "common/footer.ftl" />
</body>
</html>
