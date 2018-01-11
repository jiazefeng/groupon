<html>
<head>
    <meta charset="utf-8">
    <link href="signin.css" rel="stylesheet">
    <link href="${ctx}/css/signin.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <title>枣枣管理系统</title>
<#--<link rel="icon" href="images/favicon.ico" type="image/x-icon" />-->
<#--<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />-->
<#--<link rel="bookmark" href="images/favicon.ico" type="image/x-icon" />-->
</head>
<body>
<div class="sticky-header header-section ">
    <div>
        <div class="header-left">
            <div class="logo">
                <a href="#" class="fl logo block mt20 ml50">
                    <span>枣枣管理系统</span>
                </a>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="header-right">
            <div class="profile_details">
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<div class="container" style="padding-top: 100px">
<#--<form class="form-signin" role="form" method="post" action="${ctx}/main">-->
<#--<h2 class="form-signin-heading">请登录</h2>-->
<#--<input type="text" class="form-control" name="name" placeholder="用户名" required autofocus>-->
<#--<input type="password" class="form-control" name="password" placeholder="密码" required>-->
<#--&lt;#&ndash;<label class="checkbox">&ndash;&gt;-->
<#--&lt;#&ndash;<input type="checkbox" value="remember-me"> Remember me&ndash;&gt;-->
<#--&lt;#&ndash;</label>&ndash;&gt;-->
<#--<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>-->
<#--</form>-->
    <div id="page-wrapper" style="min-height: 205px;">
        <div class="main-page">
            <div class="forms">
                <div class="row">
                    <div class="col-md-6 validation-grids validation-grids-right">
                        <div class="widget-shadow " data-example-id="basic-forms">
                            <div class="form-title">
                                <h4>登录</h4>
                            </div>
                            <div class="form-body">
                                <form class="form-horizontal" action="${ctx}/main" method="post">
                                    <div class="form-group">
                                        <label for="userId" class="col-sm-2 control-label">用户名</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="name" id="userId"
                                                   placeholder="" required autofocus>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="col-sm-2 control-label">密码</label>
                                        <div class="col-sm-9">
                                            <input type="password" class="form-control" name="password" id="password"
                                                   placeholder="" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <div class="checkbox">
                                                <label> <input type="checkbox">记住密码</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-offset-2">
                                        <button type="submit" class="btn btn-primary">登录</button>
                                        <a href="${ctx}/register" type="button" class="btn btn-primary">注册</a>
                                    </div>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                        <div align="center">
                            <br/><br/><br/><br/><br/>
                            <h4>建议使用<a
                                    href="http://se.360.cn/">360浏览器</a>、<a
                                    href="http://rj.baidu.com/soft/detail/14744.html?ald">谷歌浏览器</a>或<a
                                    href="http://sw.bos.baidu.com/sw-search-sp/software/774ee5fe262e3/BOIE9_ZHCN_BO0085_WIN7.exe">IE9.0以上版本</a>
                            </h4>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<div class="footer navbar-fixed-bottom">
    <div class="container">
        <span class="pull-left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;技术支持：宏锋信息科技有限公司<b>&nbsp;4006-612-966</b></span>
        <span class="pull-right">HongFeng Group 版权所有</span>
    </div>
</div>
</body>
</html>