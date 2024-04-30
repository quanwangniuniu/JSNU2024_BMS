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

<body>
    <!--主体内容-->
<div class="list-content">
	<!--块元素-->
	<div class="block">
		<!--页面有多个表格时，可以用于标识表格-->
		<h2>图书列表</h2>
		<!--右上角的返回按钮-->
		<a href="javascript:history.back();">
			<button class="button indigo radius-3" style="position: absolute;right: 20px;top: 16px;"><span class="icon-arrow_back"></span> 返回</button>
		</a>
		
		<!--正文内容-->
		<div class="main">
			<!--表格上方的搜索操作-->
			<div class="admin-search">
				<div class="input-group">
					<input id="keyword" type="text" class="text" placeholder="提示信息" />
					<button id="searchBtn" class="button blue" onclick="search();">搜索</button>
				</div>
			</div>
			
			<!--表格上方的操作元素，添加、删除等-->
			<!--
			<div class="operation-wrap">
				<div class="buttons-wrap">
					<button class="button blue radius-3"><span class="icon-plus"></span> 添加</button>
					<button class="button red radius-3"><span class="icon-close2"></span> 删除</button>
				</div>
			</div>
			-->
			<table id="table" class="table color2">
				<thead>
					<tr align="center">
						<th>序号</th>
						<th>书名</th>
						<th>作者</th>
						<th>ISBN</th>
						<th>页数</th>
						<th>定价</th>
						<th>出版社</th>
						<th>出版时间</th>
						<th>库存数量</th>
						<th>翻译</th>
						<th>分类</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="tbody">
					<!--<tr>-->
						<!--<td class="checkbox"><input type="checkbox" class="fill listen-1-2" /> </td>-->
						<!--<td>1</td>-->
						<!--<td><button class="button blue">编辑</button><button class="button red">删除</button></td>-->
					<!--</tr>-->
				</tbody>
            </table>
            
            <div class="page">
                <ul id="page" class="pagination"></ul>
            </div>
		</div>
    </div>
</div>


<script type="text/javascript">

    // 页面一加载, 展示数据列表, 每页10条
    $(document).ready(function(){
        // 默认查询所有
		rander(1,"",10);
    });

    // 渲染数据表格
	function rander(currPage,keyword,pageSize) {
        // 定义全局 分页属性
        $.ajax({
            //请求方式
            type : "POST",
            //请求的媒体类型
            contentType: "application/json;charset=UTF-8",
            //请求地址
            url : "${pageContext.request.contextPath}/book/getBookList.do",
            //数据，json字符串
            data : JSON.stringify({"currPage":currPage,"keyword": keyword,"pageSize": pageSize}),
            //请求成功
            success : function(result) {
                console.log(result);
                // 获取集合属性
                var r = result.data;
                var total = r.total;
                var currPage = r.currPage;
                var pageSize = r.pageSize;
                // 分页信息
                console.log("currPage:"+r.currPage+"\t pageSize:"+r.pageSize+"\t total:"+r.total);

                var array = r.list;
                var text = "";
                $.each(array,function(index,value){
                    console.log(value);
                   var num = pageSize * (currPage - 1) + index + 1;
                    text+= "<tr align='center'><td>"+num+"</td><td>"+value.name+"</td><td>"+value.author+"</td><td>"+value.isbn+"</td>" +
                        "<td>"+value.pages+"</td><td>"+value.price+"</td><td>"+value.publish+"</td><td>"+new Date(value.publish_time).toLocaleString().split(" ")[0].replaceAll("/","-") +"</td>" +
                        "<td>"+value.size+"</td><td>"+value.translate+"</td><td>"+value.type+"</td><td>"+
                        "<button class='button blue empty' onclick='updateBook("+value.id+")'>编辑</button> &nbsp;<button class='button yellow empty' onclick='delBook("+value.id+")'>删除</button></td></tr>";
                });

                $("#tbody").html(text);

                // 向上取整去总页数
                var totalPage = Math.ceil(total/pageSize);
                console.log("totalPage:"+totalPage);
                // 清空分页组件
                $("#page").empty();
                // 调用分页组件
                javaex.page({
                    id : "page",
                    pageCount : totalPage,	// 总页数
                    currentPage : currPage,// 默认选中第几页
                    perPageCount : pageSize ,	// 每页显示多少条，不填时，不显示该条数选择控件
                    isShowJumpPage : false,	// 是否显示跳页
                    totalNum : total,		// 总条数，不填时，不显示
                    position : "center",
                    callback : function(rtn) {
                        // 翻页
                        rander(rtn.pageNum,keyword,rtn.perPageCount);
                    }
                });
            },
            //请求失败，包含具体的错误信息
            error : function(e){
                console.log(e.status);
                console.log(e.responseText);
            }
        });
    }

    // 搜索
    function search() {
        // 获取搜索关键字
        var keyword = $("#keyword").val();
        // 搜索结果渲染表格
        rander(1,keyword,10);
    }

    // 编辑
    function updateBook(id) {
	    console.log("update Book"+id);
		window.location.href="${pageContext.request.contextPath}/book/getBookUpdate.do?id="+id;
    }

    // 删除
    function delBook(id) {
        console.log("delete Book"+id);
        javaex.confirm({
            content : "确定要删除么",
            callback : "delCallback("+id+")"
        });
    }

    function delCallback(id) {
		// ajax
        $.get("${pageContext.request.contextPath}/book/delBook.do",{"id": id},
            function(data){
                var code = data.code;
                if (code == 200) {
                    javaex.message({
                        content : "删除成功",
                        type : "success"
                    });

                    // 删除成功, 刷新页面
                    setTimeout(function(){ window.location.reload();},1500)
				}
            });
        // 如果你想阻止弹出层关闭，直接 return false; 即可
        //return false;
    }
</script>
</body>
</html>