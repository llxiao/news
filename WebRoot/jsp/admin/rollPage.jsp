<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../../css/common.css"/>
<script type="text/javascript">
	function page_nav(frm, num) {
		frm.pageIndex.value=num;
		frm.submit();
	}
	
	function jump_to(frm,pageno){
	 	var regexp=/^[1-9]\d*$/;
	 	var totalPage = document.getElementById("totalPageCount").value;
		if(!regexp.test(pageno)){
			alert("请输入 大于0的正整数!");
			return false;
		}else if((pageno-totalPage) > 0){
			alert("总页码一共"+totalPage+"页，请输入正确的页码！");
			return false;
		}else{
			page_nav(frm,pageno);
		}  	
	}
</script>
</head>
<body>
	<div class="page-bar">
		<ul class="page-num-ul clearfix">
			<li>共${param.totalCount}条记录&nbsp;&nbsp; ${param.currentPageNo}/ ${param.totalPageCount}页
			
			<c:if test="${param.currentPageNo>1}">
				<a href="javascript:page_nav(document.forms[0],1);">首页</a>
				<a
					href="javascript:page_nav(document.forms[0], ${param.currentPageNo-1});">上一页</a>
			</c:if>
			<c:if test="${param.currentPageNo<param.totalPageCount}">
				<a
					href="javascript:page_nav(document.forms[0], ${param.currentPageNo+1});">下一页</a>
				<a href="javascript:page_nav(document.forms[0], ${param.totalPageCount});">最后一页</a>
			</c:if>
			</li>
		
		</ul>
		<span class="page-go-form"><label>跳转至</label> <input
			type="text" name="inputPage" id="inputPage" class="page-key" />页
			<button type="button" class="page-btn"
				onclick="jump_to(document.forms[0],document.getElementById('inputPage').value)">GO</button>
		</span>
	</div>
</body>
</html>