<!-- 同学们可以使用Servlet代替本页面 -->
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.pb.news.entity.User" %>
<%
//从请求中取出访客名
String guestName=request.getParameter("guestName");
if(guestName==null||guestName.equals("")){
	response.sendRedirect("enter.jsp");
}else{ 
	User user=new User();//用户对象
	user.setUserName(guestName);//在user对象中保存访客名
	session.setAttribute("guest", user);//在session中保存user对象
	response.sendRedirect("online.jsp");
}
%>