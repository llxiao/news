package com.pb.news.dao.impl;

import com.pb.news.dao.BaseDao;
import com.pb.news.dao.NewsCategoryDao;
import com.pb.news.entity.NewsCategory;

public class NewsCategoryDaoImpl extends BaseDao implements NewsCategoryDao {

	@Override
	public boolean deleteNewsCategory(NewsCategory newsCategory) {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql = "delete from news_category where id = ?";
		Object[] params = {newsCategory.getId()};
		if(this.getConnection()){
			if(this.executeUpdate(sql, params) > 0)
				flag = true;
		}
		this.closeResource();
		return flag;
	}

}
