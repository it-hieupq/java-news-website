<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Posts management - Admin Dashboard</title>
<link href="<c:url value='/static/css/style-admin.css'/>" rel="stylesheet">
<link href="<c:url value='/static/css/simple-sidebar-admin.css'/>" rel="stylesheet">
</head>

<body>
	<div class="d-flex" id="wrapper">
		<jsp:directive.include file="sidebar.jsp" />
		<div id="page-content-wrapper">
			<jsp:directive.include file="header.jsp" />
			<div>
				<div class="container">
					<h2 class="mb-2" align="center">Articles management</h2>
					
					<h3 align="center"> <a href="<c:url value='/admin/articles'/>?action=create" class="p-10"> New Article</a> </h3>
					
					<c:if test="${ err_message != null }">
						<div class="alert alert-danger" role="alert">${err_message}</div>
					</c:if>
	
					<c:if test="${ success_message != null }">
						<div class="alert alert-success" role="alert">
							${success_message}</div>
					</c:if>
					
					<table id="table-post">
						<tr>
							<th>ID</th>
							<th style="width: 25%">Thumbnail</th>
							<th>Title</th>
							<th>Category</th>
							<th>Status</th>
							<th>Action</th>
						</tr>
						<c:forEach var="article" items="${articles}"  varStatus="status">
							<tr>
								<td>${ status.index + 1 }</td>
								<td> <img style="max-width: 200px" src="<c:url value='/${article.thumnail }'/>" alt="${article.title }" /> </td>
								<td>${ article.title }</td>
								<td>${ article.category.name }</td>
								<td>${ article.status }</td>
								<td>
									<a class="btn" href="?action=edit&id=${article.id }">Edit</a>
									<button class="btn" onclick="confirmDelete('${article.id}')">Delete</button>
								</td>
							</tr>
						</c:forEach>
					</table>
					
					<c:if test="${ totalPage!=null && totalPage > 1}">
			          <div class="pagination mt-2 mb-2" align="center">
			          	<c:forEach begin="1" end="${totalPage }" varStatus="num">
			          		<c:if test="${num.index!=currentPage }">
					          	<a href="${pageContext.request.contextPath}/admin/articles?action=list&page=${num.index}"> 
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
			<jsp:directive.include file="footer.jsp" />
		</div>
	</div>
	<script>
		function myFunction() {
			var element1 = document.getElementById("navbarDropdown");
			var element2 = document.getElementById("menu-target");
			element1.classList.toggle("show");
			element2.classList.toggle("show");
		}
		function confirmDelete(id) {
			if (confirm('Xóa bài viết có ID là: ' + id + '?')) {
				window.location.href = '?action=delete&id=' + id;
			}
		}
	</script>
</body>

</html>