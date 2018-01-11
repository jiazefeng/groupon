<html>
<head>
    <meta charset="utf-8">
    <title>注册-个人用户</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/css/regist.personal.css"/>
    <link type="text/css" rel="stylesheet" href="${ctx}/css/passport.base.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.3.2/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.3.2/themes/icon.css">
    <link href="${ctx}/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="${ctx}/js/jquery-easyui-1.3.2/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery-easyui-1.3.2/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery-easyui-1.3.2/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx}/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx}/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
    <script type="text/javascript" src="${ctx}/js/common.js"></script>
    <style>
        ul, li {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .text-cyan {
            color: cyan;
        }

        .text-muted {
            color: #999;
        }

        .item-img {
            position: relative;
            /*margin: 8px 0;*/
            margin-left: 200px;
            margin-bottom: 20px;
        }

        .item-img ul {
            font-size: 15px;
            position: absolute;
            top: 0;
            left: 0;
            color: #fff;
            text-shadow: 1px 1px 5px #000;
            border:1px dotted rgba(255, 255, 255, 0.3);
            background: rgba(255, 255, 255, 0.3);
        }

        .item-img ul li {
            margin: 10px 15px;
        }

        .item-img img {
            max-width: 100%;
            box-shadow: 1px 1px 5px #ccc;
        }

        footer {
            width: 100%;
            font-size: 12px;
            text-align: center;
            position: absolute;
            left: 0;
            bottom: 0;
            margin: 20px 0;
        }

        footer a {
            color: #777;
        }

        /*input {*/
            /*display: none;*/
        /*}*/
    </style>
</head>
<body>
<div class="w" id="logo" style="padding-bottom: 65px">
<#--<a href="http://localhost:8082">-->
<#--<img src="/images/taotao-logo.gif" alt="淘淘商城" width="170" height="60"/>-->
<#--</a>-->
    <b></b>
</div>

<div class="w" id="regist">
    <div class="mt">
        <ul class="tab">
            <li class="curr">个人用户</li>
        </ul>
        <div class="extra">
        <span>我已经注册，现在就&nbsp;
        	<a href="${ctx}/login" class="flk13">登录</a>
        </span>
        </div>
    </div>
    <div class="mc">
        <form id="personRegForm" action="/register/adminUser" method="post" enctype="multipart/form-data">
            <div class="form">
                <div class="item">
                    <span class="label"><b class="ftx04">*</b>用户名：</span>

                    <div class="fl item-ifo">
                        <div class="o-intelligent-regName">
                            <input type="text" id="name" name="name" class="text" tabindex="1" autoComplete="off"
                                   onpaste="return false;" value=""/>
                            <i class="i-name"></i>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <span class="label"><b class="ftx04">*</b>用户姓名：</span>

                    <div class="fl item-ifo">
                        <div class="o-intelligent-regName">
                            <input type="text" id="userName" name="userName" class="text" tabindex="1"
                                   autoComplete="off"
                                   onpaste="return false;" value=""/>
                            <i class="i-name"></i>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="item">
                        <span class="label"><b class="ftx04">*</b>请设置密码：</span>

                        <div class="fl item-ifo">
                            <input type="password" id="password" name="password" class="text" tabindex="2"
                                   style="ime-mode:disabled;"
                                   onpaste="return  false" autocomplete="off"/>
                            <i class="i-pass"></i>
                        </div>
                    </div>

                    <div class="item">
                        <span class="label"><b class="ftx04">*</b>请确认密码：</span>

                        <div class="fl item-ifo">
                            <input type="password" id="pwdRepeat" name="pwdRepeat" class="text" tabindex="3"
                                   onpaste="return  false" autocomplete="off"/>
                            <i class="i-pass"></i>
                        </div>
                    </div>
                    <div class="item">
                        <span class="label"><b class="ftx04">*</b>验证手机：</span>

                        <div class="fl item-ifo">
                            <input type="text" id="phoneNum" maxlength="11" name="phoneNum"
                                   class="text" tabindex="4"
                                   autocomplete="off"/>
                            <i class="i-phone"></i>
                        </div>
                    </div>
                    <div class="item">
                        <span class="label"><b class="ftx04">*</b>上传身份证-正面：</span>

                        <div class="fl item-ifo">
                            <input class="uploadfile" type="file" capture="camera" name="zIdCardFile" id="zIdCardFile" style="display:inline"/>
                        <#-- <a href="javascript:void(0)" class="easyui-linkbutton picFileUpload">选择正面</a>
                         <input type="hidden" name="zIdCardUrl"/>-->
                        </div>
                    </div>
                    <div>
                        <ul id="report"></ul>
                    </div>
                    <div class="item" id="dphone">
                        <span class="label"><b class="ftx04">*</b>上传身份证-反面：</span>

                        <div class="fl item-ifo">
                            <input class="uploadfile" type="file" capture="camera" name="fIdCardFile" id="fIdCardFile" style="display:inline"/>
                        </div>
                    </div>
                    <div>
                        <ul id="report1"></ul>
                    </div>
                </div>

                <div class="item">
                    <span class="label">&nbsp;</span>
                    <input type="submit" class="btn-img btn-regist" id="registsubmit" value="立即注册" tabindex="8"
                           clstag="regist|keycount|personalreg|07"
                           onclick=""/>
                </div>
            </div>
        </form>
        <#--<div id="tip"></div>-->
        <#--<footer> </footer>-->
    </div>
    <script>
        $(function () {
            //初始化类目选择和图片上传器
            TAOTAO.init({
                fun: function (node) {
                }
            });
        });
    </script>
    <#--<script src="${ctx}/js/img/mobileFix.mini.js?v=ad62f13"></script>-->
    <script src="${ctx}/js/img/lrz.pc.min.js"></script>
    <script src="${ctx}/js/img/exif.js"></script>
    <script src="${ctx}/js/img/lrz.js"></script>
    <script src="${ctx}/js/img/index.js"></script>
</body>
</html>
