package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.ArticleDao;
import com.example.demo.vo.Article;

@Service
public class ArticleService {
	
	private ArticleDao articleDao;
	
	public ArticleService(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}
	
	public void writeArticle(int memberId, String title, String body) {
		this.articleDao.writeArticle(memberId, title, body);
	}
	
	public List<Article> getArticles(int boardId) {
		return this.articleDao.getArticles(boardId);
	}
	
	public Article forPrintArticle(int id) {
		return this.articleDao.forPrintArticle(id);
	}
	
	public Article getArticleById(int id) {
		return this.articleDao.getArticleById(id);
	}

	public void modifyArticle(int id, String title, String body) {
		this.articleDao.modifyArticle(id, title, body);
	}
	
	public void deleteArticle(int id) {
		this.articleDao.deleteArticle(id);
	}

	public int getLastInsertId() {
		return this.articleDao.getLastInsertId();
	}

	public String getBoardNameById(int boardId) {
		return this.articleDao.getBoardNameById(boardId);
	}

	public int getArticlesCnt(int boardId) {
		return this.articleDao.getArticlesCnt(boardId);
	}
}
