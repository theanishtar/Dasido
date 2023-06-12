<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/views/css/dialog.css">
<script src="/views/js/jquery.min.js"></script>
<script src="/views/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>

</head>
<body>
	<style>
.sidebar {
	position: -webkit-sticky;
	position: sticky;
	top: 0;
	left: 0;
	z-index: 100;
	background-color: #1f1d2b;
}

.sidebar .logo {
	max-width: 550%;
	padding-left: -200px;
	margin-left: -25px;
}

#logo-aside {
	padding-left: -20px;
	margin-left: -20px;
}

.logo-expand {
	width: 195px;
	margin-left: -20px;
	padding-left: -10px;
	border-bottom: solid 2px rgba(47, 51, 54, 0.827);
}

.sidebar.collapse {
	width: 90px;
	border-right: 1px solid var(--border-color);
}
</style>
	<div class="sidebar">
		<img src="/views/images/LogoDasido.png" alt="" srcset="" class="logo">
		<a class="logo-expand" href="#"> <img alt=""
			src="/views/images/logo_aside.png">
		</a>
		<div class="side-wrapper">
			<div class="side-title"></div>
			<div class="side-menu">
				<a class="sidebar-link discover is-active" href="/main"> <i
					class="fa-solid fa-house"></i> Trang chủ
				</a> <a class="sidebar-link trending" href="/message"> <i
					class="fa-solid fa-paper-plane"></i> Nhắn tin
				</a> <a class="sidebar-link" href="#" data-toggle="modal"
					data-target="#myModal"> <i class="fa-solid fa-heart"></i> Theo
					dõi
				</a> <a class="sidebar-link" href="/history"> <i
					class="fa-solid fa-clock-rotate-left"></i>Nhật ký
				</a> <a class="sidebar-link" href="/contact"> <i
					class="fa-solid fa-envelope"></i></i>Liên hệ
				</a>
			</div>
		</div>
		<div class="side-wrapper">
			<div class="side-title">CÔNG CỤ</div>
			<div class="side-menu">
				<a class="sidebar-link" href="#" id="showButton_setting"> <i
					class="fa-solid fa-gear"></i> Cài đặt
				</a>
				<c:if test="${sessionScope.user.user_Role==true}"> 
				<a class="sidebar-link" href="/admin"> <i
					class="fa-solid fa-users"></i> Quản lý
				</a>
				 </c:if> 
			</div>
		</div>
	</div>


	<!-- Setting -->
	<dialog id="favDialog_setting">
	<div id="close_setting">
		<i class="fa-solid fa-xmark"></i>
	</div>
	<div class="setting">
		<p class="suggestion-text">Cài đặt</p>
		<div class="select">
			<select name="format" id="format">
				<option selected disabled>Chọn ngôn ngữ</option>
				<option value="vietnamese">Tiếng Việt</option>
				<option value="english">Tiếng Anh</option>
			</select>
		</div>
		<div class="darkmode">
			<div class="toggleWrapper">
				<input type="checkbox" class="dn" id="dn" /> <label
					onclick="first()" id="darkmode-span" for="dn" class="toggle">
					<span class="toggle__handler"> <span
						class="crater crater--1"></span> <span class="crater crater--2"></span>
						<span class="crater crater--3"></span>
				</span> <span class="star star--1"></span> <span class="star star--2"></span>
					<span class="star star--3"></span> <span class="star star--4"></span>
					<span class="star star--5"></span> <span class="star star--6"></span>
				</label>
			</div>
		</div>
		<div class="button-container">
			<div class='button -dark center'>Vô hiệu hóa tài khoản</div>
		</div>
	</div>
	</dialog>
	<!-- End setting -->

	<!-- Follow -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog" id="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div id="close_follow" data-dismiss="modal">
					<i class="fa-solid fa-xmark"></i>
				</div>
				<div class="modal-body" style="padding: 0">
					<div class="follow">
						<p class="suggestion-text">Danh sách theo dõi</p>
						<div class="list-following">
							<c:forEach items="${follower}" var="fls">
								<div class="profile-card-follow">
									<div class="profile-pic">
										<img src="${ fls.avatar }" alt="">
									</div>
									<div>
										<p class="username">${ fls.fullname }</p>
										<p class="sub-text">${ fls.username }</p>
									</div>
									<!-- <button class="action-btn">Hủy</button> -->
									<a href="/deleteFollow/${fls.ID}" class="action-btn">Hủy</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%-- 	<dialog id="favDialog_follow" class="modal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="close_follow" data-dismiss="modal">
				<i class="fa-solid fa-xmark"></i>
			</div>
			<div class="follow">
				<p class="suggestion-text">Danh sách theo dõi</p>
				<div class="list-following">
					<c:forEach items="${follower}" var="fls">
						<div class="profile-card-follow">
							<div class="profile-pic">
								<img src="${ fls.avatar }" alt="">
							</div>
							<div>
								<p class="username">${ fls.fullname }</p>
								<p class="sub-text">${ fls.username }</p>
							</div>
							<!-- <button class="action-btn">Hủy</button> -->
							<a href="/deleteFollow/${fls.ID}" class="action-btn">Hủy</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	</dialog> --%>
	<!-- end follow -->

	<!-- <script src="/views/js/dialog.js"></script> -->
	<script src="/views/js/comment.js"></script>
	<script src="/views/js/home.js"></script>
</body>
</html>