package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.Article;

@Mapper
public interface ArticleDao {
	
	public Article writeArticle(String title, String body);

	public List<Article> getArticles();
	
	public Article getArticleById(int id);

	public void modifyArticle(Article foundArticle, String title, String body);

	public void deleteArticle(Article foundArticle);
}
