package model.service;

import java.util.List;

import model.Article;
import model.Category;
import model.TagArticle;

public interface IArticleService {
	List<Article> findAll();
	Article findOneById(Article article);
	List<Article> search(String keyword, int limit, int offset);
	boolean add(Article article);
	boolean delete(Article article);
	boolean update(Article article);
	List<Article> getEventArticle(int quantity);
	List<Article> getStickyArticle(int quantity);
	List<Article> getLastestArticle(int quantity, int offset);
	List<Article> paginateArticleByCategoryId(Category cat, int limit, int offset);
	Article findOneForFront(Article article);
	
	int countAllArticle();
	int countPublishedArticleInCategory(Category category);
	List<Article> paginationArticleAdmin(int limit, int offset);
	int countSearchArticlePublished(String search);
	boolean checkArticleExisted(Article article);
		
}
