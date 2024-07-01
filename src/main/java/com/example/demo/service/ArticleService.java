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
	
	public void writeArticle(int memberId, int boardId, String title, String body) {
		this.articleDao.writeArticle(memberId, boardId, title, body);
	}
	
	public List<Article> getArticles(int boardId, String searchKeywordType, String searchKeyword, int limitFrom, int itemsInAPage) {
		return this.articleDao.getArticles(boardId, searchKeywordType, searchKeyword, limitFrom, itemsInAPage);
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

	public int getArticlesCnt(int boardId, String searchKeywordType, String searchKeyword) {
		return this.articleDao.getArticlesCnt(boardId, searchKeywordType, searchKeyword);
	}

	public void increaseView(int id) {
		this.articleDao.increaseView(id);
	}
}
