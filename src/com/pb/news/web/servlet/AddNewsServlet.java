package com.pb.news.web.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.pb.news.entity.News;
import com.pb.news.service.NewsService;
import com.pb.news.service.impl.NewsServiceImpl;

public class AddNewsServlet extends HttpServlet {


	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NewsService newsService = new NewsServiceImpl();
		// 接收增加的新闻信息，并调用后台方法，将新闻信息插入数据库
		//request.setCharacterEncoding("utf-8");
		boolean bRet = false;
		boolean bUpload = false;
		String uploadFileName = "";
		String fieldName = "";
		News news = new News();
		news.setCreateDate(new Date());
		// 解析请求之前先判断请求类型是否为文件上传类型
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		// 指定上传位置
		//HttpSession对象
		String uploadFilePath = request.getSession().getServletContext()
				.getRealPath("upload/");

		File saveDir = new File(uploadFilePath);
		// 如果目录不存在，就创建目录
		if (!saveDir.exists()) {
			saveDir.mkdir();
		}

		if (isMultipart) {
			// 创建文件上传核心类
			FileItemFactory factory = new DiskFileItemFactory(); // 实例化一个硬盘文件工厂,用来配置上传组件ServletFileUpload
			ServletFileUpload upload = new ServletFileUpload(factory); // 用以上工厂实例化上传组件
			try {
				// 处理表单请求
				List<FileItem> items = upload.parseRequest(request);
				Iterator<FileItem> iter = items.iterator();
				while (iter.hasNext()) {
					FileItem item = (FileItem) iter.next();
					if (item.isFormField()) {// 如果是普通表单控件
						fieldName = item.getFieldName();// 获得该字段名称
						if (fieldName.equals("title")) {
							news.setTitle(item.getString("UTF-8"));
						} else if (fieldName.equals("categoryId")) {
							news.setCategoryId(Integer.parseInt(item
									.getString()));
						} else if (fieldName.equals("summary")) {
							news.setSummary(item.getString("UTF-8"));
						} else if (fieldName.equals("newscontent")) {
							news.setContent(item.getString("UTF-8"));
						} else if (fieldName.equals("author")) {
							news.setAuthor(item.getString("UTF-8"));
						}
					} else {// 如果为文件域
						String fileName = item.getName();// 获得文件名(全路径)
						if (fileName != null && !fileName.equals("")) {
							File fullFile = new File(fileName);
							File saveFile = new File(uploadFilePath,
									fullFile.getName());// 将文件保存到指定的路径
							item.write(saveFile);
							uploadFileName = fullFile.getName();
							news.setPicPath(uploadFileName);
							bUpload = true;

						}

					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			System.out.println("上传成功之后的文件名：" + news.getPicPath());
			// 调用后台的方法，将新闻信息插入数据库中
			bRet = newsService.add(news);
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


}
