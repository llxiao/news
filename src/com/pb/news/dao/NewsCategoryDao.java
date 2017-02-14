package com.pb.news.dao;

import java.util.List;

import com.pb.news.entity.NewsCategory;

public interface NewsCategoryDao {
	//根据ID删除新闻类别
	public boolean deleteNewsCategory(NewsCategory newsCategory);
	
	//获取新闻分类列表
	public List<NewsCategory> getNewsCategoryList();
}
