<%@page import="com.pb.news.util.PageSupport"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.pb.news.entity.News"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common/common.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
	function addNews() {
		window.location = "newsDetailCreate.jsp";
	}

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
<div class="main-content-right">
	<!--即时新闻-->
	<div class="main-text-box">
		<div class="main-text-box-tbg">
			<div class="main-text-box-bbg">
				<form name="searchForm" id="searchForm" action="/news/jsp/admin/newsDetailList.jsp" method="post">
					<div>
						新闻分类：
						<select name="categoryId">
							<option value="0">全部</option>

							<option value='1'>国内</option>

							<option value='2'>国际</option>

							<option value='3'>娱乐</option>

							<option value='4'>军事</option>

							<option value='5'>财经</option>

							<option value='6'>天气</option>

						</select> 新闻标题<input type="text" name="title" id="title" value='' />
						<button type="submit" class="page-btn">GO</button>
						<button type="button" onclick="addNews();" class="page-btn">增加</button>
						<input type="hidden" name="pageIndex" value="1" /> 
					</div>
				</form>
				<table cellpadding="1" cellspacing="1" class="admin-list">
					<thead>
						<tr class="admin-list-head">
							<th>新闻标题</th>
							<th>作者</th>
							<th>时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<%
						//页面容量
						int pageSize = 2;
						//当前页码
						String pageIndex=request.getParameter("pageIndex");
						int currentPageNo = 1;
						if(pageIndex == null){
							currentPageNo = 1;
						}else{
							try{
								currentPageNo = Integer.parseInt(pageIndex);
							}catch(NumberFormatException e){
								response.sendRedirect("error.jsp");
							}	
						}
						//总记录数
						int totalCount = newsService.getNewsCount();
						//总页数
						PageSupport pageSupport = new PageSupport();
						pageSupport.setPageSize(pageSize);
						pageSupport.setCurrentPageNo(currentPageNo);
						pageSupport.setTotalCount(totalCount);
						int totalPageCount=pageSupport.getTotalPageCount();
						//首页尾页的异常控制		
						if(currentPageNo< 1){
							currentPageNo = 1;
						}	
						if(currentPageNo>totalPageCount){
							currentPageNo = totalPageCount;
						}	
						List<News> newsList = newsService.getPageNewsList(currentPageNo, pageSize);
						request.setAttribute("newsList", newsList);
						/* int i = 0;
						for (News news : newsList) {
							request.setAttribute("news", news);
							i++; */
					%>
					<tbody>
					<input type="hidden" id="totalPageCount" name="totalPageCount" value="<%=totalPageCount%>"/>
						<c:forEach var="news" items="${newsList}" varStatus="status">
							<tr <c:if test="${status.count%2==0 }">class="admin-list-td-h2"</c:if>>
								<td>
									<a href='adminNewsView.jsp?id=${news.id}'>
										<c:out value="${news.title}"></c:out>
									</a>
								</td>
								<td>
									<c:out value="${news.author}" default="暂无"></c:out>
								</td>
								<%-- <td>
									<%=new SimpleDateFormat("yyyy-MM-dd").format(news.getCreateDate())%>
								</td> --%>
								<td><fmt:formatDate value="${news.createDate}" pattern="yyyy-MM-dd" /></td>
								<td>
									<a href='adminNewsCreate.jsp?id=${news.id}'>修改</a>
									<a href="javascript:if(confirm('确认是否删除此新闻？')) location='adminNewsDel.jsp?id=${news.id}'">删除</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<%
					//	}
					%>
				</table>
				<div class="page-bar">
					<ul class="page-num-ul clearfix">
						<li>共
							<%=totalCount %>条记录&nbsp;&nbsp;
							<%=currentPageNo %>/
							<%=totalPageCount %>页</li>&nbsp;&nbsp;
						<%if(currentPageNo > 1){ %>
						<a href="javascript:page_nav(document.forms[0],1);">首页</a>
						<a href="javascript:page_nav(document.forms[0],<%=currentPageNo-1%>);">上一页</a>
						<%}
						if(currentPageNo<totalPageCount){
						 %>
						<a href="javascript:page_nav(document.forms[0],<%=currentPageNo+1%>);">下一页</a>
						<a href="javascript:page_nav(document.forms[0],<%=totalPageCount%>);">最后一页</a>
						<%} %>&nbsp;&nbsp;
					</ul>
					<span class="page-go-form"><label>跳转至</label> <input
						type="text" name="inputPage" id="inputPage" class="page-key" />页
						<button type="button" class="page-btn"
							onclick="jump_to(document.forms[0],document.getElementById('inputPage').value)">GO</button>
					</span>
				</div>
			</div>
		</div>
	</div>
</div>
</div>