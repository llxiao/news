package com.pb.news.service.impl;

import java.util.List;

import com.pb.news.dao.NewsCategoryDao;
import com.pb.news.dao.NewsDao;
import com.pb.news.dao.impl.NewsCategoryDaoImpl;
import com.pb.news.dao.impl.NewsDaoImpl;
import com.pb.news.entity.News;
import com.pb.news.entity.NewsCategory;
import com.pb.news.service.NewsService;

public class NewsServiceImpl implements NewsService {

	private NewsDao newsDao= null;
	private NewsCategoryDao newsCategoryDao = null;
	
	public NewsServiceImpl(){
		newsDao = new NewsDaoImpl();
		newsCategoryDao = new NewsCategoryDaoImpl();
	}
	


	@Override
	public List<News> getNewsList() {
		// TODO Auto-generated method stub
		return newsDao.getNewsList();
	}

	@Override
	public boolean add(News news) {
		// TODO Auto-generated method stub
		return newsDao.add(news);
	}

	@Override
	public boolean delete(News news) {
		// TODO Auto-generated method stub
		return newsDao.delete(news);
	}

	@Override
	public boolean update(News news) {
		// TODO Auto-generated method stub
		return newsDao.update(news);
	}
	/**
	 * 删除新闻类别，但是删除之前，你查询你的detail表，相关类别下有没新闻明细，
		若有，提示该类别下有新闻信息，请先删除新闻信息。
		若没，直接删除。
	 */
	
	@Override
	public boolean deleteNewsCategory(NewsCategory newsCategory) {
		// TODO Auto-generated method stub
		boolean flag = false;
		//根据categoryId查询新闻信息（count）
		News news = new News();
		news.setCategoryId(newsCategory.getId());
		int count = newsDao.getNewsCount(news);
		if(count > 0){
			System.out.println("该类别下有新闻信息，请先删除新闻信息");
		}else{
			//根据categoryId删除新闻类别
			flag = newsCategoryDao.deleteNewsCategory(newsCategory);
			System.out.println("新闻类别删除成功！");
		}
		
		return flag;
	}



	@Override
	public News getNewsById(int id) {
		// TODO Auto-generated method stub
		return newsDao.getNewsById(id);
	}



	@Override
	public int getNewsCount() {
		// TODO Auto-generated method stub
		return newsDao.getNewsCount();
	}



	@Override
	public List<News> getPageNewsList(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return newsDao.getPageNewsList(pageNo, pageSize);
	}





}
