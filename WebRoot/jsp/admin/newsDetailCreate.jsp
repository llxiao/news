<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.pb.news.entity.NewsCategory"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common/common.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor/ckeditor.js"></script>
	</head>
<body>
<%
	 //取得新闻分类列表
   List<NewsCategory> newsCategoryList= new ArrayList<NewsCategory>();
   newsCategoryList=newsCategoryService.getNewsCategoryList();
   request.setAttribute("newsCategoryList", newsCategoryList);
 %>
<form name ="dataFrm" id="dataFrm" action="<%=request.getContextPath() %>/servlet/AddNewsServlet" method="post" enctype="multipart/form-data">
	<table  width="100%" border="0" cellspacing="5" cellpadding="0">
		<thead>
			<tr><td align="center" colspan="2" class="text_tabledetail2">增加新闻</td></tr>
		</thead>
		<tbody>
			<tr>
				<td style="text-align:right;" class="text_tabledetail2">分类</td>
				<td style="text-align:left;">
				<!-- 列出所有的新闻分类 -->
					<select name="categoryId">
	        			<c:if test="${newsCategoryList != null }">
							<c:forEach var="newsCategory" items="${newsCategoryList }">
								<option value="${newsCategory.id }">${newsCategory.name}</option>
							</c:forEach>
						</c:if>
	        		</select>
				</td>
			</tr>
			<tr>
				<td style="text-align:right;" class="text_tabledetail2">标题</td>
				<td style="text-align:left;"><input type="text" name="title" value=""/></td>
			</tr>
			<tr>
				<td style="text-align:right;" class="text_tabledetail2">作者</td>
				<td style="text-align:left;"><input type="text" name="author" value=""/></td>
			</tr>
			
			<tr>
				<td style="text-align:right;" class="text_tabledetail2">摘要</td>
				<td style="text-align:left;"><textarea id="summary" name="summary" rows="8" cols="50"></textarea></td>
			</tr>
			<tr>
				<td style="text-align:right;" class="text_tabledetail2">内容</td>
				<td style="text-align:left;">
				<div id="xToolbar"></div>
				<textarea id="newscontent" name="newscontent" rows="8" cols="30" class="ckeditor"></textarea></td>
			</tr>
			<tr>
				<td style="text-align:right;" class="text_tabledetail2">上传图片 </td>
				<td style="text-align:left;"><input type="file" name="picPath" value=""/></td>
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