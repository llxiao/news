<%@page import="com.pb.news.entity.News"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改新闻信息</title>
</head>
<body>
<%
   String newsId = request.getParameter("id");
   int id = Integer.parseInt(newsId);
   List<News> newsList = newsService.getNewsList();
   News currentNews = null;
   for(News news:newsList){
   		if(news.getId()==id){
   			currentNews = news;
   			break;
   		}
   }
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
	        			<option value="1">国内</option>
	        			<option value="2">国际</option>
	        			<option value="3">娱乐</option>
	        			<option value="4">军事</option>
	        			<option value="5">财经</option>
	        			<option value="6">天气</option>
	        		</select>
				</td>
			</tr>
			<tr>
				<td style="text-align:right;" class="text_tabledetail2">标题</td>
				<td style="text-align:left;">
				<!-- 隐藏域存放新闻id -->
				<input type="text" name="newsId" id="newsId"value="<%=currentNews.getId()%>"/>
				<!-- 隐藏域存放新闻id -->
				<input type="text" name="title" value="<%=currentNews.getTitle()%>"/>
				
				</td>
			</tr>
			<tr>
				<td style="text-align:right;" class="text_tabledetail2">作者</td>
				<td style="text-align:left;"><input type="text" name="author" value="<%=currentNews.getAuthor()%>"/></td>
			</tr>
			
			<tr>
				<td style="text-align:right;" class="text_tabledetail2">摘要</td>
				<td style="text-align:left;"><textarea id="summary" name="summary" rows="8" cols="50"><%=currentNews.getSummary()%></textarea></td>
			</tr>
			<tr>
				<td style="text-align:right;" class="text_tabledetail2">内容</td>
				<td style="text-align:left;">
				<div id="xToolbar"></div>
				<textarea id="newscontent" name="newscontent" rows="8" cols="30" class="ckeditor"><%=currentNews.getContent()%></textarea></td>
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