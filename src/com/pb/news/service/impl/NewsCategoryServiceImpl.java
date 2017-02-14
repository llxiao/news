package com.pb.news.service.impl;

import java.util.List;

import com.pb.news.dao.NewsCategoryDao;
import com.pb.news.dao.impl.NewsCategoryDaoImpl;
import com.pb.news.dao.impl.NewsDaoImpl;
import com.pb.news.entity.NewsCategory;
import com.pb.news.service.NewsCategoryService;

public class NewsCategoryServiceImpl implements NewsCategoryService {

	private NewsCategoryDao newsCategoryDao = null;
	
	public NewsCategoryServiceImpl(){
		newsCategoryDao = new NewsCategoryDaoImpl();
	}

	@Override
	public List<NewsCategory> getNewsCategoryList() {
		// TODO Auto-generated method stub
		return newsCategoryDao.getNewsCategoryList();
	}
}
