package com.pb.news.service;

import java.util.List;

import com.pb.news.entity.NewsCategory;

public interface NewsCategoryService {

		
	//获取新闻分类列表
	public List<NewsCategory> getNewsCategoryList();
}
