package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Article;
import model.Tag;
import model.TagArticle;
import model.service.ITagArticleService;
import model.service.ITagService;
import model.service.impl.TagArticleService;
import model.service.impl.TagService;

@WebServlet("/tag")
public class TagFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private ITagArticleService tagArticleService;
	private ITagService tagService;
	List<Article> articles;
	
    public TagFrontController() {
        super();
        tagArticleService = new TagArticleService();
        tagService = new TagService();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		if(id!=null){
			
			articles = new ArrayList<>();
			Tag tag = tagService.findTagById(id);
			List<TagArticle> listTagArticle = tagArticleService.findTagArticleByTag(tag);
			
			for(TagArticle item: listTagArticle){
				Article a = item.getArticle();
				if(a!=null) articles.add(a);
			}
	
			request.setAttribute("tag", tag);
			
		} else{
			request.setAttribute("err_messagge", "Some error happended!");
		}
		
		if(articles.size()>0) request.setAttribute("lists", articles);
		
		showListArticle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void showListArticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		RequestDispatcher rd =  request.getRequestDispatcher("/views/web/tag.jsp");
		rd.forward(request, response);
	}
}
