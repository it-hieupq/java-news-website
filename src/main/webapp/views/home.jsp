<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Chủ - Ptinews</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
<link rel="stylesheet" type="text/css" href="static/css/web/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="static/css/web/icomoon.css">
<link rel="stylesheet" type="text/css" href="static/css/web/poppin.css">
<link rel="stylesheet" type="text/css" href="static/css/web/themify-icons.css">
</head>

<body>
	<div class="container">
        
        <jsp:directive.include file="web/header.jsp" />
        
        <div id="content">
            <div class="banner">
                <img src="./static/image/banner-corona.jpg" alt="Corona banner">
            </div>

            <div class="content-content">
                <div class="content-left">
                    <div class="content-left-new">
                        <div class="title">
                            <h2 class="head-title">Tin mới</h2>
                        </div>
                        <div class="new-content">
                            
                            <div class="new-content-f1">
                                    <div class="f1-title">
                                        <h2> Mỹ nhân "Running Man" Song Ji Hyo trẻ đẹp ấn tượng trong phim mới</h2>
                                    </div>
                                    <div class="f1-content">
                                        <div class="f1-content-img">
                                            <img src="./static/image/ji.jpg" alt="jiji">
                                        </div>
                                        <div class="f1-content-description">
                                            Những hình ảnh trong buổi chụp quảng cáo cho bộ phim mới “Did We Love?” của Song Ji Hyo đã được hé lộ. Gần 40 tuổi, mỹ nhân của “Running Man” vẫn trẻ trung đến kinh ngạc.
                                        </div>
                                    </div>
                                </div>
                            
                            <!-- nhặt ra 3 bài mới nhất sau tin t1-->
                            <div class="new-content-slide">
	                            
	                            <c:forEach items="${lastestArticle}" var="item" varStatus="num">

	                                <div class="new-slide">
	                                    <a href="${pageContext.request.contextPath}/article?id=${item.id }">
	                                        <div class="slide-img">
	                                            <img src="<c:url value='/${item.thumnail }'/>" alt="${item.title }">
	                                        </div>
	                                        <div class="slide-content">
	                                            <b>${item.title }</b>
	                                        </div>
	                                    </a>
	                                </div>

	                            </c:forEach>
	                            
                            </div>

                        </div>
                    </div>

                    <div>
                        
                      <c:forEach items="${newArticle}" var="item">
                            <div style="width: 100%; margin: 12px 0;">
                                <div class="cate-row-content">
                                        <div class="cate-2">
                                            <div style="width: 32%">
                                                <a href="${pageContext.request.contextPath}/article?id=${item.id}"> 
                                                	<img style="width: 100%" src="<c:url value='/${item.thumnail }'/>" alt="${item.title }" /> 
                                                </a>
                                            </div>
                                            <div style="width: 68%; padding-left: 15px">
                                                  
                                                  <a href="${pageContext.request.contextPath}/article?id=${item.id}">
                                                	<h3>  ${item.title }</h3>
                                               	  </a>
                                               	  
                                               	  <div class="more-info" style="padding: 10px 0">
				                                	<small> Đăng ngày: ${item.createdDate }</small>, 
				                                	<small> Bởi: ${item.user.username } </small>
				                                </div>
				                                <div class="more-info" style="padding-bottom: 10px">
				                                	<small> Danh mục: ${item.category.name } </small>
				                                </div>
                                               	  
                                                  <p> ${item.description } </p>
                                            </div>
                                        </div>
                                </div>
                                
                            </div>
                       </c:forEach>
                       
                    </div>
                    
                    <!-- tin mới từng categories -->
                    
                    <div class="new-category">
                    
                    	<div class="title"  style="margin-bottom: 15px;">
                            <h2 class="head-title">Danh mục</h2>
                        </div>
                        
                        <c:forEach items="${catWithArticle}" var="entry">
                        
                        <div class="cate-col-row">
                            <div class="cell uncell">
                                <!-- menu -->
                                <div class="cate-row-menu">
                                    <ul>
                                        <li class="menu-f1"><a href="${pageContext.request.contextPath}/category?id=${entry.key.id }">${entry.key.name }</a></li>
                                    </ul>
                                </div>
                                
                                <c:forEach items="${entry.value }" var="item" varStatus="num"> 
                                	
                                <!-- bài mới nhất cate -->
                                <c:if test="${num.index == 0 }">
	                                <div class="cate-row-content">
	                                    <a href="">
	                                        <div class="cate-1">
	                                            <h4><a href="${pageContext.request.contextPath}/article?id=${item.id}">${item.title }</a></h4>
	                                        </div>
	                                        <div class="cate-2">
	                                            <div class="cate-2-img">
	                                            	<a href="${pageContext.request.contextPath}/article?id=${item.id}">
	                                                	<img src="<c:url value='/${item.thumnail }'/>" alt="${item.title }">
	                                                </a>
	                                            </div>
	                                            <div class="cate-2-des"> 
	                                            	${fn:substring(item.description, 0, 130)} <c:if test="${fn:length(item.description) > 150}"> ... </c:if>
	                                            </div>
	                                        </div>
	                                    </a>
	                                </div>
	                                
	                                <!-- danh sách các bài mới tiếp theo của cate -->
	                                <div class="cate-row-list">
	                                    <ul>
                                    
                                </c:if>
                                
                                	<c:if test="${num.index > 0 }">
                                        <li><a href=""> ${item.title } </a></li>
                                	</c:if>
                                
                                </c:forEach>
                                
                                 </ul>
                                </div>
                                
                            </div>
                        </div> <!-- end class = cate-col-row  -->
                        
                        </c:forEach>

                    </div> <!-- end class= new-category  -->

                </div>

                <div class="content-right">
                	
                	<div class="title">
                        <p>Tin đáng chú ý</p>
                    </div>
                    
                    <div class="link-list">
                        <ul>
	                        <c:forEach items="${hotArticle}" var="item">
	                            <li><a href="${pageContext.request.contextPath}/article?id=${item.id}">${item.title }</a></li>
	                        </c:forEach>
                        </ul>
                    </div>
                    
                    <br>
                
                    <div class="title">
                        <p>Sự kiện</p>
                    </div>
                    
                    <div class="link-list">
                        <ul>
                            <c:forEach items="${eventArticle}" var="item">
	                            <li><a href="${pageContext.request.contextPath}/article?id=${item.id}">${item.title }</a></li>
	                        </c:forEach>
                        </ul>
                    </div>
                    
                </div>
            </div>

        </div>
        
      <jsp:directive.include file="web/footer.jsp" /> <!-- FOOTER -->
    </div>
	
	<!--
    <jsp:directive.include file="web/form-login.jsp" /> <!-- FORM LOGIN -->
    
    <div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<h3>Đăng nhập</h3>
			<form action="dang-nhap" onsubmit="myFunction()" method="post">
				<div class="field">
					<span class="fa fa-user" aria-hidden="true"></span> <input
						type="text" placeholder="Email" name="email" id="email" required>
				</div>
				<div class="field space">
					<span class="fa fa-lock" aria-hidden="true"></span> <input
						type="password" placeholder="Mật khẩu" name="password"
						id="password" required>
				</div>
				<div class="forget">
					<a href="#">Quên mật khẩu?</a>
				</div>
				<div class="login">
					<div class="sub">
						<input type="submit" value="Đăng nhập" id="submit">
					</div>
				</div>
				<div class="signup">
					<span>Chưa có tài khoản?</span> <a href="sigup.html">Đăng kí</a>
				</div>
			</form>
		</div>
	</div>
	
	<script src="<c:url value='static/js/script.js'/>"></script>
</body>
</html>