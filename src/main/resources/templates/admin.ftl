<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>管理员登陆</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="/js/bootstrap/js/bootstrap.js" rel="stylesheet">
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            max-width: 300px;
            padding: 19px 29px 29px;
            margin: 0 auto 20px;
            background-color: #fff;
            border: 1px solid #e5e5e5;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            box-shadow: 0 1px 2px rgba(0,0,0,.05);
        }
        .form-signin .form-signin-heading,
        .form-signin .checkbox {
            margin-bottom: 10px;
        }
        .form-signin input[type="text"],
        .form-signin input[type="password"] {
            font-size: 16px;
            height: auto;
            margin-bottom: 15px;
            padding: 7px 9px;
        }

    </style>
    <link href="/js/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/r29/html5.js"></script>
    <![endif]-->

</head>

<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h5 class="text-right">
                当前登录管理员: ${Session.admin} (<a href="/admin/exit">退出</a>)
            </h5>
            <table class="table table-bordered table-hover table-condensed">
                <thead>
                <tr>
                    <th style="width:8%">
                        版块名
                    </th>
                    <th style="width:8%">
                        文章总数
                    </th>
                    <th style="width:8%">
                        版主用户
                    </th>
                    <th>
                        版块描述
                    </th>
                    <th style="width:15%">
                        创建时间
                    </th>
                    <th style="widows: 8%;">
                        社区分区
                    </th>
                    <th style="widows: 10%;">
                        操作
                    </th>
                </tr>
                <#list forums as forum>
                    <tr>
                        <td>
                            ${forum.forumname}
                        </td>
                        <td>
                            ${forum.allPosts}
                        </td>
                        <td>
                            ${forum.moderatorName}
                        </td>
                        <td>
                            ${forum.description}
                        </td>
                        <td>
                            ${forum.createtime}
                        </td>
                        <td>
                            ${forum.partname}
                        </td>
                        <td>
                            <a href="/admin/remove?forumid=${forum.forumid}">删除</a>
                            <a href="/admin/modify?forumid=${forum.forumid}">修改</a>
                        </td>
                    </tr>
                </#list>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>


</div> <!-- /container -->

</body>
</html>
