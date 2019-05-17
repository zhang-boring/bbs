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

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <div class="col-md-6 column">
                    <h5 class="text-center">
                        删除分区(<a href="/admin/managepart">取消</a>)
                    </h5>
                </div>
                <div class="col-md-6 column">
                    <h5 class="text-right">
                        当前登录管理员: ${Session.admin} (<a href="/admin/exit">退出</a>)
                    </h5>
                </div>
            </div>
            <form action="/admin/execrmpart" method="post">
                <table class="table table-hover table-condensed">
                    <tbody>
                    <tr>
                        <td>
                            分区名
                        </td>
                        <td>
                            ${part.partname}
                        </td>
                    </tr>
                    <tr>
                        <td>
                            创建时间
                        </td>
                        <td>
                            ${part.createtime}
                        </td>
                    </tr>
                    <tr>
                        <td>
                            删除方式
                        </td>
                        <td>
                            <input type="hidden" name="partid" value="${part.partid}">
                            <input type="radio" name="rmtype" value="1" checked><a style="color: RED;">级联删除(注:会删除所有分区版块所有文章)</a>
                            <input type="radio" name="rmtype" value="2">移动到分区:<select name="part">
                                <#list parts as part>
                                    <option value="${part.partid}">${part.partname}</option>
                                </#list>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            确认删除
                        </td>
                        <td>
                            <input type="submit" class="btn btn-default active" value="确认删除"></input>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>

        </div>
    </div>
</div>
