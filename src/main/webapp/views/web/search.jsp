<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kết quả tìm kiếm cho: ${search }</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
<link rel="stylesheet" type="text/css" href="static/css/web/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="static/css/web/icomoon.css">
<link rel="stylesheet" type="text/css" href="static/css/web/poppin.css">
<link rel="stylesheet" type="text/css" href="static/css/web/themify-icons.css">
<link rel="stylesheet" type="text/css" href="static/css/web/flaticon.css">
<link rel="stylesheet" type="text/css" href="static/css/web/styleCategories.css">

</head>
<body>

	<div class="container">
	
	 <jsp:directive.include file="header.jsp" />
        
        <div id="content">
            <div class="content-header">
                <div class="content-header-top">
                    <h3 class="search-title-result"> Tìm thấy ${totalResult } kết quả với từ khóa: <c:out value = " ${search }"/> </h3>
                </div>
            </div>
            <div class="content-main">
            
                <div class="older-news">
                    <div class="col1">
                        <div class="list-news">
                        
                        <c:forEach items="${lists}" var="item">
                            
                            <div class="news container-item">
                                <div class="detail-item">
                                    <div class="img">
                                        <a href="${pageContext.request.contextPath}/article?id=${item.id}">
                                            <img src="<c:url value='/${item.thumnail }'/>" />
										</a>
                                    </div>
                                    <div class="desc">
                                    
	                                    <h2 class="title-news">
		                                    <a href="${pageContext.request.contextPath}/article?id=${item.id}">${item.title }</a>
		                                </h2>
		                                
		                                <div class="more-info" style="margin-bottom: 10px">
		                                	<small> Đăng ngày: ${item.createdDate }</small>,
		                                	<small> Bởi: ${item.user.username } </small>
		                                	
		                                </div>
		                                
                                        <p> ${item.description } </p>
                                        
                                    </div>
                                </div>
                            </div>
                            
                         </c:forEach>
                         
                         <c:if test="${ totalPage!=null && totalPage > 1}">
					          <div class="pagination mt-2 mb-2" align="center">
					          	<c:forEach begin="1" end="${totalPage }" varStatus="num">
					          		<c:if test="${num.index!=currentPage }">
							          	<a href="${pageContext.request.contextPath}?s=${search }&page=${num.index}"> 
								          	<button class="button-paginate"> ${num.index } </button> 
							          	</a>
						          	</c:if>
						          	
						          	<c:if test="${num.index==currentPage }"> 
						          		<button class="button-paginate" style="background-color: red; color:white"> ${num.index } </button>
						          	</c:if>
						          	
					          	</c:forEach>
					          </div>
				          </c:if>
                            
                        </div>
                    </div>
                    <div class="col2">
                        
                        <div class="news">
                            <div class = "news-header">
                                <a href="">CÓ THỂ BẠN QUAN TÂM</a>
                            </div>
                            <div class="news-body">
                                <ul class="list-link">
                                
                                <c:forEach items="${relateArticle}" var="item" varStatus="status">
                                	
                                	<c:if test="${status.index==0 }">
	                                    <li>
	                                        <div class="img">
	                                            <a href="${pageContext.request.contextPath}/article?id=${item.id}">
	                                                <img src="<c:url value='/${item.thumnail }'/>">
	                                            </a>
	                                        </div>
	                                        <div class="title">
	                                            <a href="${pageContext.request.contextPath}/article?id=${item.id}">
	                                                ${item.title }
	                                            </a>
	                                        </div>
	                                        <div class="desc">
	                                            <span> ${item.description } </span>
	                                        </div>
	                                    </li>
	                                    
	                                </c:if>
                                    <c:if test="${status.index>0 }">
                                    
	                                    <li>
	                                        <a href="${pageContext.request.contextPath}/article?id=${item.id}"> ${item.title } </a>
	                                    </li>
                                    
                                    </c:if>
                                    
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="pagenum"></div>
                </div>
            </div>
        </div>
        
         <jsp:directive.include file="footer.jsp" />
        
    </div>
    
     <jsp:directive.include file="form-login.jsp" />
    
    <script src="<c:url value='static/js/script.js'/>"></script>
</body>
</html>