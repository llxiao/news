<!-- 同学们可以使用Servlet代替本页面 -->
<%@ page language="java" pageEncoding="UTF-8"%>

<%
session.invalidate();//使用session失效
response.sendRedirect("enter.jsp");
%>