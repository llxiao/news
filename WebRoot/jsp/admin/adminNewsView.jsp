<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.pb.news.entity.News"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/common.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		//调用后台方法，通过id查找新闻明细
		News news = new News();
		news = newsService.getNewsById(Integer.parseInt(id));
		request.setAttribute("news", news);
	%>

	<div class="main-content-right">
		<!--各专题的新闻列表-->
		<div class="main-text-box">
			<div class="article-place">
				<a href="#">新闻中心</a> > <a href="#">国内</a>
			</div>
			<div class="main-text-box-tbg">
				<div class="main-text-box-bbg">
					<div class="article-box">
						<!--新闻的标题-->

						<h1><c:out value="${news.title}"></c:out></h1>
						<div class="source-bar">
							发布者：<c:out value="${news.author}"></c:out>
							分类：<c:out value="${news.categoryName}"></c:out>
							更新时间：<fmt:formatDate value="${news.createDate}" pattern="yyyy-MM-dd" /></div>
						<div class="article-content">
							<span class="article-summary"><b>摘要：</b><c:out value="${news.summary}"></c:out></span>
							<c:choose>
								<c:when test="${news.picPath==null || news.picPath.equals('') }">
									新闻图片:暂无
								</c:when>
								<c:otherwise>
									<img  src="<%=request.getContextPath()%>/upload/${news.picPath}" width="200px" height="150px"/>
								</c:otherwise>
							</c:choose>
							<br />
							<p><c:out value="${news.content}" escapeXml="false"></c:out></p>
							<button type="button" class="page-btn" name="return" onclick="javascript:location.href='newsDetailList.jsp'">返回</button>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<!--//-->

	</div>
</body>
</html>