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

    <form class="form-signin" action="/admin/login" method="post" name="adminEntity">
        <h2 class="form-signin-heading">请先登录</h2>
        <input type="text" class="input-block-level" name="aname" placeholder="管理员用户名">
        <input type="password" class="input-block-level" name="apasswd" placeholder="管理员密码">
        <button class="btn btn-large btn-primary" type="submit">提交</button>
    </form>

</div> <!-- /container -->

</body>
</html>
