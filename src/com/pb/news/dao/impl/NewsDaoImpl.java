package com.pb.news.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.pb.news.dao.BaseDao;
import com.pb.news.dao.NewsDao;
import com.pb.news.entity.News;

public class NewsDaoImpl extends BaseDao implements NewsDao {
	// 查询新闻信息
	public List<News> getNewsList() {
		List<News> newsList = new ArrayList<News>();
		try {
			// （3）获得Statement对象，执行SQL语句
			String sql = "SELECT n.*,"
					+ "c.name AS categoryName FROM news_detail n,news_category c "
					+ "WHERE n.categoryId = c.id";
			Object[] params = {};
			if (this.getConnection()) {
				ResultSet rs = this.executeSQL(sql, params);
				// （4）处理执行结果(ResultSet)，
				while (rs.next()) {
					int id = rs.getInt("id");
					String title = rs.getString("title");
					String summary = rs.getString("summary");
					String content = rs.getString("content");
					String author = rs.getString("author");
					String categoryName = rs.getString("categoryName");
					Timestamp createDate = rs.getTimestamp("createDate");

					News news = new News();
					news.setId(id);
					news.setTitle(title);
					news.setSummary(summary);
					news.setContent(content);
					news.setAuthor(author);
					news.setCreateDate(createDate);
					news.setCategoryName(categoryName);
					newsList.add(news);

					// System.out.println(id + "\t" + title + "\t" + summary +
					// "\t"+ content + "\t" + author + "\t" + createDate);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 释放资源
			this.closeResource();
		}
		return newsList;
	}

	// 增加新闻信息
	public boolean add(News news) {
		boolean flag = false;
		try {
			String sql = "insert into news_detail(id,categoryId,title,summary,content,createDate,author,picPath) "
					+ "values(?,?,?,?,?,?,?,?)";
			Object[] params = { news.getId(), news.getCategoryId(),
					news.getTitle(), news.getSummary(), news.getContent(),
					new java.sql.Timestamp(news.getCreateDate().getTime()),
					news.getAuthor(), news.getPicPath() };
			if (this.getConnection()) {
				int i = this.executeUpdate(sql, params);
				// （4）处理执行结果
				if (i > 0) {
					System.out.println("插入新闻成功！");
					flag = true;
				}
			}
		} finally {
			// 释放资源
			this.closeResource();
		}
		return flag;
	}

	// 删除新闻信息
	public boolean delete(News news) {
		boolean flag = false;
		try {
			String sql = "delete from  news_detail where id=?";
			Object[] params = { news.getId() };
			if (this.getConnection()) {
				int i = this.executeUpdate(sql, params);
				// （4）处理执行结果
				if (i > 0) {
					System.out.println("删除新闻成功！");
					flag = true;
				}
			}
		} finally {
			// 释放资源
			this.closeResource();
		}
		return flag;

	}

	// 修改新闻标题信息
	public boolean update(News news) {
		boolean flag = false;
		try {
			String sql = "update  news_detail set title=?,author=?,"
					+ "summary=?,content=?,modifyDate=?,"
					+ "picPath=? where id=?";
			Object[] params = { news.getTitle(), news.getAuthor(),
					news.getSummary(), news.getContent(), news.getModifyDate(),
					news.getPicPath(), news.getId() };
			if (this.getConnection()) {
				int i = this.executeUpdate(sql, params);
				// （4）处理执行结果
				if (i > 0) {
					System.out.println("修改新闻成功！");
					flag = true;
				}
			}
		} finally {
			// 释放资源
			this.closeResource();
		}
		return flag;
	}

	// @Override
	// public boolean deleteNewsCategory(NewsCategory newsCategory) {
	// // TODO Auto-generated method stub
	// String delNewsDetailSql = "delete from news_detail " +
	// "where categoryId=?";
	// String delNewsCategorySql = "delete from news_category " +
	// "where id=?";
	// //先删子表（news_detail）后删主表（news_category）
	// Object[] params = {newsCategory.getId()};
	// if(this.getConnection()){
	// int i = this.executeUpdate(delNewsDetailSql, params);
	//
	// if(i != -1){
	// int j = this.executeUpdate(delNewsCategorySql, params);
	// if(j > 0){
	// System.out.println("删除新闻类别成功！");
	// }
	// }
	//
	// this.closeResource();
	//
	// }
	//
	// return false;
	// }

	@Override
	public int getNewsCount(News news) {
		// TODO Auto-generated method stub
		int count = 0;
		String sql = "select count(1) AS count from news_detail "
				+ "where categoryId=?";
		Object[] params = { news.getCategoryId() };
		if (this.getConnection()) {
			ResultSet rs = this.executeSQL(sql, params);
			try {
				if (rs.next()) {
					count = rs.getInt("count");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				this.closeResource();
			}
		}
		return count;
	}

	@Override
	public News getNewsById(int id) {
		// TODO Auto-generated method stub

		News news = new News();
		String sql = "SELECT n.*,c.name AS categoryName FROM "
				+ "news_detail n,news_category c "
				+ "WHERE n.id=? AND n.categoryId = c.id;";
		Object[] params = { id };
		if (this.getConnection()) {

			ResultSet rs = this.executeSQL(sql, params);
			try {
				if (rs.next()) {
					news.setId(rs.getInt("id"));
					news.setTitle(rs.getString("title"));
					news.setAuthor(rs.getString("author"));
					news.setCategoryId(Integer.parseInt(rs
							.getString("categoryId")));
					news.setSummary(rs.getString("summary"));
					news.setPicPath(rs.getString("picPath"));
					news.setContent(rs.getString("content"));
					news.setCreateDate(rs.getTimestamp("createDate"));
					news.setCategoryName(rs.getString("categoryName"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				this.closeResource();
			}
		}
		return news;
	}

	@Override
	public int getNewsCount() {
		// TODO Auto-generated method stub
		int count = 0;
		String sql = "select count(*) as count from news_detail";
		Object[] params = {};
		if (this.getConnection()) {
			ResultSet rs = this.executeSQL(sql, params);
			try {
				if (rs.next()) {
					count = rs.getInt("count");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				this.closeResource();
			}
		}
		return count;
	}

	@Override
	public List<News> getPageNewsList(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List<News> newsList = new ArrayList<News>();
		String sql = "select id,title,author,createDate from news_detail "
				+ "order by createDate desc limit ?,?";
		pageNo = (pageNo - 1) * 2;
		Object[] params = { pageNo, pageSize };
		if (this.getConnection()) {
			ResultSet rs = this.executeSQL(sql, params);
			try {
				while (rs.next()) {
					News news = new News();
					news.setId(rs.getInt("id"));
					news.setTitle(rs.getString("title"));
					news.setAuthor(rs.getString("author"));
					news.setCreateDate(rs.getTimestamp("createDate"));

					newsList.add(news);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				this.closeResource();
			}
		}
		return newsList;
	}

}
