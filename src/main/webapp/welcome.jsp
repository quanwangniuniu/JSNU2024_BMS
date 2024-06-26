<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<!--字体图标-->
<link href="javaex/pc/css/icomoon.css" rel="stylesheet" />
<!--动画-->
<link href="javaex/pc/css/animate.css" rel="stylesheet" />
<!--骨架样式-->
<link href="javaex/pc/css/common.css" rel="stylesheet" />
<!--皮肤（缇娜）-->
<link href="javaex/pc/css/skin/tina.css" rel="stylesheet" />
<!--jquery，不可修改版本-->
<script src="javaex/pc/lib/jquery-1.7.2.min.js"></script>
<!--全局动态修改-->
<script src="javaex/pc/js/common.js"></script>
<!--核心组件-->
<script src="javaex/pc/js/javaex.min.js"></script>
<!--表单验证-->
<script src="javaex/pc/js/javaex-formVerify.js"></script>
<title>后台管理</title>
<style>
    .ex-slide ul.focus-bg a{display: block; width: 100%; height: 100%; background: no-repeat 50%; background-size: cover;}
    .ex-slide .wrapper{width: 1420px; height: 106px; margin: 0 auto; position: relative; margin-top: 414px;}
    .ex-slide .focus-box{width: 100%; height: 106px;margin: 0 auto; position: absolute; left: 0; bottom: 0; filter: progid:DXImageTransform.Microsoft.gradient(enabled=true, startColorstr='#4C000000', endColorstr='#4C000000'); background: rgba(0,0,0,.3);}
    .ex-slide .focus-box ul{padding-left: 20px;padding: 18px 0 0 18px; overflow: hidden;}
    .ex-slide .focus-box li{float: left; width: 140px; height: 70px; margin-right: 15px; position: relative;}
    .ex-slide .focus-box li img{display: block; width: 140px; height: 70px; position: relative;}
    .ex-slide .focus-box li.on img{border: 3px solid #24baf1;}
    
    .ex-slide{width: 100%; height: 720px;}
    .ex-slide ul.focus-bg li{width: 100%; height: 720px;}
</style>  
</head>
<body>
    <!--  头部导航  -->
	<div class="breadcrumb">
        <!-- <span>总览</span> -->
        <span class="divider">/</span>
        <span class="active">精彩活动</span>
    </div>
    <!--幻灯片-->
    <div style="width: 100%; height: 520px;">
        <!--幻灯片-->
        <div id="slide" class="ex-slide">
            <!--背景大图-->
            <ul class="focus-bg">
                <li>
                    <a style="background-image: url('javaex/img/7.jpg')">
                    </a>
                </li>
                <li>
                    <a style="background-image: url('javaex/img/2.jpg')">
                    </a>
                </li>
                <li>
                    <a style="background-image: url('javaex/img/3.jpg')">
                    </a>
                </li>
                <li>
                    <a style="background-image: url('javaex/img/4.jpg')">
                    </a>
                </li>
                <li>
                    <a style="background-image: url('javaex/img/5.jpg')">
                    </a>
                </li>
                <li>
                    <a style="background-image: url('javaex/img/6.jpg')">
                    </a>
                </li>
                <li>
                    <a style="background-image: url('javaex/img/1.jpg')">
                    </a>
                </li>
                <li>
                    <a style="background-image: url('javaex/img/8.jpg')">
                    </a>
                </li>
                <li>
                    <a style="background-image: url('javaex/img/9.jpg')">
                    </a>
                </li>
            </ul>
    
            <div class="wrapper">
                <!--焦点，如果不需要焦点的话，直接去掉这个div即可-->
                <div class="focus-box">
                    <ul>
                        <li>
                            <a href="javascript:;"><img src="javaex/img/7.jpg" /></a>
                        </li>
                        <li>
                            <a href="javascript:;"><img src="javaex/img/2.jpg" /></a>
                        </li>
                        <li>
                            <a href="javascript:;"><img src="javaex/img/3.jpg" /></a>
                        </li>
                        <li>
                            <a href="javascript:;"><img src="javaex/img/4.jpg" /></a>
                        </li>
                        <li>
                            <a href="javascript:;"><img src="javaex/img/5.jpg" /></a>
                        </li>
                        <li>
                            <a href="javascript:;"><img src="javaex/img/6.jpg" /></a>
                        </li>
                        <li>
                            <a href="javascript:;"><img src="javaex/img/1.jpg" /></a>
                        </li>
                        <li>
                            <a href="javascript:;"><img src="javaex/img/8.jpg" /></a>
                        </li>
                        <li>
                            <a href="javascript:;"><img src="javaex/img/9.jpg" /></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        javaex.slide({
            id : "slide",
            delay : 3000
        });
    </script>
</body>
</html>