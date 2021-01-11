<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="footer">
            <div class="footer-menu">
                <div class="content">
                	<c:forEach items="${categories}" var="cat" varStatus="status">
	                    <ul>
	                        <li><a class="menu-title" href="${pageContext.request.contextPath}/category?id=${cat.id}">
	                        	${cat.name }
	                        </a></li>
	                    </ul>
	                </c:forEach>
                </div>
            </div>
            <div class="menu-res" id="menu-res">
                <div class="menu-res-col">
                    <ul>
                    	<c:forEach items="${categories}" var="cat" varStatus="status">
                        	<li><a href="${pageContext.request.contextPath}/category?id=${cat.id}">${cat.name }</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            
            <div class="footer-infor">
                <div class="f-img">
                    <img src="./static/image/logo.png" alt="">
                </div>
                <div class="f-des">
                    <p>Cơ quan chủ quản: Công ty Cổ phần Quảng cáo Trực tuyến 24H.</p>
                    <p>Trụ sở: Tầng 12, Tòa nhà Geleximco, 36 Hoàng Cầu, Phường Ô Chợ Dừa, Quận Đống Đa, TP Hà Nội.</p>
                    <p>Tel: (84-24) 73 00 24 24 hoặc (84-24) 3512 1806 - Fax: (84-24) 3512 1804.</p>
                    <p>Chi nhánh: Tầng 7, Tòa nhà Việt Úc, 402 Nguyễn Thị Minh Khai, Phường 5, Quận 3, TP. Hồ Chí Minh.</p> 
                    <p>Tel: (84-28) 7300 2424 / Giấy phép số 332/GP – TT ĐT ngày cấp 22/01/2018 SỞ THÔNG TIN VÀ TRUYỀN THÔNG HÀ NỘI.</p>
                    <p>Chịu trách nhiệm xuất bản: Phan Minh Tâm.</p>
                    <p>HOTLINE: 0965 08 24 24</p>
                </div>

            </div>
        </div> <!-- END FOOTER -->