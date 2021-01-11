<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng Ký</title>
<link rel="stylesheet" href='<c:url value="/static/css/web/style.css"/>'>
<link rel="stylesheet" href='<c:url value="/static/css/web/font-awesome.min.css"/>'>
<link rel="stylesheet" href='<c:url value="/static/css/web/icomoon.css"/>'>
<link rel="stylesheet" href='<c:url value="/static/css/web/poppin.css"/>'>
<link rel="stylesheet" href='<c:url value="/static/css/web/themify-icons.css"/>'>
<link rel="stylesheet" href='<c:url value="/static/css/web/flaticon.css"/>'>
<link rel="stylesheet" href='<c:url value="/static/css/web/styleSigup.css"/>'>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
</head>
<body>
	<div class="container">
	
        <jsp:directive.include file="header.jsp" />
        
        <div id="content">
            <h2>Đăng ký tài khoản PTIN</h2>
            
            		<c:if test="${ success_message != null }">
						<div class="alert alert-success" align="center">
							${success_message}</div>
					</c:if>

					<c:if test="${ err_message != null }">
						<div class="alert alert-danger" align="center">
							${err_message}</div>
					</c:if>
            
            <div class="frm">
                <form action="<c:url value='/dang-ky'/>" method="post" onsubmit="return validateFormInput();">
                    <label for="username"><b>Tên đăng nhập</b></label>
                    <input type="text"  name="username" required>
                    <label for="email"><b>Email</b></label>
                    <input type="text"  name="email" id="email" required>
                    <label for="pass"><b>Mật khẩu</b></label>
                    <input type="password" name="password" id="password" required>
                    <input type="submit" name="btnSubmit" onclick=setCookie() value="Đăng ký">
                </form>
            </div>
        </div>
        <div id="footer">
            <div class="footer-menu">
                <div class="content">
                    <ul>
                        <li><a class="menu-title" href="">Kinh tế</a></li>
                        <li><a href="">Tài chính - Đầu tư</a></li>
                        <li><a href="">Thị trường</a></li>
                        <li><a href="">Doanh nghiệp</a></li>
                        <li><a href="">Bảo hiểm</a></li>
                        <li><a href="">Quốc tế</a></li>
                    </ul>
                    <ul>
                        <li><a class="menu-title" href="">Chính trị</a></li>
                        <li><a href="">Trong nước</a></li>
                        <li><a href="">QUốc tế</a></li>
                    </ul>
                    <ul>
                        <li><a class="menu-title" href="">Văn hóa</a></li>
                        <li><a href="">Du lịch</a></li>
                        <li><a href="">Ẩm thực</a></li>
                        <li><a href="">Sự kiện</a></li>
                    </ul>
                    <ul>
                        <li><a class="menu-title" href="">Xã hội</a></li>
                        <li><a href="">Môi trường</a></li>
                        <li><a href="">Giao thông</a></li>
                        <li><a href="">Đời sống</a></li>
                    </ul>
                    <ul>
                        <li><a class="menu-title" href="">Giải trí</a></li>
                        <li><a href="">Hài</a></li>
                        <li><a href="">Thời trang</a></li>
                        <li><a href="">Sao Việt</a></li>
                    </ul>
                    <ul>
                        <li><a class="menu-title" href="">Nghệ thuật</a></li>
                        <li><a href="">Âm nhạc</a></li>
                        <li><a href="">Phim - điện ảnh</a></li>
                        <li><a href="">Kiến trúc</a></li>
                    </ul>
                    <ul>
                        <li><a class="menu-title" href="">Thể thao</a></li>
                        <li><a href="">Bóng đáchâu Á</a></li>
                        <li><a href="">Bóng đá châu ÂU</a></li>
                        <li><a href="">Thể thao khác</a></li>
                    </ul>
                    <ul>
                        <li><a class="menu-title" href="">Sức khỏe</a></li>
                        <li><a href="">Bệnh viện - Phòng khám</a></li>
                        <li><a href="">Bệnh ung thư</a></li>
                        <li><a href="">Làm đẹp</a></li>
                        <li><a href="">Covid 19</a></li>
                    </ul>
                    <ul>
                        <li><a class="menu-title" href="">Pháp luật</a></li>
                        <li><a href="">Vụ án mới</a></li>
                        <li><a href="">Trọng án</a></li>
                        <li><a href="">Kỳ án</a></li>
                    </ul>
                    <ul>
                        <li><a class="menu-title" href="">Giáo dục</a></li>
                        <li><a href="">Đào tạo</a></li>
                        <li><a href="">Học bổng du học</a></li>
                        <li><a href="">Tuyển sinh</a></li>

                    </ul>
                </div>
            </div>
            <div class="footer-infor">
                <div class="f-img">
                    <img src="./static/image/logo.png" alt="">
                </div>
                <div class="f-des">
                    Cơ quan chủ quản: Công ty Cổ phần Quảng cáo Trực tuyến 24H <br>
                    Trụ sở: Tầng 12, Tòa nhà Geleximco, 36 Hoàng Cầu, Phường Ô Chợ Dừa, Quận Đống Đa, TP Hà Nội. <br>
                    Tel: (84-24) 73 00 24 24 hoặc (84-24) 3512 1806 - Fax: (84-24) 3512 1804. <br>
                    Chi nhánh: Tầng 7, Tòa nhà Việt Úc, 402 Nguyễn Thị Minh Khai, Phường 5, Quận 3, TP. Hồ Chí Minh. <br>
                    Tel: (84-28) 7300 2424 / Giấy phép số 332/GP – TT ĐT ngày cấp 22/01/2018 SỞ THÔNG TIN VÀ TRUYỀN THÔNG HÀ NỘI. 
                    <br>Chịu trách nhiệm xuất bản: Phan Minh Tâm. 
                    <br>HOTLINE: 0965 08 24 24
                </div>
            </div>
        </div>
    </div>
    
   <jsp:directive.include file="form-login.jsp" />
   
    <script src="<c:url value='static/js/script.js'/>"></script>
    <script type="text/javascript">
	    function validateFormInput(){
	    	
			var pass = document.getElementById("password").value;
			var email = document.getElementById("email").value;
			
			if(!CheckPassword(pass)){
				alert("Pass word invalid!");
				return false;
			}
		
			if(!validateEmail(email)){
				alert("Email is invalid!");
				return false;
			}
			
			return true;
		}
	
		function validateEmail(email){
		    const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		    return re.test(String(email).toLowerCase());
		}
		
		function CheckPassword(pass) {
			var re =  /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$/;
			return re.test(String(pass).toLowerCase());
		}
    </script>
</body>
</html>