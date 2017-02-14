package com.pb.news.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

	@Override
	public List<NewsCategory> getNewsCategoryList() {
		List<NewsCategory> newsCategoryList = new ArrayList<NewsCategory>();
		// TODO Auto-generated method stub
		String sql = "select * from news_category";
		Object[] params = {};	
		if(this.getConnection()){
			ResultSet rs=this.executeSQL(sql, params);
			try {
				while (rs.next()) {
					NewsCategory newsCategory = new NewsCategory();
					newsCategory.setId(rs.getInt("id"));
					newsCategory.setName(rs.getString("name"));
					newsCategory.setCreateDate(rs.getTimestamp("createDate"));
					newsCategoryList.add(newsCategory);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				this.closeResource();
			}
		}
		
		return newsCategoryList;
	}

}
