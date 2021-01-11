package model.service.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import dao.IArticleDAO;
import dao.impl.ArticleDAO;
import model.Article;
import model.Category;
import model.Tag;
import model.TagArticle;
import model.service.IArticleService;
import model.service.ICategoryService;
import model.service.ITagArticleService;
import model.service.ITagService;
import model.service.IUserService;
import utils.SystemConst;

public class ArticleService implements IArticleService {

	IArticleDAO articleDAO;
	IUserService userService;
	ICategoryService categoryService;
	ITagService tagService;
	ITagArticleService tagArticleService;

	public ArticleService() {
		articleDAO = new ArticleDAO();
		userService = new UserService();
		categoryService = new CategoryService();
		tagService = new TagService();
		tagArticleService = new TagArticleService();
		
	}

	@Override
	public List<Article> findAll() {
		return articleDAO.findAll();
	}

	@Override
	public Article findOneById(Article article) {
		
		Article result = articleDAO.findOneById(article);
		
		if(result!=null)
			return result;
		return null;
	}

	@Override
	public boolean add(Article article) {
		if (article != null) {
			if (article.getUser() != null && article.getCategory() != null 
					&& article.getTitle() != null && !article.getTitle().isEmpty()) {
				
				article.setId(UUID.randomUUID().toString());
				if(article.getThumnail() == null) 
					article.setThumnail("static/image/article/noimage.jpg");
				
				if(article.getEvent() == null) {
					article.setEvent("unchecked");
				}
				
				if(article.getSticky() == null) {
					article.setSticky("unchecked");
				}
				if(article.getEvent() == null && article.getSticky() == null) {
					article.setEvent("unchecked");
					article.setSticky("unchecked");
				}
				
				article.setCreatedDate(new Date(System.currentTimeMillis()));
				article.setLastModified(new Date(System.currentTimeMillis()));
				
				int isSaved = articleDAO.save(article);
				boolean check = (isSaved == 1);
				
				return check;
			}
		}
		return false;
	}

	@Override
	public boolean delete(Article article) {
		return articleDAO.deleteArticle(article);
	}

	@Override
	public boolean update(Article article) {

		if (article != null) {
			if (article.getUser() != null && article.getCategory() != null && article.getId()!=null) {
				
				if(article.getTitle() == null || article.getTitle().isEmpty()) 
					article.setTitle("no title");
				
				if(article.getSticky()==null || !article.getSticky().equalsIgnoreCase("checked")) 
					article.setSticky("unchecked");
				if( article.getEvent()==null || !article.getEvent().equalsIgnoreCase("checked")) 
					article.setEvent("unchecked");
				if(article.getContent()==null) 
					article.setContent("");
				if(article.getDescription()==null) 
					article.setDescription("");
				if(article.getThumnail()==null) 
					article.setThumnail("");
				
				article.setLastModified(new Date(System.currentTimeMillis()));
				
				return (articleDAO.updateArticle(article) == true) ? true : false;
			}
		}
		return false;
	}
	
	@Override
	public List<Article> search(String keyword, int limit, int offset) {
		return articleDAO.findByTitle(keyword, limit, offset);
	}

	@Override
	public List<Article> getLastestArticle(int quantity, int offset) {
		return articleDAO.getLastestArticle(quantity, offset);
	}

	@Override
	public List<Article> getEventArticle(int quantity) {
		return articleDAO.getEventArticle(quantity);
	}

	@Override
	public List<Article> getStickyArticle(int quantity) {
		return articleDAO.getStickyArticle(quantity);
	}

	@Override
	public List<Article> paginateArticleByCategoryId(Category cat, int limit, int offset) {
		return articleDAO.getArticleByCategoryId(cat, limit, offset);
	}

	@Override
	public Article findOneForFront(Article article) {
		return articleDAO.findOneForFront(article);
	}

	@Override
	public int countAllArticle() {
		return articleDAO.countAllArticle();
	}

	@Override
	public int countPublishedArticleInCategory(Category category) {
		return articleDAO.countPublishedArticleInCategory(category);
	}

	@Override
	public List<Article> paginationArticleAdmin(int limit, int offset) {
		return articleDAO.paginationArticleAdmin(limit, offset);
	}

	@Override
	public int countSearchArticlePublished(String search) {
		return articleDAO.countSearchArticlePublished(search);
	}

	@Override
	public boolean checkArticleExisted(Article article) {
		return articleDAO.checkArticleExisted(article);
	}


}
