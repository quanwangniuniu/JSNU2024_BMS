<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
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
</head>
<style>

</style>

<body>
<!--全部主体内容-->
<div class="list-content">
	<!--块元素-->
	<div class="block">
		<!--修饰块元素名称-->
		<div class="banner">
			<p class="tab fixed">编辑图书</p>
		</div>

		<!--正文内容-->
		<div class="main">
			<form>
				<!--文本框-->
				<div class="unit clear">
					<div class="left"><span class="required">*</span><p class="subtitle">书名</p></div>
					<div class="right">
						<input type="text" id="bookName" class="text" placeholder="请输入图书名称" />
					</div>
				</div>

				<div class="unit clear">
					<div class="left"><span class="required">*</span><p class="subtitle">ISBN编号</p></div>
					<div class="right">
						<input type="text" id="isbn" class="text" placeholder="ISBN编号" />
					</div>
				</div>

				<div class="unit clear">
					<div class="left"><span class="required">*</span><p class="subtitle">作者</p></div>
					<div class="right">
						<input type="text" id="author" class="text" placeholder="作者" />
					</div>
				</div>

				<!--下拉选择框-->
				<div class="unit clear">
					<div class="left"><p class="subtitle">图书分类</p></div>
					<div class="right">
						<span id="type" style="color: #2db7f5"></span>
						<select id="select">
							<option value="" id="opt">请选择</option>
							<option value="1">马克思主义、列宁主义、毛泽东思想、邓小平理论</option>
							<option value="2">哲学、宗教</option>
							<option value="3">文化、科学、教育、体育</option>
							<option value="4">政治、法律</option>
							<option value="5">历史、地理</option>
						</select>
					</div>
				</div>

				<div class="unit clear">
					<div class="left"><span class="required"></span><p class="subtitle">页数</p></div>
					<div class="right">
						<input type="text" id="pages" class="text" placeholder="图书页数" />
					</div>
				</div>

				<div class="unit clear">
					<div class="left"><span class="required"></span><p class="subtitle">定价</p></div>
					<div class="right">
						<input type="text" id="price" class="text" placeholder="定价" />
					</div>
				</div>

				<div class="unit clear">
					<div class="left"><p class="subtitle">出版时间</p></div>
					<div class="right">
						<input type="text" id="publishTime" class="ex-date" style="width: 180px;" value="" readonly/>
					</div>
				</div>

				<div class="unit clear">
					<div class="left"><span class="required"></span><p class="subtitle">出版社</p></div>
					<div class="right">
						<input type="text" id="publish" class="text" placeholder="出版社" />
					</div>
				</div>



				<div class="unit clear">
					<div class="left"><span class="required"></span><p class="subtitle">库存数量</p></div>
					<div class="right">
						<input type="text" id="size" class="text" placeholder="库存数量" />
					</div>
				</div>

				<div class="unit clear">
					<div class="left"><span class="required"></span><p class="subtitle">翻译</p></div>
					<div class="right">
						<input type="text" id="translate" class="text" placeholder="翻译" />
					</div>
				</div>


				<!--提交按钮-->
				<div class="unit clear" style="width: 800px;">
					<div style="text-align: center;">
						<!--表单提交时，必须是input元素，并指定type类型为button，否则ajax提交时，会返回error回调函数-->
						<input type="button" id="return" class="button no" value="返回" />
						<input type="button" id="save" class="button yes" value="保存" />
					</div>
				</div>
			</form>

		</div>
	</div>
</div>

<script type="text/javascript">

    // 页面一加载赋值表单
    $(document).ready(function(){
        // 地址栏参数
        var id = getQueryVariable("id");
        // get读取参数
        $.get("${pageContext.request.contextPath}/book/getBookDetail.do",{"id": id}, function(data){
            var data = data.data;
            console.log(data);
            // 页面一加载, 读取登录用户信息
            $("#bookName").val(data.name);
            $("#isbn").val(data.isbn);
            $("#author").val(data.author);
            $("#pages").val(data.pages);
            $("#price").val(data.price);
            $("#publishTime").val(data.publishTime);
            $("#publish").val(data.publish);
            $("#size").val(data.size);
            $("#translate").val(data.translate);
            $("#type").text(data.type);
            console.log(data.type);
        });

    });

    javaex.select({
        id : "select",
        isSearch : true,
        maxNum: 5,
        callback: function (rtn) {
//            console.log("selectValue:" + rtn.selectValue);
//            console.log("selectName:" + rtn.selectName);
            $("#type").text("");
        }

    });

    javaex.date({
        id : "publishTime",	// 承载日期组件的id
        isTime : true,
        date : "2018-04-15 01:01:01",	// 选择的日期
        // 重新选择日期之后返回一个时间对象
        callback : function(rtn) {
        }
    });

    // 获取地址栏参数
    function getQueryVariable(variable){
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i=0;i<vars.length;i++) {
            var pair = vars[i].split("=");
            if(pair[0] == variable){return pair[1];}
        }
        return false;
    }

    // 监听点击保存按钮事件
    $("#save").click(function() {
        // 获取输入内容
        var bookName = $("#bookName").val();
        var isbn = $("#isbn").val();
        var author = $("#author").val();
        var select = $('#select option:selected').text();// 类目
		if (select == ""||select == "请选择") {
		    select = $("#type").text();
		}
        var pages = $("#pages").val();
        var price = $("#price").val();
        var publishTime = $("#publishTime").val();
        var publish = $("#publish").val();
        var size = $("#size").val();
        var translate = $("#translate").val();

        // 校验文本
        if (bookName == "") {
            javaex.optTip({
                content : "图书名称不能为空!",
                type : "error"
            });

            return false;
        }

        if (isbn == "") {
            javaex.optTip({
                content : "ISBN图书编码不能为空!",
                type : "error"
            });

            return false;
        }

        if (author == "") {
            javaex.optTip({
                content : "图书作者不能为空!",
                type : "error"
            });

            return false;
        }

        if (select == "") {
            javaex.optTip({
                content : "图书分类不能为空!",
                type : "error"
            });

            return false;
        }

        var id = getQueryVariable("id");
        // 表单数据
        var json = {"id":id,"isbn":isbn,"name":bookName,"author":author,"pages":pages,"translate":translate,"publish":publish,"price":price,"size":size,"type":select,"publishTime":publishTime};

        // 提交
        // ajax 示例
        $.ajax({
            //请求方式
            type : "POST",
            //请求的媒体类型
            contentType: "application/json;charset=UTF-8",
            //请求地址
            url : "${pageContext.request.contextPath}/book/updateBook.do",
            //数据，json字符串
            data : JSON.stringify(json),
            //请求成功
            success : function(result) {
                console.log(result);
                // 获取集合属性
                var data = result.data;
                var code = result.code;

                if (code == 200) {
                    if (data == false){
                        javaex.message({
                            content : "修改失败",
                            type : "error"
                        });
					}else {
                        javaex.message({
                            content : "修改成功",
                            type : "success"
                        });
                        // 修改成功, 跳转页面
                        setTimeout(function(){window.location.href="${pageContext.request.contextPath}/book/book-list.jsp";},1500)
					}

                    // 跳转至列表
//                    window.location.href="/book/book-list";
                }

            },
            //请求失败，包含具体的错误信息
            error : function(e){
                console.log(e.status);
                console.log(e.responseText);
            }
        });

    });

    // 监听点击返回按钮事件
    $("#return").click(function() {
        window.location.href = "${pageContext.request.contextPath}/book/book-list.jsp";
    });
</script>
</body>
</html>