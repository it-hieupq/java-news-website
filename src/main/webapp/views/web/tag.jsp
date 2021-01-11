<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List article by tag: ${tag.name }</title>
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
                    <a class ="homepage" href="${pageContext.request.contextPath}">Trang chủ </a>
                    <a class ="active" href="${pageContext.request.contextPath}/tag?id=${tag.id}">${tag.name }</a>
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
		                                	<small> Đăng lúc: ${item.createdDate } </small>
		                                	<small>, Bởi: ${item.user.username }</small>
		                                </div>
		                                
		                                 <c:if test="${item.sticky =='checked' || item.event == 'checked' }">
                                              <div class="more-info" style="margin-bottom: 10px">
			                                	<c:if test="${item.sticky == 'checked' }"> <small class="event-news"> Tin hot </small> </c:if> 
			                                	<c:if test="${item.event == 'checked' }"> <small class="event-news"> Tin sự kiện </small> </c:if> 
			                                  </div>
		                                  </c:if>
		                                
                                        <p> ${item.description } </p>
                                        
                                    </div>
                                </div>
                            </div>
                            
                         </c:forEach>
                         
                         <c:if test="${ totalPage!=null && totalPage > 1}">
					          <div class="pagination mt-2 mb-2" align="center">
					          	<c:forEach begin="1" end="${totalPage }" varStatus="num">
					          		<c:if test="${num.index!=currentPage }">
							          	<a href="${pageContext.request.contextPath}/category?id=${category.id }&page=${num.index}"> 
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
                      <!-- NOTHING HERE -->  
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