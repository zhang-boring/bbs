<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>添加分区</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="/js/bootstrap/js/bootstrap.js" rel="stylesheet">
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/css/bootstrap.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/js/bootstrap.js"></script>
    <script src="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/js/bootstrap.bundle.js"></script>
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
        .btn {
            display: inline-block;
            *display: inline;
            padding: 4px 12px;
            margin-bottom: 0;
            *margin-left: .3em;
            font-size: 14px;
            line-height: 20px;
            color: #333333;
            text-align: center;
            text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
            vertical-align: middle;
            cursor: pointer;
            background-color: #f5f5f5;
            *background-color: #e6e6e6;
            background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6));
            background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
            background-repeat: repeat-x;
            border: 1px solid #cccccc;
            *border: 0;
            border-color: #e6e6e6 #e6e6e6 #bfbfbf;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
            border-bottom-color: #b3b3b3;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe6e6e6', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
            *zoom: 1;
            -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
            -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
            box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
        }

        .btn:hover,
        .btn:focus,
        .btn:active,
        .btn.active,
        .btn.disabled,
        .btn[disabled] {
            color: #333333;
            background-color: #e6e6e6;
            *background-color: #d9d9d9;
        }

        .btn:active,
        .btn.active {
            background-color: #cccccc \9;
        }

        .btn:first-child {
            *margin-left: 0;
        }

        .btn:hover,
        .btn:focus {
            color: #333333;
            text-decoration: none;
            background-position: 0 -15px;
            -webkit-transition: background-position 0.1s linear;
            -moz-transition: background-position 0.1s linear;
            -o-transition: background-position 0.1s linear;
            transition: background-position 0.1s linear;
        }

        .btn:focus {
            outline: thin dotted #333;
            outline: 5px auto -webkit-focus-ring-color;
            outline-offset: -2px;
        }

        .btn.active,
        .btn:active {
            background-image: none;
            outline: 0;
            -webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
            -moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
        }

        .btn.disabled,
        .btn[disabled] {
            cursor: default;
            background-image: none;
            opacity: 0.65;
            filter: alpha(opacity=65);
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
        }

        .btn-large {
            padding: 11px 19px;
            font-size: 17.5px;
            -webkit-border-radius: 6px;
            -moz-border-radius: 6px;
            border-radius: 6px;
        }

        .btn-large [class^="icon-"],
        .btn-large [class*=" icon-"] {
            margin-top: 4px;
        }

        .btn-small {
            padding: 2px 10px;
            font-size: 11.9px;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;
        }

        .btn-small [class^="icon-"],
        .btn-small [class*=" icon-"] {
            margin-top: 0;
        }

        .btn-mini [class^="icon-"],
        .btn-mini [class*=" icon-"] {
            margin-top: -1px;
        }

        .btn-mini {
            padding: 0 6px;
            font-size: 10.5px;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;
        }

        .btn-block {
            display: block;
            width: 100%;
            padding-right: 0;
            padding-left: 0;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .btn-block + .btn-block {
            margin-top: 5px;
        }

        input[type="submit"].btn-block,
        input[type="reset"].btn-block,
        input[type="button"].btn-block {
            width: 100%;
        }

        .btn-primary.active,
        .btn-warning.active,
        .btn-danger.active,
        .btn-success.active,
        .btn-info.active,
        .btn-inverse.active {
            color: rgba(255, 255, 255, 0.75);
        }

        .btn-primary {
            color: #ffffff;
            text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
            background-color: #006dcc;
            *background-color: #0044cc;
            background-image: -moz-linear-gradient(top, #0088cc, #0044cc);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0088cc), to(#0044cc));
            background-image: -webkit-linear-gradient(top, #0088cc, #0044cc);
            background-image: -o-linear-gradient(top, #0088cc, #0044cc);
            background-image: linear-gradient(to bottom, #0088cc, #0044cc);
            background-repeat: repeat-x;
            border-color: #0044cc #0044cc #002a80;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff0088cc', endColorstr='#ff0044cc', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
        }

        .btn-primary:hover,
        .btn-primary:focus,
        .btn-primary:active,
        .btn-primary.active,
        .btn-primary.disabled,
        .btn-primary[disabled] {
            color: #ffffff;
            background-color: #0044cc;
            *background-color: #003bb3;
        }

        .btn-primary:active,
        .btn-primary.active {
            background-color: #003399 \9;
        }

        .btn-warning {
            color: #ffffff;
            text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
            background-color: #faa732;
            *background-color: #f89406;
            background-image: -moz-linear-gradient(top, #fbb450, #f89406);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#fbb450), to(#f89406));
            background-image: -webkit-linear-gradient(top, #fbb450, #f89406);
            background-image: -o-linear-gradient(top, #fbb450, #f89406);
            background-image: linear-gradient(to bottom, #fbb450, #f89406);
            background-repeat: repeat-x;
            border-color: #f89406 #f89406 #ad6704;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fffbb450', endColorstr='#fff89406', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
        }

        .btn-warning:hover,
        .btn-warning:focus,
        .btn-warning:active,
        .btn-warning.active,
        .btn-warning.disabled,
        .btn-warning[disabled] {
            color: #ffffff;
            background-color: #f89406;
            *background-color: #df8505;
        }

        .btn-warning:active,
        .btn-warning.active {
            background-color: #c67605 \9;
        }

        .btn-danger {
            color: #ffffff;
            text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
            background-color: #da4f49;
            *background-color: #bd362f;
            background-image: -moz-linear-gradient(top, #ee5f5b, #bd362f);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ee5f5b), to(#bd362f));
            background-image: -webkit-linear-gradient(top, #ee5f5b, #bd362f);
            background-image: -o-linear-gradient(top, #ee5f5b, #bd362f);
            background-image: linear-gradient(to bottom, #ee5f5b, #bd362f);
            background-repeat: repeat-x;
            border-color: #bd362f #bd362f #802420;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffee5f5b', endColorstr='#ffbd362f', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
        }

        .btn-danger:hover,
        .btn-danger:focus,
        .btn-danger:active,
        .btn-danger.active,
        .btn-danger.disabled,
        .btn-danger[disabled] {
            color: #ffffff;
            background-color: #bd362f;
            *background-color: #a9302a;
        }

        .btn-danger:active,
        .btn-danger.active {
            background-color: #942a25 \9;
        }

        .btn-success {
            color: #ffffff;
            text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
            background-color: #5bb75b;
            *background-color: #51a351;
            background-image: -moz-linear-gradient(top, #62c462, #51a351);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#62c462), to(#51a351));
            background-image: -webkit-linear-gradient(top, #62c462, #51a351);
            background-image: -o-linear-gradient(top, #62c462, #51a351);
            background-image: linear-gradient(to bottom, #62c462, #51a351);
            background-repeat: repeat-x;
            border-color: #51a351 #51a351 #387038;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff62c462', endColorstr='#ff51a351', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
        }

        .btn-success:hover,
        .btn-success:focus,
        .btn-success:active,
        .btn-success.active,
        .btn-success.disabled,
        .btn-success[disabled] {
            color: #ffffff;
            background-color: #51a351;
            *background-color: #499249;
        }

        .btn-success:active,
        .btn-success.active {
            background-color: #408140 \9;
        }

        .btn-info {
            color: #ffffff;
            text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
            background-color: #49afcd;
            *background-color: #2f96b4;
            background-image: -moz-linear-gradient(top, #5bc0de, #2f96b4);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#5bc0de), to(#2f96b4));
            background-image: -webkit-linear-gradient(top, #5bc0de, #2f96b4);
            background-image: -o-linear-gradient(top, #5bc0de, #2f96b4);
            background-image: linear-gradient(to bottom, #5bc0de, #2f96b4);
            background-repeat: repeat-x;
            border-color: #2f96b4 #2f96b4 #1f6377;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5bc0de', endColorstr='#ff2f96b4', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
        }

        .btn-info:hover,
        .btn-info:focus,
        .btn-info:active,
        .btn-info.active,
        .btn-info.disabled,
        .btn-info[disabled] {
            color: #ffffff;
            background-color: #2f96b4;
            *background-color: #2a85a0;
        }

        .btn-info:active,
        .btn-info.active {
            background-color: #24748c \9;
        }

        .btn-inverse {
            color: #ffffff;
            text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
            background-color: #363636;
            *background-color: #222222;
            background-image: -moz-linear-gradient(top, #444444, #222222);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#444444), to(#222222));
            background-image: -webkit-linear-gradient(top, #444444, #222222);
            background-image: -o-linear-gradient(top, #444444, #222222);
            background-image: linear-gradient(to bottom, #444444, #222222);
            background-repeat: repeat-x;
            border-color: #222222 #222222 #000000;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff444444', endColorstr='#ff222222', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
        }

        .btn-inverse:hover,
        .btn-inverse:focus,
        .btn-inverse:active,
        .btn-inverse.active,
        .btn-inverse.disabled,
        .btn-inverse[disabled] {
            color: #ffffff;
            background-color: #222222;
            *background-color: #151515;
        }

        .btn-inverse:active,
        .btn-inverse.active {
            background-color: #080808 \9;
        }

        button.btn,
        input[type="submit"].btn {
            *padding-top: 3px;
            *padding-bottom: 3px;
        }

        button.btn::-moz-focus-inner,
        input[type="submit"].btn::-moz-focus-inner {
            padding: 0;
            border: 0;
        }

        button.btn.btn-large,
        input[type="submit"].btn.btn-large {
            *padding-top: 7px;
            *padding-bottom: 7px;
        }

        button.btn.btn-small,
        input[type="submit"].btn.btn-small {
            *padding-top: 3px;
            *padding-bottom: 3px;
        }

        button.btn.btn-mini,
        input[type="submit"].btn.btn-mini {
            *padding-top: 1px;
            *padding-bottom: 1px;
        }

        .btn-link,
        .btn-link:active,
        .btn-link[disabled] {
            background-color: transparent;
            background-image: none;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
        }

        .btn-link {
            color: #0088cc;
            cursor: pointer;
            border-color: transparent;
            -webkit-border-radius: 0;
            -moz-border-radius: 0;
            border-radius: 0;
        }

        .btn-link:hover,
        .btn-link:focus {
            color: #005580;
            text-decoration: underline;
            background-color: transparent;
        }

        .btn-link[disabled]:hover,
        .btn-link[disabled]:focus {
            color: #333333;
            text-decoration: none;
        }

        .btn-group {
            position: relative;
            display: inline-block;
            *display: inline;
            *margin-left: .3em;
            font-size: 0;
            white-space: nowrap;
            vertical-align: middle;
            *zoom: 1;
        }

        .btn-group:first-child {
            *margin-left: 0;
        }

        .btn-group + .btn-group {
            margin-left: 5px;
        }

        .btn-toolbar {
            margin-top: 10px;
            margin-bottom: 10px;
            font-size: 0;
        }

        .btn-toolbar > .btn + .btn,
        .btn-toolbar > .btn-group + .btn,
        .btn-toolbar > .btn + .btn-group {
            margin-left: 5px;
        }

        .btn-group > .btn {
            position: relative;
            -webkit-border-radius: 0;
            -moz-border-radius: 0;
            border-radius: 0;
        }

        .btn-group > .btn + .btn {
            margin-left: -1px;
        }

        .btn-group > .btn,
        .btn-group > .dropdown-menu,
        .btn-group > .popover {
            font-size: 14px;
        }

        .btn-group > .btn-mini {
            font-size: 10.5px;
        }

        .btn-group > .btn-small {
            font-size: 11.9px;
        }

        .btn-group > .btn-large {
            font-size: 17.5px;
        }

        .btn-group > .btn:first-child {
            margin-left: 0;
            -webkit-border-bottom-left-radius: 4px;
            border-bottom-left-radius: 4px;
            -webkit-border-top-left-radius: 4px;
            border-top-left-radius: 4px;
            -moz-border-radius-bottomleft: 4px;
            -moz-border-radius-topleft: 4px;
        }

        .btn-group > .btn:last-child,
        .btn-group > .dropdown-toggle {
            -webkit-border-top-right-radius: 4px;
            border-top-right-radius: 4px;
            -webkit-border-bottom-right-radius: 4px;
            border-bottom-right-radius: 4px;
            -moz-border-radius-topright: 4px;
            -moz-border-radius-bottomright: 4px;
        }

        .btn-group > .btn.large:first-child {
            margin-left: 0;
            -webkit-border-bottom-left-radius: 6px;
            border-bottom-left-radius: 6px;
            -webkit-border-top-left-radius: 6px;
            border-top-left-radius: 6px;
            -moz-border-radius-bottomleft: 6px;
            -moz-border-radius-topleft: 6px;
        }

        .btn-group > .btn.large:last-child,
        .btn-group > .large.dropdown-toggle {
            -webkit-border-top-right-radius: 6px;
            border-top-right-radius: 6px;
            -webkit-border-bottom-right-radius: 6px;
            border-bottom-right-radius: 6px;
            -moz-border-radius-topright: 6px;
            -moz-border-radius-bottomright: 6px;
        }

        .btn-group > .btn:hover,
        .btn-group > .btn:focus,
        .btn-group > .btn:active,
        .btn-group > .btn.active {
            z-index: 2;
        }

        .btn-group .dropdown-toggle:active,
        .btn-group.open .dropdown-toggle {
            outline: 0;
        }

        .btn-group > .btn + .dropdown-toggle {
            *padding-top: 5px;
            padding-right: 8px;
            *padding-bottom: 5px;
            padding-left: 8px;
            -webkit-box-shadow: inset 1px 0 0 rgba(255, 255, 255, 0.125), inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
            -moz-box-shadow: inset 1px 0 0 rgba(255, 255, 255, 0.125), inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
            box-shadow: inset 1px 0 0 rgba(255, 255, 255, 0.125), inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
        }

        .btn-group > .btn-mini + .dropdown-toggle {
            *padding-top: 2px;
            padding-right: 5px;
            *padding-bottom: 2px;
            padding-left: 5px;
        }

        .btn-group > .btn-small + .dropdown-toggle {
            *padding-top: 5px;
            *padding-bottom: 4px;
        }

        .btn-group > .btn-large + .dropdown-toggle {
            *padding-top: 7px;
            padding-right: 12px;
            *padding-bottom: 7px;
            padding-left: 12px;
        }

        .btn-group.open .dropdown-toggle {
            background-image: none;
            -webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
            -moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
        }

        .btn-group.open .btn.dropdown-toggle {
            background-color: #e6e6e6;
        }

        .btn-group.open .btn-primary.dropdown-toggle {
            background-color: #0044cc;
        }

        .btn-group.open .btn-warning.dropdown-toggle {
            background-color: #f89406;
        }

        .btn-group.open .btn-danger.dropdown-toggle {
            background-color: #bd362f;
        }

        .btn-group.open .btn-success.dropdown-toggle {
            background-color: #51a351;
        }

        .btn-group.open .btn-info.dropdown-toggle {
            background-color: #2f96b4;
        }

        .btn-group.open .btn-inverse.dropdown-toggle {
            background-color: #222222;
        }

        .btn .caret {
            margin-top: 8px;
            margin-left: 0;
        }

        .btn-large .caret {
            margin-top: 6px;
        }

        .btn-large .caret {
            border-top-width: 5px;
            border-right-width: 5px;
            border-left-width: 5px;
        }

        .btn-mini .caret,
        .btn-small .caret {
            margin-top: 8px;
        }

        .dropup .btn-large .caret {
            border-bottom-width: 5px;
        }

        .btn-primary .caret,
        .btn-warning .caret,
        .btn-danger .caret,
        .btn-info .caret,
        .btn-success .caret,
        .btn-inverse .caret {
            border-top-color: #ffffff;
            border-bottom-color: #ffffff;
        }

        .btn-group-vertical {
            display: inline-block;
            *display: inline;
            /* IE7 inline-block hack */

            *zoom: 1;
        }

        .btn-group-vertical > .btn {
            display: block;
            float: none;
            max-width: 100%;
            -webkit-border-radius: 0;
            -moz-border-radius: 0;
            border-radius: 0;
        }

        .btn-group-vertical > .btn + .btn {
            margin-top: -1px;
            margin-left: 0;
        }

        .btn-group-vertical > .btn:first-child {
            -webkit-border-radius: 4px 4px 0 0;
            -moz-border-radius: 4px 4px 0 0;
            border-radius: 4px 4px 0 0;
        }

        .btn-group-vertical > .btn:last-child {
            -webkit-border-radius: 0 0 4px 4px;
            -moz-border-radius: 0 0 4px 4px;
            border-radius: 0 0 4px 4px;
        }

        .btn-group-vertical > .btn-large:first-child {
            -webkit-border-radius: 6px 6px 0 0;
            -moz-border-radius: 6px 6px 0 0;
            border-radius: 6px 6px 0 0;
        }

        .btn-group-vertical > .btn-large:last-child {
            -webkit-border-radius: 0 0 6px 6px;
            -moz-border-radius: 0 0 6px 6px;
            border-radius: 0 0 6px 6px;
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
                        修改分区：${part.partname}(<a href="/admin/managepart">取消</a>)
                    </h5>
                </div>
                <div class="col-md-6 column">
                    <h5 class="text-center">
                        当前登录管理员: ${Session.admin} (<a href="/admin/exit">退出</a>)
                    </h5>
                </div>
            </div>
            <form class="form-horizontal" role="form" action="/admin/execmdp" method="post">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">分区名</label>
                    <div class="col-sm-10">
                        <input type="hidden" name="partid" value="${part.partid}">
                        <input type="text" class="form-control" id="partname" name="partname"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>

</html>