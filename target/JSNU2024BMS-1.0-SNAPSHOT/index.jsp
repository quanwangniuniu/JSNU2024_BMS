<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <!-- 标题栏LOGO -->
    <link rel="icon" type="image/x-icon" href="/favicon.ico">
    <!--字体图标-->
    <link href="${pageContext.request.contextPath}/javaex/pc/css/icomoon.css" rel="stylesheet" />
    <!--动画-->
    <link href="${pageContext.request.contextPath}/javaex/pc/css/animate.css" rel="stylesheet" />
    <!--骨架样式-->
    <link href="${pageContext.request.contextPath}/javaex/pc/css/common.css" rel="stylesheet" />
    <!--皮肤（缇娜）-->
    <link href="${pageContext.request.contextPath}/javaex/pc/css/skin/tina.css" rel="stylesheet" />
    <!--jquery，不可修改版本-->
    <script src="${pageContext.request.contextPath}/javaex/pc/lib/jquery-1.7.2.min.js"></script>
    <!--全局动态修改-->
    <script src="${pageContext.request.contextPath}/javaex/pc/js/common.js"></script>
    <!--核心组件-->
    <script src="${pageContext.request.contextPath}/javaex/pc/js/javaex.min.js"></script>
    <!--表单验证-->
    <script src="${pageContext.request.contextPath}/javaex/pc/js/javaex-formVerify.js"></script>
    <title>星云图书馆后台管理</title>
    <style>
    </style>
</head>
<body>
<!--顶部导航-->
<div class="admin-navbar">
    <div class="admin-container-fluid clear">
        <!--logo名称-->
        <div class="admin-logo">星云图书管理系统</div>

        <!--右侧-->
        <ul class="admin-navbar-nav fr">
            <li>
                <a href="javascript:;">欢迎您，<span id="nickname">管理员</span></a>
                <ul class="dropdown-menu" style="right: 10px;">
                    <li><a href="/logout">退出当前账号</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>

<!--主题内容-->
<div class="admin-mian">
    <!--左侧菜单-->
    <div class="admin-aside admin-aside-fixed">
        <!-- 应用标题  -->
        <div id="admin-toc" class="admin-toc">
            <div class="menu-box">
                <div id="menu" class="menu">
                    <ul>
                        <li class="menu-item hover">
                            <a href="javascript:page('${pageContext.request.contextPath}/welcome.jsp');"><i class="icon-home2"></i>首页</a>
                        </li>

                        <li class="menu-item">
                            <a href="javascript:;">图书管理<i class="icon-keyboard_arrow_left"></i></a>
                            <ul>
                                <li><a href="javascript:page('${pageContext.request.contextPath}/book/book-list.jsp');">图书列表</a></li>
                                <li><a href="javascript:page('${pageContext.request.contextPath}/book/book-add.jsp');">图书上架</a></li>
                            </ul>
                        </li>

                        <li class="menu-item">
                            <a href="javascript:;">借阅管理<i class="icon-keyboard_arrow_left"></i></a>
                            <ul>
                                <li><a href="javascript:page('${pageContext.request.contextPath}/borrow/book-search.html');">搜索图书</a></li>
                                <li><a href="javascript:page('${pageContext.request.contextPath}/borrow/borrow.html');">借阅图书</a></li>
                                <li><a href="javascript:page('${pageContext.request.contextPath}/borrow/back.html');">归还图书</a></li>
                            </ul>
                        </li>

                        <li class="menu-item">
                            <a href="javascript:;">读者管理<i class="icon-keyboard_arrow_left"></i></a>
                            <ul>
                                <li><a href="javascript:page('reader/reader-list.html');">读者列表</a></li>
                                <li><a href="javascript:page('reader/reader-add.html');">读者添加</a></li>
                            </ul>
                        </li>

                        <li class="menu-item">
                            <a href="javascript:;">用户中心<i class="icon-keyboard_arrow_left"></i></a>
                            <ul>
                                <li><a href="javascript:page('user/user-info.html');">个人信息</a></li>
                                <li><a href="javascript:page('user/user-list.html');">用户管理</a></li>
                                <li><a href="javascript:page('user/user-add.html');">添加管理员</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!--iframe载入内容-->
    <div class="admin-markdown">
        <iframe id="page" src="${pageContext.request.contextPath}/welcome.jsp" ></iframe>
    </div>
</div>
</body>
<script>
    var hightUrl = "xxxx";
    javaex.menu({
        id : "menu",
        isAutoSelected : true,
        key : "",
        url : hightUrl
    });

    $(function() {
        // 设置左侧菜单高度
        setMenuHeight();
    });

    /**
     * 设置左侧菜单高度
     */
    function setMenuHeight() {
        var height = document.documentElement.clientHeight - $("#admin-toc").offset().top;
        height = height - 10;
        $("#admin-toc").css("height", height+"px");
    }

    // 控制页面载入
    function page(url) {
        $("#page").attr("src", url);
    }

    $(document).ready(function(){
        // 页面一加载, 读取登录用户信息
        // get读取参数
        $.get("/user/currUser", function(data){
            var code = data.code;
            var user = data.data;
            if (code == 200) {
                // 设置用户昵称
                $("#nickname").text(user.nickname);
            }

            return false;
        });
    });
</script>
</html>