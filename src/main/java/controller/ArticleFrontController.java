package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Article;
import model.Comment;
import model.Tag;
import model.TagArticle;
import model.service.IArticleService;
import model.service.ICommentService;
import model.service.ITagArticleService;
import model.service.impl.ArticleService;
import model.service.impl.CommentService;
import model.service.impl.TagArticleService;

@WebServlet("/article")
public class ArticleFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IArticleService arService;
	private ICommentService cs;
	private ITagArticleService tagArticleService;
       
    public ArticleFrontController() {
        super();
        arService = new ArticleService();
        cs = new CommentService();
        tagArticleService = new TagArticleService();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if(id!=null){
			Article article = new Article();
			article.setId(id);
			Article result =  arService.findOneForFront(article);
		
			if(result!=null && result.getCategory()!=null){
				
				showArticle(request, response, result);
			} else{
				
			}
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public void showArticle(HttpServletRequest request, HttpServletResponse response, Article article) throws ServletException, IOException{
		
		List<Tag> tags = tagArticleService.getListTag(article);
		article.setListTags(tags);;
		List<Comment> comments = cs.findCommentByArticle(article);
		article.setListComments(comments);
		List<Article> relateArticle = arService.paginateArticleByCategoryId(article.getCategory(), 10, 0); 
		request.setAttribute("relateArticle", relateArticle);
		request.setAttribute("article", article);
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/web/article.jsp");
		rd.forward(request, response);
	}

}
