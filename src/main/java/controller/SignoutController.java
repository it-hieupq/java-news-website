package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.SessionUtil;

@WebServlet(urlPatterns = {"/dang-xuat"})
public class SignoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		SessionUtil.getInstance().removeValue(req, "user");
		resp.sendRedirect(req.getContextPath() + "/trang-chu");
	}
}
