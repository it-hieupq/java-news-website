package dao;

import java.util.List;

import model.Article;
import model.Category;
import model.TagArticle;

public interface IArticleDAO {
	List<Article> findAll();
	List<Article> findByTitle(String keyword, int limit, int offset);
	Article findOneById(Article article);
	Article findOneForFront(Article article);
	int save(Article article);
	boolean deleteArticle(Article article);
	boolean updateArticle(Article article);
	List<Article> getLastestArticle(int quantity, int offset);
	List<Article> getEventArticle(int quantity);
	List<Article> getStickyArticle(int quantity);
	List<Article> getArticleByCategoryId(Category cat, int limit,int offset);
	
	int countAllArticle();
	int countPublishedArticleInCategory(Category category);
	List<Article> paginationArticleAdmin(int limit, int offset);
	int countSearchArticlePublished(String search);
	
	boolean checkArticleExisted(Article article);
	
}
