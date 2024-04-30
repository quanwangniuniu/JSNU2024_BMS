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
    <title>后台管理</title>
    <style>
        .bg-wrap, body, html {height: 100%;}
        input{line-height: normal;-webkit-appearance: textfield;background-color: white;-webkit-rtl-ordering: logical;cursor: text;padding: 1px;border-width: 2px;border-style: inset;border-color: initial;border-image: initial;}
        input[type="text"], input[type="password"]{border: 0;outline: 0;}
        input, button{text-rendering: auto;color: initial;letter-spacing: normal;word-spacing: normal;text-transform: none;text-indent: 0px;text-shadow: none;display: inline-block;text-align: start;margin: 0em;font: 400 13.3333px Arial;}
        input[type=button]{-webkit-appearance: button;cursor: pointer;}
        .bg-wrap {position: relative;background: url(http://img.javaex.cn/FipOsQoe90u_7i3dOVpaeX5QD7c6) top left no-repeat;background-size: cover;overflow: hidden;}
        .main-cont-wrap{z-index: 1;position: absolute;top: 50%;left: 50%;margin-left: -190px;margin-top: -255px;box-sizing: border-box;width: 380px;padding: 30px 30px 40px;background: #fff;box-shadow: 0 20px 30px 0 rgba(63,63,65,.06);border-radius: 10px;}
        .form-title{margin-bottom: 40px;}
        .form-title>span{font-size: 20px;color: #2589ff;}
        .form-item{margin-bottom: 30px;position: relative;height: 40px;line-height: 40px;border-bottom: 1px solid #e3e3e3;box-sizing: border-box;}
        .form-txt{display: inline-block;width: 70px;color: #595961;font-size: 14px;margin-right: 10px;}
        .form-input{border: 0;outline: 0;font-size: 14px;color: #595961;width: 155px;}
        .form-btn{margin-top: 40px;}
        .ui-button{display: block;width: 320px;height: 50px;text-align: center;color: #fff;background: #2589ff;border-radius: 6px;font-size: 16px;border: 0;outline: 0;cursor:pointer }

    </style>
</head>
<body>
<div class="bg-wrap">
    <div class="main-cont-wrap login-model">
        <form id="form">
            <div class="form-title">
                <span>星云图书管理后台登录</span>
            </div>
            <input type="hidden" id="method" name="method" value="login">

            <div class="form-item">
                <span class="form-txt">账号：</span>
                <input type="text" class="form-input original" id="uname" name="loginName" placeholder="请输入账号" data-type="必填" error-pos="32" />
            </div>
            <div class="form-item">
                <span class="form-txt">密码：</span>
                <input type="password" class="form-input original" name="password" id="pass" placeholder="请输入密码" data-type="必填" error-pos="32" />
            </div>
            <div class="form-item">
                <span class="form-txt">验证码:</span>
                <input type="text" class="form-input original" name="checkCode" id="checkCode" placeholder="请输入验证码"  data-type="必填" error-pos= "32"/>
                <img style="position: absolute; right: 0; bottom: 0;" src='${pageContext.request.contextPath}/login/checkCode.do' id="im" onclick="change();">

            </div>


            <div class="form-item">
                <input type="checkbox" id="remember" name="remember" class="fill"/> 记住我
                &nbsp;&nbsp;
                <span id="error_span"  style="color: red;width: 235px;font-size: 15px; float: right;" >
                    	错误信息
                    </span>

            </div>
            <div class="form-btn">
                <input type="button" class="ui-button" id="save" value="登录" />
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    function change() {
        var im = document.getElementById("im");
        im.src = "${pageContext.request.contextPath}/login/checkCode.do?time=" + new Date().getTime();
    }



    // 登录
    $("#save").on("click", function(){
        var username =  $("#uname").val();
        var password =  $("#pass").val();
        // 记住我
        var checkCode = $("#checkCode").val();

        $.post("${pageContext.request.contextPath}/login/login.do",{"username":username,"password": password,"checkCode":checkCode},function(result) {
            // 由于SpringSecurity 框架返回的是HTML页面, 所以使用js形式登录只能以html页面元素判定是否登录成功
            var index = result.indexOf("remember");
            if (result == "fail") {
                // 提示登录失败
                javaex.optTip({
                    content : "用户名或密码错误!",
                    type : "error"
                });
            }else {
                // 登录成功 跳转首页
                window.location.href="${pageContext.request.contextPath}/login/toIndex.do";
            }

        });
    });
</script>
</body>
</html>

