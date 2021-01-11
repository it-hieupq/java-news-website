package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Comment;
import model.service.ICommentService;
import model.service.impl.CommentService;

@WebServlet("/admin/comments")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private ICommentService cs;
    
    public CommentController() {
        super(); 
        cs = new CommentService();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		String commentId = request.getParameter("id");
		
		if(action!=null && action.equalsIgnoreCase("edit") && commentId!=null){
			
			Comment cmt = cs.findCommentById(new Comment(commentId));
			
			if(cmt!=null) {
				request.setAttribute("comment", cmt);
				showEditForm(request, response);
			}
			else{
				request.setAttribute("err_message", "Comment with ID: " + commentId +" not found!");
			}
			
		} else if(action !=null && action.equalsIgnoreCase("delete")  && commentId!=null ){
			Comment cmt = cs.findCommentById(new Comment(commentId));
			boolean rs = cs.deleteCommentById(cmt);
			if(rs)
				request.setAttribute("success_message", "Comment has been deleted!");
			else 
				request.setAttribute("err_message", "Some error happend when delete comment. Please check again.");
			showListComment(request, response);
		} else {
			showListComment(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action = request.getParameter("action");
		String commentId = request.getParameter("id");
		if(action!=null && action.equalsIgnoreCase("edit") && commentId !=null ){
			Comment c = cs.findCommentById(new Comment(commentId));
			
			if(c!=null){
				c.setContent(request.getParameter("content"));
				boolean rs = cs.updateCommentAdmin(c);
				if(rs)  
					request.setAttribute("success_message", "Comment update successfully!");
				else 
					request.setAttribute("err_message", "Some error happend when update comment!");

			}else {
				request.setAttribute("err_message", "Comment not found!");
			}
		} 
		
		showListComment(request, response);
	}
	
	public void showListComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		int recordPerPage = 10;
		int total = cs.countComment();
		int totalPage = 0; 
		
		if(total > 0){
			totalPage = (int) Math.ceil((float)total/recordPerPage);
			request.setAttribute("totalPage", totalPage);
		}
		
		int currentPage = 1;
		if(request.getParameter("page")!=null) currentPage = Integer.parseInt(request.getParameter("page"));
		request.setAttribute("currentPage", currentPage);
		
		List<Comment> comments = cs.paginationComment(recordPerPage, (currentPage-1)*recordPerPage );
		
		request.setAttribute("comments", comments);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/comment_list.jsp");
		rd.forward(request, response);
	}
	
	public void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/comment_form.jsp");
		rd.forward(request, response);
	}

}
