package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import model.service.IUserService;
import model.service.impl.UserService;
import utils.FormUtil;
import utils.SessionUtil;

@WebServlet(urlPatterns = { "/dang-nhap" })
public class SigninController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	IUserService userService;

	public SigninController() {
		userService = new UserService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if (action != null && action.equals("logout")) {
			SessionUtil.getInstance().removeValue(req, "user");
//			RequestDispatcher rd = req.getRequestDispatcher("/views/home.jsp");
//			rd.forward(req, resp);
			resp.sendRedirect(req.getContextPath()+"/");
		}else {
			resp.sendRedirect(req.getContextPath()+"/");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		User user = FormUtil.toModel(User.class, req);
		user = userService.checkLogin(user);
		if (user != null) {
			req.getSession().setAttribute("user", user);
			
			//set cookie
			Cookie fullname = new Cookie("fullname", user.getUsername());
			Cookie email = new Cookie("email", user.getEmail());
			
			fullname.setMaxAge(60*60*24); 
			email.setMaxAge(60*60*24); 
			
//			resp.addCookie(fullname);
//			resp.addCookie(email);
			
			resp.sendRedirect(req.getContextPath() + "/");
		} else {
			resp.sendRedirect(req.getContextPath() + "/?action=login&message=error_info&alert=danger");
		}
	}
}
