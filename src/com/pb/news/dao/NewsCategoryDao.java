package com.pb.news.dao;

import com.pb.news.entity.NewsCategory;

public interface NewsCategoryDao {
	//根据ID删除新闻类别
	public boolean deleteNewsCategory(NewsCategory newsCategory);
}
