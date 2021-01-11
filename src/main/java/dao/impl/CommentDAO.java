package dao.impl;

import java.util.List;

import dao.ICategoryDAO;
import dao.ICommentDAO;
import model.Article;
import model.Category;
import model.Comment;
import model.User;
import model.mapper.impl.CommentMapper;

public class CommentDAO extends BaseDAO<Comment> implements ICommentDAO {

	@Override
	public boolean addComment(Comment c) {
		StringBuilder sql = new StringBuilder("INSERT INTO tbl_comment ");
		sql.append(" (id, content, status, created_date, last_modified, tbl_user_id, tbl_article_id) ");
		sql.append(" VALUES (?, ?, ?, ?, ?, ?, ?)");
		int rs = insert(sql.toString(), c.getId(), c.getContent(), c.getStatus(), c.getCreatedDate(), 
					c.getLastModified(), c.getUser().getId(), c.getArticle().getId());
		return rs > 0;
	}

	@Override
	public boolean updateComment(Comment c) {
		StringBuilder sql = new StringBuilder("UPDATE tbl_comment SET ");
		sql.append(" content = ?, last_modified = ? ");
		sql.append(" WHERE id = ?;");
		int rs = insert(sql.toString(), c.getContent(), c.getLastModified(), c.getId());
		return rs > 0; //true or false?
	}

	@Override
	public Comment findCommentById(Comment c) {
		StringBuilder sql = new StringBuilder("SELECT * FROM tbl_comment WHERE id = ?");
		List<Comment> lists = find(sql.toString(), new CommentMapper(), c.getId());
		
		if(lists!=null && lists.size()>0) return lists.get(0);
		
		return null;
	}

	@Override
	public List<Comment> findCommentByUserAndArticle(User u, Article a) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Comment> findCommentByArticle(Article article) {
		StringBuilder sql = new StringBuilder("SELECT * FROM tbl_comment WHERE tbl_article_id = ? ORDER BY created_date DESC");
		List<Comment> lists = find(sql.toString(), new CommentMapper(), article.getId());
		return lists;
	}

	@Override
	public List<Comment> findCommentByUser(User u) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Comment> findAll() {
		StringBuilder sql = new StringBuilder("SELECT * FROM tbl_comment ORDER BY created_date DESC");
		return find(sql.toString(), new CommentMapper());
	}

	@Override
	public int countComment() {
		StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM tbl_comment");
		return count(sql.toString());
	}

	@Override
	public List<Comment> paginationComment(int limit, int offset) {
		StringBuilder sql = new StringBuilder("SELECT * FROM tbl_comment ORDER BY created_date DESC LIMIT ? OFFSET ?"); //offset equals start.
		return find(sql.toString(), new CommentMapper(), limit, offset);
	}

	@Override
	public boolean deleteAllCommentByArticleId(Article article) {
		StringBuilder sql = new StringBuilder("DELETE FROM tbl_comment WHERE tbl_article_id = ?");
		int rs = insert(sql.toString(), article.getId());
		return rs > 0;
	}
	
	@Override
	public boolean deleteCommentById(Comment c) {
		StringBuilder sql = new StringBuilder("DELETE FROM tbl_comment WHERE id = ?");
		int rs = insert(sql.toString(), c.getId());
		return rs > 0;
	}

}
