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
import model.Category;
import model.service.IArticleService;
import model.service.ICategoryService;
import model.service.impl.ArticleService;
import model.service.impl.CategoryService;

@WebServlet("/category")
public class CategoryFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private IArticleService articleService;
    private ICategoryService catService;
    public CategoryFrontController() {
        super();
        articleService = new ArticleService();
        catService = new CategoryService();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		
		if( id!=null && !id.equals("")){
			Category catId = new Category();
			catId.setId(id);
			Category cat = catService.findCategoryById(catId);
			if(cat!=null){
				request.setAttribute("category", cat);
				showCategoryList(request, response, cat);
			}
		}
		
	}

	public void showCategoryList(HttpServletRequest request, HttpServletResponse response, Category cat) throws ServletException, IOException{
		
		int recordPerPage = 4;
		int total = articleService.countPublishedArticleInCategory(cat);
		int totalPage = 0;
		
		if(total > 0){
			totalPage = (int) Math.ceil((float)total/recordPerPage);
			request.setAttribute("totalPage", totalPage);
		}
		
		int currentPage = 1;
		if(request.getParameter("page")!=null) currentPage = Integer.parseInt(request.getParameter("page"));
		request.setAttribute("currentPage", currentPage);
		
		List<Article> articles = articleService.paginateArticleByCategoryId(cat, recordPerPage, (currentPage-1)*recordPerPage );
		request.setAttribute("lists", articles);
		
		List<Article> relateArticle = articleService.getStickyArticle(5);
		request.setAttribute("relateArticle", relateArticle);
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/web/category.jsp");
		rd.forward(request, response);
	}

}
