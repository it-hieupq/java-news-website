package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Article;
import model.Category;
import model.service.IArticleService;
import model.service.ICategoryService;
import model.service.impl.ArticleService;
import model.service.impl.CategoryService;

@WebServlet(urlPatterns = {"/trang-chu", ""})
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IArticleService ar;
	private ICategoryService catService;
	
	public HomeController(){
		super();
		ar = new ArticleService();
		catService = new CategoryService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String search = req.getParameter("s");
		
		if(search==null || search.isEmpty()){

			List<Category> categories = catService.listCategory();
			Map<Category, List<Article>> params = new HashMap<>();
			for(Category cat :categories){
				List<Article> lists = ar.paginateArticleByCategoryId(cat, 3, 0);
				
				if(lists!=null && lists.size()>0)
					params.put(cat, lists);
			}
		
			List<Article> lastestArticle = ar.getLastestArticle(3, 0);
			List<Article> newArticle = ar.getLastestArticle(3, 3);
			List<Article> eventArticle = ar.getEventArticle(10);
			List<Article> hotArticle = ar.getStickyArticle(10);
		
			req.setAttribute("catWithArticle", params);
			req.setAttribute("lastestArticle", lastestArticle);
			req.setAttribute("newArticle", newArticle);
			req.setAttribute("eventArticle", eventArticle);
			req.setAttribute("hotArticle", hotArticle);
			
			RequestDispatcher rd = req.getRequestDispatcher("/views/home.jsp");
			rd.forward(req, resp);
			
		} else {
			resp.sendRedirect(req.getContextPath()+"/");
		}
	}

	private void showSearchResult(HttpServletRequest request, HttpServletResponse resp, String search) throws ServletException, IOException {

		int recordPerPage = 10;
		int total = ar.countSearchArticlePublished(search);
		int totalPage = 0; 
		
		if(total > 0){
			totalPage = (int) Math.ceil((float)total/recordPerPage);
			request.setAttribute("totalPage", totalPage);
		}
		
		int currentPage = 1;
		if(request.getParameter("page")!=null) 
			currentPage = Integer.parseInt(request.getParameter("page"));
		
		List<Article> results =new ArrayList<>();
		
		results = ar.search(search, recordPerPage, (currentPage-1)*recordPerPage);
		
		List<Article> relateArticle = ar.getStickyArticle(6);
		request.setAttribute("relateArticle", relateArticle);
		request.setAttribute("lists", results);
		request.setAttribute("totalResult", total);
		request.setAttribute("currentPage", currentPage);
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/web/search.jsp");
		rd.forward(request, resp);
		
	}
}

