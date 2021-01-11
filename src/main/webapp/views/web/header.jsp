<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>                    

        <div id="header">
            <div class="header-content">
                <div class="header-top">
                    <div class="site-logo">
						<a href="${pageContext.request.contextPath}">
			                 <img src="./static/image/logo.png" alt="logo">
			            </a>
                    </div>

                    <form class="header-search" action="${pageContext.request.contextPath}" method="GET">
                            <input type="text" placeholder="Search.." name="s">
                            <button id="btn-search-main" type="submit">
								<svg xmlns="http://www.w3.org/2000/svg" style="vertical-align: middle; fill: black" width="20" height="24" viewBox="0 0 24 24"><path d="M21.172 24l-7.387-7.387c-1.388.874-3.024 1.387-4.785 1.387-4.971 0-9-4.029-9-9s4.029-9 9-9 9 4.029 9 9c0 1.761-.514 3.398-1.387 4.785l7.387 7.387-2.828 2.828zm-12.172-8c3.859 0 7-3.14 7-7s-3.141-7-7-7-7 3.14-7 7 3.141 7 7 7z"/></svg> 
                           </button>
                    </form>
                    
                    <div class="right">
                        <c:if test="${sessionScope.user.username ==null}">
			                 <button type="submit" id="loginBtn" class="btn-login">Đăng nhập</button>
			                 <a href="<c:url value='/dang-ky'/>" class="btn-sigup">Đăng ký</a>
		                </c:if>
		                
		                <c:if test="${sessionScope.user.username !=null}">
		            		<span> Hi, ${sessionScope.user.username } </span>
		            		<a href="<c:url value='/dang-xuat'/>"> Logout </a>
		                </c:if>
                    </div>


                    <div id="menuToggle">
                        <input type="checkbox" />
                        <span></span>
                        <span></span>
                        <span></span>

                        <div id="menu">
                        	<form action="" style="margin-bottom: 12px;" class="">
                            	<input type="text" value="Tìm kiếm...">
                            	<button id="btn-search-main" type="submit" style="top: 13%; z-index: 10000; right: 15px;">
									<svg xmlns="http://www.w3.org/2000/svg" style="vertical-align: middle; fill: black" width="20" height="24" viewBox="0 0 24 24"><path d="M21.172 24l-7.387-7.387c-1.388.874-3.024 1.387-4.785 1.387-4.971 0-9-4.029-9-9s4.029-9 9-9 9 4.029 9 9c0 1.761-.514 3.398-1.387 4.785l7.387 7.387-2.828 2.828zm-12.172-8c3.859 0 7-3.14 7-7s-3.141-7-7-7-7 3.14-7 7 3.141 7 7 7z"/></svg> 
                          		</button>
                           </form> 
                            <ul>
                                 <c:forEach items="${categories}" var="cat">
	                                <li><a href="">${cat.name }</a></li>
								 </c:forEach>
                            </ul>
                            <img src="./image/logo.png" alt="logo">

                        </div>


                    </div>
                </div>
                <div class="header-menu">
                    <ul class="nav-menu-list">
                        <li class="nav-menu-item home-item"><a href="${pageContext.request.contextPath}">Trang chủ</a></li>
                        
                        <c:forEach items="${categories}" var="cat">
	                        <li class="nav-menu-item">
	                            <a class="dropbtn" href="${pageContext.request.contextPath}/category?id=${cat.id}">${cat.name }</a>
	                        </li>
	                    </c:forEach>
                    </ul>
                </div>

            </div>
        </div>  <!-- END HEADER -->