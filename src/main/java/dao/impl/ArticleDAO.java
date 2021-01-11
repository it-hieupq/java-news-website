package dao.impl;

import java.util.List;

import dao.IArticleDAO;
import model.Article;
import model.Category;
import model.mapper.impl.ArticleMapper;
import utils.SystemConst;

public class ArticleDAO extends BaseDAO<Article> implements IArticleDAO {

	@Override
	public List<Article> findAll() { //use for admin dashboard
		StringBuilder sql = new StringBuilder("SELECT id, title, description, content, thumnail, status,");
		sql.append(" event, sticky, liked, created_date, last_modified, tbl_user_id, tbl_category_id");
		sql.append(" FROM tbl_article");
		return find(sql.toString(), new ArticleMapper());
	}

	@Override
	public Article findOneById(Article article) { //use for admin dashboard
		StringBuilder sql = new StringBuilder("SELECT *");
		sql.append(" FROM tbl_article WHERE id = ?");
		List<Article> articles = find(sql.toString(), new ArticleMapper(), article.getId());
		return (articles.size() > 0) ? articles.get(0) : null;
	}

	@Override
	public List<Article> findByTitle(String keyword, int limit, int offset) {
		StringBuilder sql = new StringBuilder("SELECT *");
		sql.append(" FROM tbl_article WHERE title LIKE ? AND status = 'published' ORDER BY title LIMIT ? OFFSET ? ");
		List<Article> articles = find(sql.toString(), new ArticleMapper(), "%" + keyword + "%", limit, offset);
		return (articles.size() > 0) ? articles : null;
	}

	@Override
	public int save(Article article) {
		StringBuilder sql = new StringBuilder("INSERT INTO tbl_article");
		sql.append(" (id, title, description, content, thumnail, status,");
		sql.append(" event, sticky, liked, created_date, last_modified,");
		sql.append(" tbl_user_id, tbl_category_id)");
		sql.append(" VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		return insert(sql.toString(), article.getId(), article.getTitle(), article.getDescription(),
				article.getContent(), article.getThumnail(), article.getStatus(), article.getEvent(),
				article.getSticky(), article.getLiked(), article.getCreatedDate(), article.getLastModified(),
				article.getUser().getId(), article.getCategory().getId());
	}

	@Override
	public boolean deleteArticle(Article article) {
		StringBuilder sql = new StringBuilder("DELETE FROM tbl_article WHERE id = ?");
		return update(sql.toString(), article.getId());
	}

	@Override
	public boolean updateArticle(Article article) {
		StringBuilder sql = new StringBuilder("UPDATE tbl_article");
		sql.append(" SET title=?, description=?, content=?, thumnail=?, status=?,");
		sql.append(" event=?, sticky=?, last_modified=?, tbl_user_id=?, tbl_category_id=?");
		sql.append(" WHERE id=?");
		return update(sql.toString(), article.getTitle(), article.getDescription(), article.getContent(),
				article.getThumnail(), article.getStatus(), article.getEvent(), article.getSticky(),
				article.getLastModified(), article.getUser().getId(), article.getCategory().getId(), article.getId());
	}

	@Override
	public List<Article> getEventArticle(int quantity) {
		StringBuilder sql = new StringBuilder("SELECT * FROM tbl_article WHERE event='checked' AND status = 'published' ORDER BY created_date DESC LIMIT ?");
		//SELECT * FROM tbl_article WHERE event='checked' ORDER BY created_date DESC LIMIT 2;
		return find(sql.toString(), new ArticleMapper(), quantity);
	}

	@Override
	public List<Article> getStickyArticle(int quantity) {
		// SELECT * FROM tbl_article WHERE sticky='checked' ORDER BY created_date DESC LIMIT 2;
		StringBuilder sql = new StringBuilder("SELECT * FROM tbl_article WHERE sticky='checked' AND status = 'published' ORDER BY created_date DESC LIMIT ?");
		return find(sql.toString(), new ArticleMapper(), quantity);
	}

	@Override
	public List<Article> getLastestArticle(int quantity, int offset) {
		StringBuilder sql = new StringBuilder("SELECT * FROM tbl_article WHERE status = 'published' ORDER BY created_date DESC LIMIT ? OFFSET ?");
		return find(sql.toString(), new ArticleMapper(), quantity, offset);
	}

	@Override
	public List<Article> getArticleByCategoryId(Category cat, int limit, int offset) {
//		SELECT * FROM tbl_article WHERE tbl_category_id = 'b6578f38-a071-4bdd-8ed7-08435647900d' ORDER BY created_date DESC LIMIT 3
		StringBuilder sql = new StringBuilder("SELECT * FROM tbl_article WHERE tbl_category_id = ? AND status = 'published' ORDER BY created_date DESC LIMIT ? OFFSET ?");
		return find(sql.toString(), new ArticleMapper(), cat.getId(), limit, offset);
	}

	@Override
	public Article findOneForFront(Article article) {
		StringBuilder sql = new StringBuilder("SELECT id, title, description, content, thumnail, status,");
		sql.append(" event, sticky, liked, created_date, last_modified, tbl_user_id, tbl_category_id");
		sql.append(" FROM tbl_article WHERE id = ? AND status = 'published' ");
		List<Article> articles = find(sql.toString(), new ArticleMapper(), article.getId());
		return (articles.size() > 0) ? articles.get(0) : null;
	}
	

	@Override
	public int countAllArticle() {
		StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM tbl_article");
		return count(sql.toString());
	}
	
	@Override
	public int countPublishedArticleInCategory(Category category) {
		StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM tbl_article WHERE status = 'published' AND tbl_category_id = ?");
		return count(sql.toString(), category.getId());
	}

	@Override
	public List<Article> paginationArticleAdmin(int limit, int offset) {
		StringBuilder sql = new StringBuilder("SELECT * FROM tbl_article ORDER BY title DESC LIMIT ? OFFSET ?"); 
		return find(sql.toString(), new ArticleMapper(), limit, offset);
	}

	@Override
	public int countSearchArticlePublished(String search) {
		StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM ptinewsdb_dev.tbl_article WHERE status= 'published' AND title LIKE ?;");
		return count(sql.toString(), "%" + search + "%" );
	}

	@Override
	public boolean checkArticleExisted(Article article) {
		StringBuilder sql = new StringBuilder("SELECT title FROM tbl_article WHERE id = ?");
		List<Article> list =  find(sql.toString(), new ArticleMapper(), article.getId());
		
		if(list!=null && list.size() >0) return true;
		return false;
	}
	
}
