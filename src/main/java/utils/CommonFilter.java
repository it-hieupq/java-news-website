package utils;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Category;
import model.User;
import model.service.impl.CategoryService;

@WebFilter("/*")
public class CommonFilter implements Filter {

	private CategoryService catService;
	
    public CommonFilter() {
    	catService = new CategoryService();
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		request.setCharacterEncoding("UTF-8");
		String uri = httpRequest.getRequestURI();
		String url = uri.substring(httpRequest.getContextPath().length(), uri.length());
		User user = (User) httpRequest.getSession().getAttribute("user");
		
		if( url.startsWith("/comment") && user==null ){
			res.sendRedirect(httpRequest.getContextPath()+"/login");
		}
		
		if( !url.startsWith("/admin/") && !url.startsWith("login") ){
			List<Category> categories = catService.listCategory();
			httpRequest.setAttribute("categories", categories);
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	
	}

}
