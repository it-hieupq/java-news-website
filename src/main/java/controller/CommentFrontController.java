package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Article;
import model.Comment;
import model.User;
import model.service.IArticleService;
import model.service.ICommentService;
import model.service.impl.ArticleService;
import model.service.impl.CommentService;

@WebServlet(urlPatterns = { "/comment" })
public class CommentFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IArticleService as;
	private ICommentService cs;
	public CommentFrontController() {
		as = new ArticleService();
		cs = new CommentService();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String articleId = req.getParameter("articleId");
		Article article = as.findOneById(new Article(articleId));
		User u = (User) req.getSession().getAttribute("user");
		
		if(article!=null && u!=null){
			Comment comment = new Comment();
			comment.setContent(req.getParameter("comment"));
			boolean result = cs.addComment(comment, u, article);
			if(!result) req.setAttribute("err_message", "Đã có lỗi xảy ra.");
		}
		
		resp.sendRedirect(req.getContextPath()+"/article?id=" + articleId );
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
	}
}
