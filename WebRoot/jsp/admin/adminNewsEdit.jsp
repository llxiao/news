<%@page import="java.util.ArrayList"%>
<%@page import="com.pb.news.entity.NewsCategory"%>
<%@page import="com.pb.news.service.impl.NewsServiceImpl"%>
<%@page import="com.pb.news.entity.News"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../common/common.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor/ckeditor.js"></script>
<title>修改新闻信息</title>
</head>
<body>
<%
  //取得要修改的新闻信息明细
   String newsId = request.getParameter("id");
   int id = Integer.parseInt(newsId);
   News news = newsService.getNewsById(id);
   
   //动态获取新闻分类信息
   //取得新闻分类列表
   List<NewsCategory> newsCategoryList= new ArrayList<NewsCategory>();
   newsCategoryList=newsCategoryService.getNewsCategoryList();
 
   //将得到信息放入作用域
   request.setAttribute("news", news);
   request.setAttribute("newsCategoryList", newsCategoryList);
  %>
   <form name ="dataFrm" id="dataFrm" action="doEdit.jsp" method="post" enctype="multipart/form-data">
	<table  width="100%" border="0" cellspacing="5" cellpadding="0">
		<thead>
			<tr><td align="center" colspan="2" class="text_tabledetail2">编辑新闻</td></tr>
		</thead>
		<tbody>
			<tr>
				<td style="text-align:right;" class="text_tabledetail2">分类</td>
				<td style="text-align:left;">
				<!-- 列出所有的新闻分类 -->
					<select name="categoryId">
						<c:if test="${newsCategoryList != null }">
							<c:forEach var="newsCategory" items="${newsCategoryList }">
								<option value="${newsCategory.id }" <c:if test="${newsCategory.id == news.categoryId }">selected="selected"</c:if>>${newsCategory.name}</option>
							</c:forEach>
						</c:if>
	        		</select>
				</td>
			</tr>
			<tr>
				<td style="text-align:right;" class="text_tabledetail2">标题</td>
				<td style="text-align:left;">
				<!-- 隐藏域存放新闻id -->
				<input type="hidden" name="newsId" id="newsId"value="${news.id}"/>
				<!-- 隐藏域存放新闻id -->
				<input type="text" name="title" value="${news.title}"/>
				
				</td>
			</tr>
			<tr>
				<td style="text-align:right;" class="text_tabledetail2">作者</td>
				<td style="text-align:left;"><input type="text" name="author" value="${news.author}"/></td>
			</tr>
			
			<tr>
				<td style="text-align:right;" class="text_tabledetail2">摘要</td>
				<td style="text-align:left;"><textarea id="summary" name="summary" rows="8" cols="50">${news.summary}</textarea></td>
			</tr>
			<tr>
				<td style="text-align:right;" class="text_tabledetail2">内容</td>
				<td style="text-align:left;">
				<div id="xToolbar"></div>
				<textarea id="newscontent" name="newscontent" rows="8" cols="30" class="ckeditor">${news.content}</textarea></td>
			</tr>
			<tr>
				<c:if test="${news.picPath == null }">
					<td style="text-align:right;" class="text_tabledetail2">上传图片 </td>
					<td style="text-align:left;"><input type="file" name="picPath" value=""/></td>
				</c:if>	
				<c:if test="${news.picPath != null }">
					<td style="text-align:right;" class="text_tabledetail2">图片</td>
					<td style="text-align:left;">
						<img  src="<%=request.getContextPath()%>/upload/${news.picPath}" width="200px" height="150px"/>
					</td>
				</c:if>	
			</tr>
			<tr>
				<td style="text-align:center;" colspan="2">
					<button type="submit" class="page-btn" name="save">保存</button>
					<button type="button" class="page-btn" name="return" onclick="javascript:location.href='newsDetailList.jsp'">返回</button>
				</td>
			</tr>
			
		</tbody>
	</table>
</form>

</body>
</html>