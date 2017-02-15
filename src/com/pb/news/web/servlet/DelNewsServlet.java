package com.pb.news.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pb.news.entity.News;
import com.pb.news.service.NewsService;
import com.pb.news.service.impl.NewsServiceImpl;

public class DelNewsServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NewsService newsService = new NewsServiceImpl();
		String newsId = request.getParameter("id");
		int id = Integer.parseInt(newsId);
		News news = new News();
		news.setId(id);
		boolean bRet = newsService.delete(news);
		if (bRet) { // 成功
			response.sendRedirect(request.getContextPath()
					+ "/jsp/admin/newsDetailList.jsp");
		} else { // 失败
			request.getRequestDispatcher(
					request.getContextPath()
							+ "/jsp/admin/newsDetailCreate.jsp").forward(
					request, response);

		}
	}

}
