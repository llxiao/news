package com.pb.news.service;

import java.util.List;

import com.pb.news.entity.News;
import com.pb.news.entity.NewsCategory;

public interface NewsService {
	
	// 查询新闻信息
	public List<News> getNewsList();

	// 增加新闻信息
	public boolean add(News news) ;
		
	// 删除新闻信息
	public boolean delete(News news) ;
	
	// 修改新闻标题信息
	public boolean update(News news) ;
	
	//删除新闻类别(id)
	public boolean deleteNewsCategory(NewsCategory newsCategory);
	
	//根据新闻id查找新闻
	public News getNewsById(int id);
	
	//获取新闻的总数量
	public int getNewsCount();
	
	//获取分页列表
	public List<News> getPageNewsList(int pageNo,int pageSize);
}
