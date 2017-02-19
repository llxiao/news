<%@page import="com.pb.news.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.pb.news.entity.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
User user=null;
if(session.getAttribute("guest")==null){
	response.sendRedirect("enter.jsp");
}else{
	user=(User)session.getAttribute("guest");
%>
您好：<%= user.getUserName() %><br/>
此时在线人数为：<%=Constants.ONLINE_USER_COUNT%><br/>
<a href="doOut.jsp">离开</a>
<%} %>
</body>
</html>