<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>删除版块</title>
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
            <div class="row clearfix">
                <div class="col-md-6 column">
                    <h5 class="text-right">
                        修改版块：${forumname} (<a href="/admin/list">取消</a>)
                    </h5>
                </div>
                <div class="col-md-6 column">
                    <h5 class="text-center">
                        当前登录管理员: ${Session.admin} (<a href="/admin/exit">退出</a>)
                    </h5>
                </div>
            </div>
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">版块名</label>
                    <div class="col-sm-10">
                        <input type="forumname" class="form-control" id="forumname" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">版主用户UID</label>
                    <div class="col-sm-10">
                        <input type="moderator" class="form-control" id="inputPassword3" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">描述信息</label>
                    <div class="col-sm-10">
                        <input type="description" class="form-control" id="inputPassword3" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">社区分区</label>
                    <div class="col-sm-10">
                        <input type="part" class="form-control" id="inputPassword3" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">确认修改</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>

</html>