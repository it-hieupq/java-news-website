package model.service;

import java.util.List;

import model.Article;
import model.Comment;
import model.User;

public interface ICommentService {
	
	public boolean addComment(Comment c, User u, Article a);
	public boolean deleteAllCommentByArticleId(Article article);
	public Comment findCommentById(Comment cmt);
	public List<Comment> findCommentByUserAndArticle(User u, Article a);
	public List<Comment> findCommentByArticle(Article a);
	public List<Comment> findCommentByUser(User u);
	public List<Comment> findAll();
	
	public List<Comment> paginationComment(int limit, int offset);
	
	public int countComment();
	public boolean updateCommentAdmin(Comment c);
	public boolean deleteCommentById(Comment cmt);
	
}
