<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${article.title }</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
<link rel="stylesheet" type="text/css" href="static/css/web/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="static/css/web/icomoon.css">
<link rel="stylesheet" type="text/css" href="static/css/web/poppin.css">
<link rel="stylesheet" type="text/css" href="static/css/web/themify-icons.css">
<link rel="stylesheet" type="text/css" href="static/css/web/flaticon.css">
<link rel="stylesheet" type="text/css" href="static/css/web/style-article.css">

</head>
<body>
	<div class="container">
        
        <jsp:directive.include file="header.jsp" />
        
        <div id="content">
            <div class="content-left">
                <div class="left-f1">
                    <!-- tên mục, ngày giờ up -->
                    <div class="cate-1">
                        <div class="cate-name">
                            <a href="${pageContext.request.contextPath}">Trang chủ</a> |
                            <a href="${pageContext.request.contextPath}/category?id=${article.category.id}"> ${article.category.name } </a>
                        </div>
                        <div class="time-post"> Đăng ngày ${article.createdDate } </div>
                    </div>
                    <!-- bài viết -->
                    <div class="cate-2">
                        <div class="cate-2-title">
                            <h1>${article.title }</h1>
                        </div>
                        <div class="cate-2-nd">
                            <!-- phần tóm tắt -->
                            <p class="des"><b> ${article.description } </b></p>
                            <!-- nội dung -->
                            <article class="noi-dung">
                                
                                ${article.content }
                                
                                <p class="nomal"><strong> Theo: ${article.user.username } </strong></p>
                                
                                <c:if test="${fn:length(article.listTags) > 0 }">
	                                <div>
	                                    <ul>
	                                        
	                                        <li><b>Từ khóa </b></li>
	                                        
	                                        <c:forEach items="${article.listTags}" var="tag"> 
		                                        <li><a href="${pageContext.request.contextPath}/tag?id=${tag.id}" class="tag-item">${tag.name }</a></li>
		                                    </c:forEach>
		                                    
	                                    </ul>
	                                </div>
                                </c:if>
                                
                            </article>
                            
                            <div style="margin-top: 24px">
                            	<p> Like bài viết này </p>
                            	<form id="likeBTN">
                            		<input type="hidden" name="articleId" value="${article.id }"/>
                            		<input type="hidden" name="userId" value="${user.id }"/>
                            		<input type="hidden" name="status" value=""/>
	                            	<button style="border:none; background-color: rgb(255 255 255 / 0%); outline: none; cursor: pointer" type="button">
	                            		<svg style="vertical-align: middle;" xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24"><path d="M21.216 8h-2.216v-1.75l1-3.095v-3.155h-5.246c-2.158 6.369-4.252 9.992-6.754 10v-1h-8v13h8v-1h2l2.507 2h8.461l3.032-2.926v-10.261l-2.784-1.813zm.784 11.225l-1.839 1.775h-6.954l-2.507-2h-2.7v-7c3.781 0 6.727-5.674 8.189-10h1.811v.791l-1 3.095v4.114h3.623l1.377.897v8.328z"/></svg>
	                            	</button>
                            	</form>
                            </div>
                            
                        </div>
                    </div>
                    <div class="cate-comment">
                        <h3>Bình luận</h3>
                       
                       <c:if test="${sessionScope.user == null}"> 
                       		<h4 style="margin-top: 20px; color: red"> <i> Bạn cần đăng nhập để bình luận </i> </h4>
                       </c:if>
                       
                       <c:if test="${sessionScope.user != null}"> 
	                        <div class="cmt">
	                            <form action="comment" method="post" class="form-cmt">
	                                <textarea name="comment" placeholder="Nhập bình luận của bạn" class="comment-field"></textarea>
	                                <input type="hidden" name="articleId" value="${article.id }"/>
	                                <input type="submit" value="Bình luận" class="gui">
	                            </form>
	                        </div>
                        </c:if>
                        
                        <c:if test="${fn:length(article.listComments) > 0}">
                        
                        	<h2 class="comment-heading" style="margin: 20px 0 10px;"> Những người khác nói gì? </h2>
                        
	                        <div class="list-comment" style="margin-top: 20px"> 
	                        
		                        <c:forEach items="${article.listComments}" var="comment">
		                        	<div style="margin-top: 10px"> 
		                        		<span> <b> Đăng bởi <c:out value = "${article.user.username }"/></b> 
		                        			, lúc <c:out value = "${comment.createdDate }"/> </span>
		                        		<p style="padding: 10px 0;"> <i> <c:out value = "${ comment.content }"/> </i></p>
		                        		<c:out value = ""/>
		                        		<hr>
		                        	</div>
		                        </c:forEach>
		                        
	                        </div>
                        
                        </c:if>
                        
                        <c:if test="${article.listComments == null || fn:length(article.listComments)  == 0 }">
                        	<h2 class="comment-heading" style="margin: 20px 0 10px;"> Chưa có bình luận nào. </h2>
                        </c:if>
                        
                    </div>
                </div>
            </div>
            <div class="content-right">
                <div class="fx">
                    <div class="right-title">
                        <h3>TIN LIÊN QUAN</h3>
                    </div>
                    <div class="right-2">
                        <ul>
                            <c:forEach items="${relateArticle}" var="item">
                            	<c:if test="${item.id != article.id }">
                            		<li><a href="${pageContext.request.contextPath}/article?id=${item.id}">${item.title }</a></li>
                            	</c:if>
							</c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        
       <jsp:directive.include file="footer.jsp" />
        
    </div>
    
	<jsp:directive.include file="form-login.jsp" />

    <script src="<c:url value='static/js/script.js'/>"></script>
</body>

<script type="text/javascript">
 
/* var form = $('#likeBTN');
form.submit(function () {
	
$.ajax({
	type: form.attr('method'),
	url: form.attr('action'),
	data: form.serialize(),
	success: function (data) {
	var result=data;
	$('#result').attr("value",result);
	 
	}
});
 
return false;
}); */
</script>

</html>