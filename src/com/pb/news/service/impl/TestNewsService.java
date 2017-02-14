package com.pb.news.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.pb.news.entity.News;
import com.pb.news.entity.NewsCategory;
import com.pb.news.service.NewsService;


public class TestNewsService {
	
	public static void main(String[] args){
		
		NewsService newsService = new NewsServiceImpl();
		
		
		/*NewsCategory newsCategory = new NewsCategory();
		newsCategory.setId(5);
		newsService.deleteNewsCategory(newsCategory);*/
		/*News news = new News();
		news=newsService.getNewsById(1);
		System.out.println(news.getTitle());*/
		//System.out.println("news  count =====>"+newsService.getNewsCount());
		List<News> newslist = new ArrayList<News>();
		newslist=newsService.getPageNewsList(1, 3);
		for (News news : newslist) {
			System.out.println(news.getId()+":"+news.getTitle());
		}
	}
}
