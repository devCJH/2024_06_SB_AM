package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.vo.Article;

@Controller
public class UsrArticleController {
	
	private int lastArticleId;
	private List<Article> articles;
	
	public UsrArticleController() {
		this.lastArticleId = 0;
		this.articles = new ArrayList<>();
		
		makeTestData();
	}
	
	private void makeTestData() {
		for (int i = 1; i <= 10; i++) {
			String title = "제목" + i;
			String body = "내용" + i;
			
			writeArticle(title, body);
		}
	}

	private Article writeArticle(String title, String body) {
		Article article = new Article(++lastArticleId, title, body);
		this.articles.add(article);
		return article;
	}
	
	private Article getArticleById(int id) {
		for (Article article : this.articles) {			
			if (article.getId() == id) {
				return article;
			}
		}
		return null;
	}

	private void modifyArticle(Article foundArticle, String title, String body) {
		foundArticle.setTitle(title);
		foundArticle.setBody(body);
	}
	
	private void deleteArticle(Article foundArticle) {
		this.articles.remove(foundArticle);
	}

	@GetMapping("/usr/article/doWrite")
	@ResponseBody
	public Article doWrite(String title, String body) {
		return writeArticle(title, body);
	}
	
	@GetMapping("/usr/article/showList")
	@ResponseBody
	public List<Article> showList() {
		return this.articles;
	}
	
	@GetMapping("/usr/article/showDetail")
	@ResponseBody
	public Object showDetail(int id) {
		
		Article foundArticle = getArticleById(id);
		
		if (foundArticle == null) {
			return id + "번 게시물은 존재하지 않습니다";
		}
		
		return foundArticle;
	}
	
	@GetMapping("/usr/article/doModify")
	@ResponseBody
	public String doModify(int id, String title, String body) {
		
		Article foundArticle = getArticleById(id);
		
		if (foundArticle == null) {
			return id + "번 게시물은 존재하지 않습니다";
		}
		
		modifyArticle(foundArticle, title, body);
		
		return id + "번 게시물을 수정했습니다";
	}
	
	@GetMapping("/usr/article/doDelete")
	@ResponseBody
	public String doDelete(int id) {
		
		Article foundArticle = getArticleById(id);
		
		if (foundArticle == null) {
			return id + "번 게시물은 존재하지 않습니다";
		}
		
		deleteArticle(foundArticle);
		
		return id + "번 게시물을 삭제했습니다";
	}
}
