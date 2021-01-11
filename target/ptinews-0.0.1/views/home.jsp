<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
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
        <div id="header">
            <div class="header-content">
                <div class="header-top">
                    <a href="">
                        <img src="./static/image/logo.png" alt="logo">

                    </a>
                    <div class="right">
                        <button type="submit" id="loginBtn" class="btn-login">Đăng nhập</button>
                        <!-- <a href="" class="btn-login" id="loginBtn">Đăng nhập</a> -->
                        <a href="" class="btn-sigup">Đăng ký</a>
                        <div class="header-search">
                            <input type="text" placeholder="Tìm kiếm tin tức">
                            <span class="ti-search"></span>
                        </div>
                    </div>


                    <div id="menuToggle">
                        <input type="checkbox" />
                        <span></span>
                        <span></span>
                        <span></span>

                        <div id="menu">
                            <input type="text" value="Tìm kiếm..."><br><br>
                            <ul>
                                <li><a href="">Kinh tế</a></li>
                                <li><a href="">Chính trị</a></li>
                                <li><a href="">Văn hóa</a></li>
                                <li><a href="">Nghệ thuật</a></li>
                                <li><a href="">Giải trí</a></li>
                                <li><a href="">Sức khỏe</a></li>
                                <li><a href="">Video</a></li>
                                <li><a href="">Blog</a></li>

                            </ul>
                            <ul>
                                <li><a href="">Thể thao</a></li>
                                <li><a href="">Giáo dục</a></li>
                                <li><a href="">Thế giới</a></li>
                                <li><a href="">Showbit</a></li>
                                <li><a href="">Covid19</a></li>
                                <li><a href="">Khoa học-Công nghệ</a></li>
                                <li><a href="">Đời sống</a></li>
                                <li><a href="">Du học</a></li>

                            </ul>
                            <img src="./static/image/logo.png" alt="logo">

                        </div>


                    </div>
                </div>
                <div class="header-menu">
                    <ul>
                        <li><a href="">Trang chủ</a></li>
                        <li class="drop">
                            <a class="dropbtn" href="">Kinh tế</a>
                            <div class="dropdown-content">
                                <a href="#">Tài chính đầu tư</a>
                                <a href="#">Thị trường</a>
                                <a href="#">Doanh nghiệp</a>
                                <a href="#">Bảo hiểm</a>
                                <a href="#">Y tế</a>
                            </div>
                        </li>
                        <li class="drop">
                            <a class="dropbtn" href="">Chính trị</a>
                            <div class="dropdown-content">
                                <a href="#">Trong nước</a>
                                <a href="#">Quốc tế</a>
                            </div>
                        </li>
                        <li class="drop">
                            <a class="dropbtn" href="">Văn hóa</a>
                            <div class="dropdown-content">
                                <a href="#">Du lịch</a>
                                <a href="#">Ẩm thực</a>
                                <a href="#">Sự kiện</a>
                            </div>
                        </li>
                        <li class="drop">
                            <a class="dropbtn" href="">Xã hội</a>
                            <div class="dropdown-content">
                                <a href="#">Môi trường</a>
                                <a href="#">Giao thông</a>
                                <a href="#">Đời sống</a>
                            </div>
                        </li>
                        <li class="drop">
                            <a class="dropbtn" href="">Giải trí</a>
                            <div class="dropdown-content">
                                <a href="#">Hài</a>
                                <a href="#">Thời trang</a>
                                <a href="#">Sao Việt</a>
                            </div>
                        </li>
                        <li class="drop">
                            <a class="dropbtn" href="">Nghệ thuật</a>
                            <div class="dropdown-content">
                                <a href="#">Phim-Điện ảnh</a>
                                <a href="#">Kiến trúc</a>
                                <a href="#">Âm nhạc</a>
                            </div>
                        </li>
                        <li class="drop">
                            <a class="dropbtn" href="">Thể thao</a>
                            <div class="dropdown-content">
                                <a href="#">Bóng đá châu Á</a>
                                <a href="#">Bóng đá châu Âu</a>
                                <a href="#">Thể thao khácp</a>
                            </div>
                        </li>
                        <li class="drop">
                            <a class="dropbtn" href="">Sức khỏe</a>
                            <div class="dropdown-content">
                                <a href="#">Bệnh viện-Phòng khám</a>
                                <a href="#">Covid 19</a>
                                <a href="#">Ung thư</a>
                            </div>
                        </li>
                        <li class="drop">
                            <a class="dropbtn" href="">Pháp luật</a>
                            <div class="dropdown-content">
                                <a href="#">Vụ án mới</a>
                                <a href="#">Trọng án</a>
                                <a href="#">Kỳ án</a>
                            </div>
                        </li>
                        <li class="drop">
                            <a class="dropbtn" href="">Giáo dục</a>
                            <div class="dropdown-content">
                                <a href="#">Đào tạo</a>
                                <a href="#">Học bổng du học</a>
                                <a href="#">Tuyển sinh</a>
                            </div>
                        </li>
                        <li class="drop">
                            <a class="dropbtn" href="">Covid19</a>
                            <div class="dropdown-content">
                                <a href="#">Thống kê</a>
                                <a href="#">Tin tức</a>
                            </div>
                        </li>
                        <li class="drop">
                            <a class="dropbtn" href="">Việc làm</a>
                            <div class="dropdown-content">
                                <a href="#">Bán thời gian</a>
                                <a href="#">Việc làm sinh viên</a>
                            </div>
                        </li>
                        <li class="drop">
                            <a class="dropbtn" href="">Số hóa</a>
                            <div class="dropdown-content">
                                <a href="#">Tin tức</a>
                                <a href="#">Sản phẩm</a>
                            </div>
                        </li>
                        <li class="drop">
                            <a class="dropbtn" href="">Tin hot</a>
                            <div class="dropdown-content">
                                <a href="#">Showbit</a>
                            </div>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
        <div id="content">
            <div class="banner">
                <img src="./static/image/unnamed.png" alt="img">
                <img src="./static/image/unnamed.png" alt="img">
            </div>
            <div class="content-content">
                <div class="content-left">
                    <div class="content-left-new">
                        <div class="title">
                            <p>Mới nhất</p>
                        </div>
                        <div class="new-content">
                            <a href="">
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
                            </a>
                            <!-- nhặt ra 3 bài mới nhất sau tin t1-->
                            <div class="new-content-slide">
                                <div class="new-slide">
                                    <a href="">
                                        <div class="slide-img">
                                            <img src="./static/image/trump.jpg" alt="">
                                        </div>
                                        <div class="slide-content">
                                            <b>Mỹ tái thảo luận kế hoạch cắt quốc tịch cho trẻ sơ sinh nước ngoài</b>
                                        </div>
                                    </a>
                                </div>
                                <div class="new-slide">
                                    <a href="">
                                        <div class="slide-img">
                                            <img src="./static/image/trump.jpg" alt="">
                                        </div>
                                        <div class="slide-content">
                                            <b>Mỹ tái thảo luận kế hoạch cắt quốc tịch cho trẻ sơ sinh nước ngoài</b>
                                        </div>
                                    </a>
                                </div>
                                <div class="new-slide">
                                    <a href="">
                                        <div class="slide-img">
                                            <img src="./static/image/trump.jpg" alt="">
                                        </div>
                                        <div class="slide-content">
                                            <b>Mỹ tái thảo luận kế hoạch cắt quốc tịch cho trẻ sơ sinh nước ngoài</b>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- tin mới từng categories -->
                    <div class="new-category">
                        <div class="cate-col">
                            <div class="cate-col-row">
                                <div class="cell">
                                    <!-- menu -->
                                    <div class="cate-row-menu">
                                        <ul>
                                            <li class="menu-f1"><a href="">Kinh doanh</a></li>
                                            <li><a href="">Tài chính</a></li>
                                            <li><a href="">Bất động sản</a></li>
                                            <li><a href="">Tiền tệ</a></li>
                                        </ul>
                                    </div>
                                    <!-- bài mới nhất cate -->
                                    <div class="cate-row-content">
                                        <a href="">
                                            <div class="cate-1">
                                                <h4>Đại gia tuần qua: Bắt tay Singapore, bầu Hiển bước vào “sân chơi” hàng nghìn tỷ</h4>
                                            </div>
                                            <div class="cate-2">
                                                <div class="cate-2-img">
                                                    <img src="./static/image/cate.jpg" alt="">
                                                </div>
                                                <div class="cate-2-des">
                                                    Tập đoàn của bầu Hiển vừa hợp tác đầu tư với tập đoàn lớn tại Singgapore xây dựng dự án logistics.
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- danh sách các bài mới tiếp theo của cate -->
                                    <div class="cate-row-list">
                                        <ul>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="cate-col-row">
                                <div class="cell">
                                    <!-- menu -->
                                    <div class="cate-row-menu">
                                        <ul>
                                            <li class="menu-f1"><a href="">Pháp luật</a></li>
                                            <li><a href="">Vụ án nổi tiếng</a></li>
                                            <li><a href="">Trọng án</a></li>
                                            <li><a href="">Kỳ án</a></li>
                                        </ul>
                                    </div>
                                    <!-- bài mới nhất cate -->
                                    <div class="cate-row-content">
                                        <a href="">
                                            <div class="cate-1">
                                                <h4>Đại gia tuần qua: Bắt tay Singapore, bầu Hiển bước vào “sân chơi” hàng nghìn tỷ</h4>
                                            </div>
                                            <div class="cate-2">
                                                <div class="cate-2-img">
                                                    <img src="./static/image/cate.jpg" alt="">
                                                </div>
                                                <div class="cate-2-des">
                                                    Tập đoàn của bầu Hiển vừa hợp tác đầu tư với tập đoàn lớn tại Singgapore xây dựng dự án logistics.
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- danh sách các bài mới tiếp theo của cate -->
                                    <div class="cate-row-list">
                                        <ul>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="cate-col-row">
                                <div class="cell">
                                    <!-- menu -->
                                    <div class="cate-row-menu">
                                        <ul>
                                            <li class="menu-f1"><a href="">Chính trị</a></li>
                                            <li><a href="">Nổi bật</a></li>
                                            <li><a href="">Trong nước</a></li>
                                            <li><a href="">Quốc tế</a></li>
                                        </ul>
                                    </div>
                                    <!-- bài mới nhất cate -->
                                    <div class="cate-row-content">
                                        <a href="">
                                            <div class="cate-1">
                                                <h4>Đại gia tuần qua: Bắt tay Singapore, bầu Hiển bước vào “sân chơi” hàng nghìn tỷ</h4>
                                            </div>
                                            <div class="cate-2">
                                                <div class="cate-2-img">
                                                    <img src="./static/image/cate.jpg" alt="">
                                                </div>
                                                <div class="cate-2-des">
                                                    Tập đoàn của bầu Hiển vừa hợp tác đầu tư với tập đoàn lớn tại Singgapore xây dựng dự án logistics.
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- danh sách các bài mới tiếp theo của cate -->
                                    <div class="cate-row-list">
                                        <ul>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="cate-col-row">
                                <div class="cell">
                                    <!-- menu -->
                                    <div class="cate-row-menu">
                                        <ul>
                                            <li class="menu-f1"><a href="">Xã hội</a></li>
                                            <li><a href="">Môi trường</a></li>
                                            <li><a href="">Giao thông</a></li>
                                            <li><a href="">Đời sống</a></li>
                                        </ul>
                                    </div>
                                    <!-- bài mới nhất cate -->
                                    <div class="cate-row-content">
                                        <a href="">
                                            <div class="cate-1">
                                                <h4>Đại gia tuần qua: Bắt tay Singapore, bầu Hiển bước vào “sân chơi” hàng nghìn tỷ</h4>
                                            </div>
                                            <div class="cate-2">
                                                <div class="cate-2-img">
                                                    <img src="./static/image/cate.jpg" alt="">
                                                </div>
                                                <div class="cate-2-des">
                                                    Tập đoàn của bầu Hiển vừa hợp tác đầu tư với tập đoàn lớn tại Singgapore xây dựng dự án logistics.
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- danh sách các bài mới tiếp theo của cate -->
                                    <div class="cate-row-list">
                                        <ul>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="cate-col-row">
                                <div class="cell">
                                    <!-- menu -->
                                    <div class="cate-row-menu">
                                        <ul>
                                            <li class="menu-f1"><a href="">Thể thao</a></li>
                                            <li><a href="">Bóng đá châu Á</a></li>
                                            <li><a href="">Bóng đá châu Âu</a></li>
                                            <li><a href="">Khác</a></li>
                                        </ul>
                                    </div>
                                    <!-- bài mới nhất cate -->
                                    <div class="cate-row-content">
                                        <a href="">
                                            <div class="cate-1">
                                                <h4>Đại gia tuần qua: Bắt tay Singapore, bầu Hiển bước vào “sân chơi” hàng nghìn tỷ</h4>
                                            </div>
                                            <div class="cate-2">
                                                <div class="cate-2-img">
                                                    <img src="./static/image/cate.jpg" alt="">
                                                </div>
                                                <div class="cate-2-des">
                                                    Tập đoàn của bầu Hiển vừa hợp tác đầu tư với tập đoàn lớn tại Singgapore xây dựng dự án logistics.
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- danh sách các bài mới tiếp theo của cate -->
                                    <div class="cate-row-list">
                                        <ul>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="cate-col">
                            <div class="cate-col-row">
                                <div class="cell uncell">
                                    <!-- menu -->
                                    <div class="cate-row-menu">
                                        <ul>
                                            <li class="menu-f1"><a href="">Văn hóa</a></li>
                                            <li><a href="">Du lịch</a></li>
                                            <li><a href="">Ẩm thực</a></li>
                                            <li><a href="">Sự kiện</a></li>
                                        </ul>
                                    </div>
                                    <!-- bài mới nhất cate -->
                                    <div class="cate-row-content">
                                        <a href="">
                                            <div class="cate-1">
                                                <h4>Đại gia tuần qua: Bắt tay Singapore, bầu Hiển bước vào “sân chơi” hàng nghìn tỷ</h4>
                                            </div>
                                            <div class="cate-2">
                                                <div class="cate-2-img">
                                                    <img src="./static/image/cate.jpg" alt="">
                                                </div>
                                                <div class="cate-2-des">
                                                    Tập đoàn của bầu Hiển vừa hợp tác đầu tư với tập đoàn lớn tại Singgapore xây dựng dự án logistics.
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- danh sách các bài mới tiếp theo của cate -->
                                    <div class="cate-row-list">
                                        <ul>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="cate-col-row">
                                <div class="cell uncell">
                                    <!-- menu -->
                                    <div class="cate-row-menu">
                                        <ul>
                                            <li class="menu-f1"><a href="">Giải trí</a></li>
                                            <li><a href="">Hài</a></li>
                                            <li><a href="">Thời trang</a></li>
                                            <li><a href="">Sao Việt</a></li>
                                        </ul>
                                    </div>
                                    <!-- bài mới nhất cate -->
                                    <div class="cate-row-content">
                                        <a href="">
                                            <div class="cate-1">
                                                <h4>Đại gia tuần qua: Bắt tay Singapore, bầu Hiển bước vào “sân chơi” hàng nghìn tỷ</h4>
                                            </div>
                                            <div class="cate-2">
                                                <div class="cate-2-img">
                                                    <img src="./static/image/cate.jpg" alt="">
                                                </div>
                                                <div class="cate-2-des">
                                                    Tập đoàn của bầu Hiển vừa hợp tác đầu tư với tập đoàn lớn tại Singgapore xây dựng dự án logistics.
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- danh sách các bài mới tiếp theo của cate -->
                                    <div class="cate-row-list">
                                        <ul>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="cate-col-row">
                                <div class="cell uncell">
                                    <!-- menu -->
                                    <div class="cate-row-menu">
                                        <ul>
                                            <li class="menu-f1"><a href="">Nghệ thuật</a></li>
                                            <li><a href="">Ca nhạc</a></li>
                                            <li><a href="">Phim-Điện ảnh</a></li>
                                            <li><a href="">Kiến trúc</a></li>
                                        </ul>
                                    </div>
                                    <!-- bài mới nhất cate -->
                                    <div class="cate-row-content">
                                        <a href="">
                                            <div class="cate-1">
                                                <h4>Đại gia tuần qua: Bắt tay Singapore, bầu Hiển bước vào “sân chơi” hàng nghìn tỷ</h4>
                                            </div>
                                            <div class="cate-2">
                                                <div class="cate-2-img">
                                                    <img src="./static/image/cate.jpg" alt="">
                                                </div>
                                                <div class="cate-2-des">
                                                    Tập đoàn của bầu Hiển vừa hợp tác đầu tư với tập đoàn lớn tại Singgapore xây dựng dự án logistics.
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- danh sách các bài mới tiếp theo của cate -->
                                    <div class="cate-row-list">
                                        <ul>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="cate-col-row">
                                <div class="cell uncell">
                                    <!-- menu -->
                                    <div class="cate-row-menu">
                                        <ul>
                                            <li class="menu-f1"><a href="">Thế giới</a></li>
                                            <li><a href="">Điểm nóng</a></li>
                                            <li><a href="">Quân sự</a></li>
                                        </ul>
                                    </div>
                                    <!-- bài mới nhất cate -->
                                    <div class="cate-row-content">
                                        <a href="">
                                            <div class="cate-1">
                                                <h4>Đại gia tuần qua: Bắt tay Singapore, bầu Hiển bước vào “sân chơi” hàng nghìn tỷ</h4>
                                            </div>
                                            <div class="cate-2">
                                                <div class="cate-2-img">
                                                    <img src="./static/image/cate.jpg" alt="">
                                                </div>
                                                <div class="cate-2-des">
                                                    Tập đoàn của bầu Hiển vừa hợp tác đầu tư với tập đoàn lớn tại Singgapore xây dựng dự án logistics.
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- danh sách các bài mới tiếp theo của cate -->
                                    <div class="cate-row-list">
                                        <ul>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="cate-col-row">
                                <div class="cell uncell">
                                    <!-- menu -->
                                    <div class="cate-row-menu">
                                        <ul>
                                            <li class="menu-f1"><a href="">Thế giới</a></li>
                                            <li><a href="">Điểm nóng</a></li>
                                            <li><a href="">Quân sự</a></li>
                                        </ul>
                                    </div>
                                    <!-- bài mới nhất cate -->
                                    <div class="cate-row-content">
                                        <a href="">
                                            <div class="cate-1">
                                                <h4>Đại gia tuần qua: Bắt tay Singapore, bầu Hiển bước vào “sân chơi” hàng nghìn tỷ</h4>
                                            </div>
                                            <div class="cate-2">
                                                <div class="cate-2-img">
                                                    <img src="./static/image/cate.jpg" alt="">
                                                </div>
                                                <div class="cate-2-des">
                                                    Tập đoàn của bầu Hiển vừa hợp tác đầu tư với tập đoàn lớn tại Singgapore xây dựng dự án logistics.
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- danh sách các bài mới tiếp theo của cate -->
                                    <div class="cate-row-list">
                                        <ul>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng</a></li>
                                            <li><a href="">Phía sau vụ buôn lậu khủng hơn 50 kg vàng</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- <div class="new-cate-2">
                        
                    </div> -->
                </div>
                <div class="content-right">
                    <div class="title">
                        <p>Sự kiện</p>
                    </div>
                    <div class="link-list">
                        <ul>
                            <li><a href="">Tổng Bí thư: Nhân sự chuẩn bị kỹ, “chạy” phiếu, “chạy” chức giảm hẳn!</a></li>
                            <li><a href="">Tổng Bí thư: Nhân sự chuẩn bị kỹ, “chạy” phiếu, “chạy” chức giảm hẳn!</a></li>
                            <li><a href="">Tổng Bí thư: Nhân sự chuẩn bị kỹ, “chạy” phiếu, “chạy” chức giảm hẳn!</a></li>
                            <li><a href="">Tổng Bí thư: Nhân sự chuẩn bị kỹ, “chạy” phiếu, “chạy” chức giảm hẳn!</a></li>
                        </ul>
                    </div>
                </div>
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
            <div class="menu-res" id="menu-res">
                <div class="menu-res-col">
                    <ul>
                        <li><a href="">Kinh tế</a></li>
                        <li><a href="">Chính trị</a></li>
                        <li><a href="">Văn hóa</a></li>
                        <li><a href="">Nghệ thuật</a></li>
                        <li><a href="">Giải trí</a></li>
                        <li><a href="">Sức khỏe</a></li>

                    </ul>
                </div>
                <div class="menu-res-col">
                    <ul>
                        <li><a href="">Thể thao</a></li>
                        <li><a href="">Giáo dục</a></li>
                        <li><a href="">Thế giới</a></li>
                        <li><a href="">Showbit</a></li>
                        <li><a href="">Covid19</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-infor">
                <div class="f-img">
                    <img src="./static/image/logo.png" alt="">
                </div>
                <div class="f-des">
                    Cơ quan chủ quản: Công ty Cổ phần Quảng cáo Trực tuyến 24H <br> Trụ sở: Tầng 12, Tòa nhà Geleximco, 36 Hoàng Cầu, Phường Ô Chợ Dừa, Quận Đống Đa, TP Hà Nội. <br> Tel: (84-24) 73 00 24 24 hoặc (84-24) 3512 1806 - Fax: (84-24) 3512 1804.
                    <br> Chi nhánh: Tầng 7, Tòa nhà Việt Úc, 402 Nguyễn Thị Minh Khai, Phường 5, Quận 3, TP. Hồ Chí Minh. <br> Tel: (84-28) 7300 2424 / Giấy phép số 332/GP – TT ĐT ngày cấp 22/01/2018 SỞ THÔNG TIN VÀ TRUYỀN THÔNG HÀ NỘI.
                    <br>Chịu trách nhiệm xuất bản: Phan Minh Tâm.
                    <br>HOTLINE: 0965 08 24 24
                </div>

            </div>
        </div>
    </div>

    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h3>Đăng nhập</h3>
            <form action="#" name="flogin" method="post">
                <div class="field">
                    <span class="fa fa-user" aria-hidden="true"></span>
                    <input type="text" placeholder="Tên đăng nhập" name="uname" id="username" required>
                </div>
                <div class="field space">
                    <span class="fa fa-lock" aria-hidden="true"></span>
                    <input type="password" placeholder="Mật khẩu" name="pass" id="pass" required>
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
                    <span>Chưa có tài khoản?</span>
                    <a href="sigup.html">Đăng kí</a>
                </div>
            </form>
        </div>
    </div>
    <script src="<c:url value='static/js/script.js'/>"></script>
</body>
</html>