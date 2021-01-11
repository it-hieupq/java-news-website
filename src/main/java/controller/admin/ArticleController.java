package controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.Article;
import model.Category;
import model.Tag;
import model.TagArticle;
import model.User;
import model.service.IArticleService;
import model.service.ICategoryService;
import model.service.ICommentService;
import model.service.ITagArticleService;
import model.service.ITagService;
import model.service.impl.ArticleService;
import model.service.impl.CategoryService;
import model.service.impl.CommentService;
import model.service.impl.TagArticleService;
import model.service.impl.TagService;
import utils.FormUtil;
import utils.SessionUtil;

@WebServlet(urlPatterns = {"/admin/articles"})

@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 5, // 5MB
	maxFileSize = 1024 * 1024 * 10, // 10MB
	maxRequestSize = 1024 * 1024 * 10) // 10MB

public class ArticleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IArticleService articleService;
	private ITagService tagService;
	private ICategoryService categoryService;
	private ITagArticleService tas;
	private ICommentService cmtService;

	List<Article> articles;
	
	private static final String SAVE_DIR = "static/image/article";

	public ArticleController() {
		articleService = new ArticleService();
		tagService = new TagService();
		categoryService = new CategoryService();
		articles = new ArrayList<>();
		tas = new TagArticleService();
		cmtService = new CommentService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String action = req.getParameter("action");
		String articleId = req.getParameter("id");
		
		if (action != null && !action.equalsIgnoreCase("list")) {
			if (action.equalsIgnoreCase("delete") && articleId!=null) {
				
				Article deteleArticle = articleService.findOneById(new Article(articleId));
				
				if(deteleArticle!=null){
					cmtService.deleteAllCommentByArticleId(deteleArticle);
					tas.removeOldTagArticle(deteleArticle);
					boolean check = articleService.delete(deteleArticle);
					
					if(!deteleArticle.getThumnail().equalsIgnoreCase("static/image/article/noimage.jpg")){
						
						// gets absolute path of the web application
						String appPath = req.getServletContext().getRealPath("");
						// constructs path of the directory to save uploaded file
						String savePath = appPath + File.separator + SAVE_DIR;
						
						String oldName = deteleArticle.getThumnail();
						
						if(oldName!=null && !oldName.equals("")){
							String removeName = oldName.substring(oldName.lastIndexOf('/')+1);
							File file = new File(savePath+"/"+removeName); //DELETE FILE
							if (!file.isDirectory()) 
							      file.delete();
						}
					}
					
					if(check)
						req.setAttribute("success_message", "delete Article <b>"+ deteleArticle.getTitle() +"</b> successfully");
					else 
						req.setAttribute("err_message", "Some error happend when delete article <b>" + deteleArticle.getTitle() +"</b>. "
												+ "May be it's contain some comment that not be deleted!");
				}
				
				showListArticles(req, resp, articles);
				
			} else {
				List<Tag> tags = tagService.listAllTag();
				req.setAttribute("tags", tags);
				List<Category> categories = categoryService.listCategory();
				req.setAttribute("categories", categories);

				if (action.equalsIgnoreCase("create")) {
					RequestDispatcher rd = req.getRequestDispatcher("/views/admin/post_form.jsp");
					rd.forward(req, resp);
				} else if (action.equalsIgnoreCase("edit") && articleId!=null) {

					Article article = new Article();
					article.setId(articleId);
					article = articleService.findOneById(article);

					if(article!=null){
						showUpdateForm(req, resp, article);
					}
					else{
						req.setAttribute("err_message", "Article not found!");
						showListArticles(req, resp, articles);
					}
				}
			}
		} else {
			showListArticles(req, resp, articles);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		Article article = FormUtil.toModel(Article.class, req);

		Category cat = new Category();
		cat.setId(article.getCategoryName());
		cat = categoryService.findCategoryById(cat);
		article.setCategory(cat);

		User user = (User) SessionUtil.getInstance().getValue(req, "user");

		if (action != null && user!=null) {
			if (action.equalsIgnoreCase("create")) {
				
//UPLOAD FILE
				// gets absolute path of the web application
				String appPath = req.getServletContext().getRealPath("");
				// constructs path of the directory to save uploaded file
				String savePath = appPath + File.separator + SAVE_DIR;

				// creates the save directory if it does not exists
				File fileSaveDir = new File(savePath);
				if (!fileSaveDir.exists()) {
					fileSaveDir.mkdir();
				}
				
				Part part = req.getPart("thumnail");
				String fileName = extractFileName(part);
				
				if(fileName!=null && !fileName.equals("")){
					
					// refines the fileName in case it is an absolute path
					fileName = new File(fileName).getName();
					if( checkFileName(fileName) ){ 
						fileName = generatedString().concat(fileName);
						part.write(savePath + File.separator + fileName);
						article.setThumnail(SAVE_DIR + "/" +fileName);
					}
					
//					File file = new File(savePath+"/anh tessttt ne.jpgyhjinydlbw"); //DELETE FILE
//				    if (!file.isDirectory()) { 
//				      file.delete();
//				    }
				    
				}
		        
//	END UPLOAD FILE
				
				article.setUser(user);
				boolean rs = articleService.add(article);
				if(rs){
					String[] tagIds = req.getParameterValues("tagsIds");
					
					if(tagIds!=null){
						//add new tag_article after add an article.
						List<Tag> listTags = tas.saveListTag(article, tagIds);
						article.setListTags(listTags);
					}
					
					req.setAttribute("success_message", "Article <b>" +article.getTitle()+"</b> has been created!");
				}
				else req.setAttribute("err_message", "Some error unexpected happend when create article!");
				
			} else if (action.equalsIgnoreCase("edit")) { //update here
				
				String articleId = req.getParameter("id");
				article.setId(articleId);
				boolean existed = articleService.checkArticleExisted(article);
				boolean check = (articleId!=null && !articleId.isEmpty() && existed);
				
				if(check){
					
					// ========UPDATE IMAGE=========//
					
					// gets absolute path of the web application
					String appPath = req.getServletContext().getRealPath("");
					// constructs path of the directory to save uploaded file
					String savePath = appPath + File.separator + SAVE_DIR;

					// creates the save directory if it does not exists
					File fileSaveDir = new File(savePath);
					if (!fileSaveDir.exists()) {
						fileSaveDir.mkdir();
					}
					
					Part part = req.getPart("thumnail");
					String fileName = extractFileName(part);
					
					if(fileName!=null && !fileName.equals("")){
						
						// refines the fileName in case it is an absolute path
						fileName = new File(fileName).getName();
						if( checkFileName(fileName) ){ 
							String oldName = req.getParameter("oldthumnail");
							
							fileName = generatedString().concat(fileName);
							part.write(savePath + File.separator + fileName);
							article.setThumnail(SAVE_DIR + "/" +fileName);
							
							if(oldName!=null && !oldName.equals("") && !oldName.equalsIgnoreCase("static/image/article/noimage.jpg")){
								String removeName = oldName.substring(oldName.lastIndexOf('/')+1);
								File file = new File(savePath+"/"+removeName); //DELETE FILE
								if (!file.isDirectory()) 
								      file.delete();
							}
							
						}
					    
					} else {
						String oldThumnail = req.getParameter("oldthumnail");
						if(oldThumnail!=null)
							article.setThumnail(oldThumnail);
					}
					
					//==============END UPDATE IMAGE =============//
					article.setUser(user);
					boolean rs = articleService.update(article);
					
					if(rs){
						tas.removeOldTagArticle(article); // num row
						String[] tagIds = req.getParameterValues("tagsIds");
						if(tagIds!=null){
							List<Tag> listTags = tas.updateListTag(article, tagIds);
							article.setListTags(listTags);
						}
						
						req.setAttribute("success_message", "Article <b>" +article.getTitle()+"</b> has been updated!");
						
					} else 
						req.setAttribute("err_message", "Some error unexpected happend when update article!");
					
				}
				else req.setAttribute("err_message", "Something is wrong!");

			}
		}
		showListArticles(req, resp, articles); 
	}

	private void showListArticles(HttpServletRequest req, HttpServletResponse resp, List<Article> articles) throws ServletException, IOException {
			
		int recordPerPage = 10;
		int total = articleService.countAllArticle();
		int totalPage = 0; 
		
		if(total > 0){
			totalPage = (int) Math.ceil((float)total/recordPerPage);
			req.setAttribute("totalPage", totalPage);
		}
		
		int currentPage = 1;
		if(req.getParameter("page")!=null) currentPage = Integer.parseInt(req.getParameter("page"));
		req.setAttribute("currentPage", currentPage);
		
		articles = articleService.paginationArticleAdmin(recordPerPage, (currentPage-1)*recordPerPage);
		req.setAttribute("articles", articles);
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/post_list.jsp");
		rd.forward(req, resp);
		
	}
	
	public void showUpdateForm(HttpServletRequest req, HttpServletResponse resp, Article article) throws ServletException, IOException{
		List<TagArticle> tagArticles = tas.findTagArticleByArticle(article);
		
		List<Tag> listTags = new ArrayList<>();
		
		for(TagArticle item: tagArticles){
			if(item.getTag()!=null)
				listTags.add(item.getTag());
		}
		article.setListTags(listTags);
		
		req.setAttribute("article", article);
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/post_form_update.jsp");
		rd.forward(req, resp);
	}
	
	/**
     * Extracts file name from HTTP header content-disposition
     */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
    
    public String generatedString(){
		int leftLimit = 97; // letter 'a'
	    int rightLimit = 122; // letter 'z'
	    int targetStringLength = 10;
	    Random random = new Random();

	    String generatedString = random.ints(leftLimit, rightLimit + 1)
	      .limit(targetStringLength)
	      .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
	      .toString();
	    
	    return generatedString;
	}
    
    private boolean checkFileName(String fileName) {
		fileName = fileName.toLowerCase();
		String png  = "png";
		String jpg = "jpg";
		String jpeg = "jpeg";
		
		int index = fileName.lastIndexOf('.');
		boolean check1 =false;
		boolean check2 =false;
		boolean check3 = false;
		
		if(index>0){
			check1 = png.equalsIgnoreCase(fileName.substring(index+1));
			check2 = jpg.equalsIgnoreCase(fileName.substring(index+1));
			check3 = jpeg.equalsIgnoreCase(fileName.substring(index+1));
		} else return false;
		
		if(check1 || check2 ||check3) 
			return true;
		return false;
	}
	
}
