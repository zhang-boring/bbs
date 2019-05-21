<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" http-equiv="Content-Type" content="text/html;charset=utf-8">
    <title>发新帖页面</title>
    <#include "common/header.ftl">
    <script src="https://cdn.ckeditor.com/4.8.0/standard-all/ckeditor.js"></script>
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
        <a class="gonggao-item">
            <strong class="strong">${Session.partname}</strong>
        </a>
        <a class="gonggao-item">
            <strong class="strong">${Session.forumname}</strong>
        </a>
        <div style="clear: both;"></div>
    </div>
    <div style="min-width: 760px;border: 1px solid #dddddd;margin: 0 auto 8px;height: auto;overflow: hidden;background: #ffffff;">
        <form action="/post/new" method="post">
            <input type="hidden" name="forumid" value="${Session.forumid}">
            <input type="hidden" name="announce" value="${announce}">
            <table style="border: 0px solid #ffffff;margin: 0;width: 100%;border-top: none;" cellpadding="0" cellspacing="0" align="center">
                <tr>
                    <th style="border-bottom: 1px solid #bbbbbb;background: url(/img/bg/bg-tb.gif) repeat-x #dddddd;text-align: left;color: #333333;padding: 2px .5em 0;line-height: 200%;" colspan="2">
                        <b>发布文章</b>
                    </th>
                </tr>
                <tr>
                    <td style="font-size: 12px;text-align:center;padding-left:120px">
                        文章标题
                    </td>
                    <td>
                        <div style="margin:.5em auto 0 205px; height:30px;">
                            <div style="width: 540px;border: 1px solid;border-color: #dddddd;padding: 2px 0px 2px 1px;font-size: 1.0em;vertical-align: middle;color: #000;float: left;background: #ffffff;">
                                <input title="请输入标题" name="title" style="border:0;font-size:14px; font-family:Tahoma;width:480px;font: 12px Arial;padding: 1px 3px 0 3px;vertical-align: middle;margin-bottom: 1px;">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea name="content" id="content"></textarea>
                        <script>
                            CKEDITOR.replace( 'content', {
                                // Define the toolbar: http://docs.ckeditor.com/ckeditor4/docs/#!/guide/dev_toolbar
                                // The standard preset from CDN which we used as a base provides more features than we need.
                                // Also by default it comes with a 2-line toolbar. Here we put all buttons in a single row.
                                toolbar: [
                                    { name: 'clipboard', items: [ 'Undo', 'Redo' ] },
                                    { name: 'styles', items: [ 'Styles', 'Format' ] },
                                    { name: 'basicstyles', items: [ 'Bold', 'Italic', 'Strike', '-', 'RemoveFormat' ] },
                                    { name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] },
                                    { name: 'links', items: [ 'Link', 'Unlink' ] },
                                    { name: 'insert', items: [ 'Image', 'EmbedSemantic', 'Table' ] },
                                    { name: 'tools', items: [ 'Maximize' ] },
                                    { name: 'editing', items: [ 'Scayt' ] }
                                ],
                                // Since we define all configuration options here, let's instruct CKEditor to not load config.js which it does by default.
                                // One HTTP request less will result in a faster startup time.
                                // For more information check http://docs.ckeditor.com/ckeditor4/docs/#!/api/CKEDITOR.config-cfg-customConfig
                                customConfig: '',
                                // Enabling extra plugins, available in the standard-all preset: http://ckeditor.com/presets-all
                                extraPlugins: 'autoembed,uploadimage,uploadfile',
                                /*********************** File management support ***********************/
                                // In order to turn on support for file uploads, CKEditor has to be configured to use some server side
                                // solution with file upload/management capabilities, like for example CKFinder.
                                // For more information see http://docs.ckeditor.com/ckeditor4/docs/#!/guide/dev_ckfinder_integration
                                // Uncomment and correct these lines after you setup your local CKFinder instance.
                                // filebrowserBrowseUrl: 'http://example.com/ckfinder/ckfinder.html',
                                // filebrowserUploadUrl: 'http://example.com/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files',
                                /*********************** File management support ***********************/
                                // Remove the default image plugin because image2, which offers captions for images, was enabled above.
                                removePlugins: ' ',
                                // Make the editing area bigger than default.
                                height: 600,
                                // An array of stylesheets to style the WYSIWYG area.
                                // Note: it is recommended to keep your own styles in a separate file in order to make future updates painless.
                                contentsCss: [ 'https://cdn.ckeditor.com/4.8.0/standard-all/contents.css', 'mystyles.css' ],
                                // This is optional, but will let us define multiple different styles for multiple editors using the same CSS file.
                                bodyClass: 'article-editor',
                                // Reduce the list of block elements listed in the Format dropdown to the most commonly used.
                                format_tags: 'p;h1;h2;h3;pre',
                                // Simplify the Image and Link dialog windows. The "Advanced" tab is not needed in most cases.
                                removeDialogTabs: 'image:advanced;link:advanced',
                                // Define the list of styles which should be available in the Styles dropdown list.
                                // If the "class" attribute is used to style an element, make sure to define the style for the class in "mystyles.css"
                                // (and on your website so that it rendered in the same way).
                                // Note: by default CKEditor looks for styles.js file. Defining stylesSet inline (as below) stops CKEditor from loading
                                // that file, which means one HTTP request less (and a faster startup).
                                // For more information see http://docs.ckeditor.com/ckeditor4/docs/#!/guide/dev_styles
                                stylesSet: [
                                    /* Inline Styles */
                                    { name: 'Marker',			element: 'span', attributes: { 'class': 'marker' } },
                                    { name: 'Cited Work',		element: 'cite' },
                                    { name: 'Inline Quotation',	element: 'q' },
                                    /* Object Styles */
                                    {
                                        name: 'Special Container',
                                        element: 'div',
                                        styles: {
                                            padding: '5px 10px',
                                            background: '#eee',
                                            border: '1px solid #ccc'
                                        }
                                    },
                                    {
                                        name: 'Compact table',
                                        element: 'table',
                                        attributes: {
                                            cellpadding: '5',
                                            cellspacing: '0',
                                            border: '1',
                                            bordercolor: '#ccc'
                                        },
                                        styles: {
                                            'border-collapse': 'collapse'
                                        }
                                    },
                                    { name: 'Borderless Table',		element: 'table',	styles: { 'border-style': 'hidden', 'background-color': '#E6E6FA' } },
                                    { name: 'Square Bulleted List',	element: 'ul',		styles: { 'list-style-type': 'square' } },
                                    /* Widget Styles */
                                    // We use this one to style the brownie picture.
                                    { name: 'Illustration', type: 'widget', widget: 'image', attributes: { 'class': 'image-illustration' } },
                                    // Media embed
                                    { name: '240p', type: 'widget', widget: 'embedSemantic', attributes: { 'class': 'embed-240p' } },
                                    { name: '360p', type: 'widget', widget: 'embedSemantic', attributes: { 'class': 'embed-360p' } },
                                    { name: '480p', type: 'widget', widget: 'embedSemantic', attributes: { 'class': 'embed-480p' } },
                                    { name: '720p', type: 'widget', widget: 'embedSemantic', attributes: { 'class': 'embed-720p' } },
                                    { name: '1080p', type: 'widget', widget: 'embedSemantic', attributes: { 'class': 'embed-1080p' } }
                                ],
                                filebrowserImageUploadUrl: '/post/uploadimg',
                                image_previewText: ' ',
                                language: 'zh-cn',
                            } );
                        </script>
                    </td>
                </tr>
                <tr>
                    <th></th>
                    <td style="height: 30px;">
                        <input type="submit" value="提交" style="align:center;margin-left: 260px;width:80px;color:#fff;font-weight:700;border:1px;background:url(/img/bg/bg-btn.gif) repeat-x #bbbbbb;vertical-align:middle;border:1px solid #dddddd;">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
<#include "common/footer.ftl" />
</html>