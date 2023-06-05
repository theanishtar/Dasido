<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="views/css/adminpage.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://kit.fontawesome.com/152112956f.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<nav class="primary-navigation navbar navbar-expand-lg navbar-light"
		id="nav-horizontal">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul>
				<li class="search">
					<div class="input-box">
						<i class="fa-solid fa-magnifying-glass"></i> <input class="find"
							type="text" placeholder="Tìm kiếm" />
					</div>
				</li>
				<c:if test="${sessionScope.user.user_Role==true}">
					<li><a href="adminpage">Quản lý</a></li>
				</c:if>


				<li class="account"><a href="profile"> <c:if
							test="${user==null}">
            Tài khoản &dtrif;
            </c:if> <c:if test="${user!=null}">
           ${user.username}&dtrif;
            </c:if>
				</a>
					<ul class="dropdown">
						<li><a href="updateprofile">Cập nhật tài khoản</a></li>
						<li><a href="index">Đăng xuất</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>


	<aside class="sidebar">
		<header class="sidebar-header">
			<h1>DASIDO</h1>
		</header>
		<nav>
			<a href="homm"> <span> <i class="fa-solid fa-house"></i> <span>Trang
						chủ</span>
			</span>
			</a> <a id="showDialog"> <span> <i id="showDialog"
					class="fa-solid fa-plus"></i> <span>Đăng bài</span>
			</span>
			</a> <a href="history"> <span> <i
					class="fa-solid fa-clock-rotate-left"></i> <span>Lịch sử</span>
			</span>
			</a> <a href="message"> <span> <i
					class="fa-solid fa-location-arrow"> <span>12</span>
				</i> <span>Tin nhắn</span>
			</span>
			</a> <a id="showDialog_Notifications"> <span> <i
					class="fa-regular fa-bell"> <span>12</span>
				</i> <span>Thông báo</span>
			</span>
			</a> <a id="showButton_follow"> <span> <i
					class="fa-regular fa-heart"></i> <span>Theo dõi</span>
			</span>
			</a> <a id="showButton_setting"> <span> <i
					class="fa-solid fa-gear"></i> <span>Cài đặt</span>
			</span>
			</a>
		</nav>
	</aside>

	<!-- main section -->
	<section class="main">
		<div class="container_admin">
			<div class="bg-white shadow rounded-lg d-block d-sm-flex">
				<div class="profile-tab-nav border-right">
					<div class="p-2">
						<h4 class="text-center" id="fullname">Quản lý</h4>
					</div>
					<div class="nav flex-column nav-pills" id="v-pills-tab"
						role="tablist" aria-orientation="vertical">
						<a class="nav-link active" id="post-management-tab"
							data-toggle="pill" href="#post-management" role="tab"
							aria-controls="post-management" aria-selected="true"> <i
							class="fa-solid fa-list"></i> Bài đăng của người dùng
						</a> <a class="nav-link" id="account-management-tab"
							data-toggle="pill" href="#account-management" role="tab"
							aria-controls="account-management" aria-selected="false"> <i
							class="fa-solid fa-user"></i> Tài khoản người dùng
						</a> <a class="nav-link" id="statistical-tab" data-toggle="pill"
							href="#statistical" role="tab" aria-controls="statistical"
							aria-selected="false"> <i class="fa-solid fa-chart-column"></i>
							Thống kê
						</a>
					</div>
				</div>
				<div class="tab-content p-2 p-md-3" id="v-pills-tabContent">
					<div class="tab-pane fade show active" id="post-management"
						role="tabpanel" aria-labelledby="post-management-tab">
						<div class="header-title">
							<h4 class="title-tab">Quản lý bài đăng</h4>
							<div class="checkAll">
								<input type="checkbox" class="checkDeleteAll"> <span>Bài
									viết vi phạm</span>
							</div>
						</div>
						<div id="manage-tab">
							<ul class="list">
								<li>
									<div class="content">
										<img src="views/images/posts/post1.jpg" class="thumb" />
										<p class="description">
											Bạn đã thích ảnh của <strong>@an</strong>
										</p>
									</div>
									<div class="number-report">
										<strong>16</strong>
									</div>
									<div class="dropdown-options">
										<i class="fa-solid fa-ellipsis" id="options"></i>
										<div class="dropdown-content">
											<p>Gỡ</p>
											<p>Xem lại</p>
										</div>
									</div>
								</li>
								<li>
									<div class="content">
										<img src="views/images/posts/post1.jpg" class="thumb" />
										<p class="description">
											Bạn đã thích ảnh của <strong>@an</strong>
										</p>
									</div>
									<div class="number-report">
										<strong>16</strong>
									</div>
									<div class="dropdown-options">
										<i class="fa-solid fa-ellipsis" id="options"></i>
										<div class="dropdown-content">
											<p>Gỡ</p>
											<p>Xem lại</p>
										</div>
									</div>
								</li>
								<li>
									<div class="content">
										<img src="views/images/posts/post1.jpg" class="thumb" />
										<p class="description">
											Bạn đã thích ảnh của <strong>@an</strong>
										</p>
									</div>
									<div class="number-report">
										<strong>16</strong>
									</div>
									<div class="dropdown-options">
										<i class="fa-solid fa-ellipsis" id="options"></i>
										<div class="dropdown-content">
											<p>Gỡ</p>
											<p>Xem lại</p>
										</div>
									</div>
								</li>
								<li>
									<div class="content">
										<img src="views/images/posts/post1.jpg" class="thumb" />
										<p class="description">
											Bạn đã thích ảnh của <strong>@an</strong>
										</p>
									</div>
									<div class="number-report">
										<strong>16</strong>
									</div>
									<div class="dropdown-options">
										<i class="fa-solid fa-ellipsis" id="options"></i>
										<div class="dropdown-content">
											<p>Gỡ</p>
											<p>Xem lại</p>
										</div>
									</div>
								</li>
								<li>
									<div class="content">
										<img src="views/images/posts/post1.jpg" class="thumb" />
										<p class="description">
											Bạn đã thích ảnh của <strong>@an</strong>
										</p>
									</div>
									<div class="number-report">
										<strong>16</strong>
									</div>
									<div class="dropdown-options">
										<i class="fa-solid fa-ellipsis" id="options"></i>
										<div class="dropdown-content">
											<p>Gỡ</p>
											<p>Xem lại</p>
										</div>
									</div>
								</li>
								<li>
									<div class="content">
										<img src="views/images/posts/post1.jpg" class="thumb" />
										<p class="description">
											Bạn đã thích ảnh của <strong>@an</strong>
										</p>
									</div>
									<div class="number-report">
										<strong>16</strong>
									</div>
									<div class="dropdown-options">
										<i class="fa-solid fa-ellipsis" id="options"></i>
										<div class="dropdown-content">
											<p>Gỡ</p>
											<p>Xem lại</p>
										</div>
									</div>
								</li>
								<li>
									<div class="content">
										<img src="views/images/posts/post1.jpg" class="thumb" />
										<p class="description">
											Bạn đã thích ảnh của <strong>@an</strong>
										</p>
									</div>
									<div class="number-report">
										<strong>16</strong>
									</div>
									<div class="dropdown-options">
										<i class="fa-solid fa-ellipsis" id="options"></i>
										<div class="dropdown-content">
											<p>Gỡ</p>
											<p>Xem lại</p>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div class="tab-pane fade" id="account-management" role="tabpanel"
						aria-labelledby="account-management-tab">
						<div class="header-title">
							<h4 class="title-tab">Quản lý tài khoản</h4>
							<div class="checkAll">
								<input type="checkbox" class="checkDeleteAll"> <span>Tài
									khoản vi phạm</span>
							</div>
						</div>
						<div id="manage-tab">
							<ul class="list">
								<li>
									<div class="content">
										<img src="views/images/user/user1.jpg" class="thumb" />
										<p class="description">Nguyễn Văn An</p>
									</div>
									<div class="number-report">
										<strong>16</strong>
									</div>
									<div class="dropdown-options">
										<i class="fa-solid fa-ellipsis" id="options"></i>
										<div class="dropdown-content">
											<p>Tắt trạng thái</p>
										</div>
									</div>
								</li>
								<li>
									<div class="content">
										<img src="views/images/user/user1.jpg" class="thumb" />
										<p class="description">Nguyễn Văn An</p>
									</div>
									<div class="number-report">
										<strong>16</strong>
									</div>
									<div class="dropdown-options">
										<i class="fa-solid fa-ellipsis" id="options"></i>
										<div class="dropdown-content">
											<p>Tắt trạng thái</p>
										</div>
									</div>
								</li>
								<li>
									<div class="content">
										<img src="views/images/user/user1.jpg" class="thumb" />
										<p class="description">Nguyễn Văn An</p>
									</div>
									<div class="number-report">
										<strong>16</strong>
									</div>
									<div class="dropdown-options">
										<i class="fa-solid fa-ellipsis" id="options"></i>
										<div class="dropdown-content">
											<p>Tắt trạng thái</p>
										</div>
									</div>
								</li>
								<li>
									<div class="content">
										<img src="views/images/user/user1.jpg" class="thumb" />
										<p class="description">Nguyễn Văn An</p>
									</div>
									<div class="number-report">
										<strong>16</strong>
									</div>
									<div class="dropdown-options">
										<i class="fa-solid fa-ellipsis" id="options"></i>
										<div class="dropdown-content">
											<p>Tắt trạng thái</p>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div class="tab-pane fade" id="statistical" role="tabpanel"
						aria-labelledby="statistical-tab">
						<!-- <h4 class="title-tab">Thống kê</h4> -->
						<div class="tabs">
							<input type="radio" id="tab1" name="tab-control" checked>
							<input type="radio" id="tab2" name="tab-control">
							<ul>
								<li title="Likes"><label for="tab1" role="button">
										<i class="fa-solid fa-thumbs-up"></i> <br>
									<span>Bài đăng</span>
								</label></li>
								<li title="Account"><label for="tab2" role="button">
										<i class="fa-solid fa-users"></i> <br>
									<span>Tài khoản</span>
								</label></li>
							</ul>
							<div class="slider">
								<div class="indicator"></div>
							</div>
							<div class="content-tab3">
								<section>
									<h2>Bài đăng</h2>
									<table class="rwd-table-post">
										<thead>
											<tr>
												<th>Ảnh</th>
												<th>Người đăng</th>
												<th>Lượt thích</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td data-th="Ảnh"><img
													src="views/images/posts/post1.jpg" alt=""></td>
												<td data-th="Người đăng ">Nguyễn Văn An</td>
												<td data-th="Lượt thích ">200</td>
											</tr>
											<tr>
												<td data-th="Ảnh"><img
													src="views/images/posts/post1.jpg" alt=""></td>
												<td data-th="Người đăng ">Nguyễn Văn An</td>
												<td data-th="Lượt thích ">200</td>
											</tr>
											<tr>
												<td data-th="Ảnh"><img
													src="views/images/posts/post1.jpg" alt=""></td>
												<td data-th="Người đăng ">Nguyễn Văn An</td>
												<td data-th="Lượt thích ">200</td>
											</tr>
											<tr>
												<td data-th="Ảnh"><img
													src="views/images/posts/post1.jpg" alt=""></td>
												<td data-th="Người đăng ">Nguyễn Văn An</td>
												<td data-th="Lượt thích ">200</td>
											</tr>
											<tr>
												<td data-th="Ảnh"><img
													src="views/images/posts/post1.jpg" alt=""></td>
												<td data-th="Người đăng ">Nguyễn Văn An</td>
												<td data-th="Lượt thích ">200</td>
											</tr>
											<tr>
												<td data-th="Ảnh"><img
													src="views/images/posts/post1.jpg" alt=""></td>
												<td data-th="Người đăng ">Nguyễn Văn An</td>
												<td data-th="Lượt thích ">200</td>
											</tr>
											<tr>
												<td data-th="Ảnh"><img
													src="views/images/posts/post1.jpg" alt=""></td>
												<td data-th="Người đăng ">Nguyễn Văn An</td>
												<td data-th="Lượt thích ">200</td>
											</tr>
										</tbody>
									</table>
								</section>
								<section>
									<h2>Tài khoản</h2>
									<table class="rwd-table">
										<thead>
											<tr>
												<th>Tên</th>
												<th>Điểm</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td data-th="Tên">Nguyễn Văn An</td>
												<td data-th="Điểm">50</td>
											</tr>
											<tr>
												<td data-th="Tên">Nguyễn Văn An</td>
												<td data-th="Điểm">50</td>
											</tr>
											<tr>
												<td data-th="Tên">Nguyễn Văn An</td>
												<td data-th="Điểm">50</td>
											</tr>
										</tbody>
									</table>
								</section>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Create post -->
	<dialog id="favDialog">
	<div id="close_createPost">
		<i class="fa-solid fa-xmark"></i>
	</div>
	<div class="main_create_post">
		<div class="container">
			<div class="wrapper">
				<section class="post">
					<header> Đăng bài </header>

					<form action="#">
						<div class="content">
							<img src="views/images/user/user.jpg" alt="logo">
							<div class="details">
								<p>dannk</p>
								<div class="privacy">
									<i class="fas fa-user-friends"></i> <span> Bạn bè </span> <i
										class="fas fa-caret-down"></i>
								</div>
							</div>
						</div>
						<textarea placeholder="Nội dung?" spellcheck="false" required></textarea>
						<div class="options">
							<p>Thêm vào bài viết của bạn</p>
							<ul class="list">
								<li><img src="views/images/icons/gallery.svg" alt="gallery"></li>
								<li><img src="views/images/icons/tag.svg" alt="gallery"></li>
								<li><img src="views/images/icons/emoji.svg" alt="gallery"></li>
								<li><img src="views/images/icons/mic.svg" alt="gallery"></li>
							</ul>
						</div>
						<button>Post</button>
					</form>
				</section>
				<section class="audience">
					<header>
						<div class="arrow-back">
							<i class="fas fa-arrow-left"></i>
						</div>
						<p>Đối tượng của bài viết</p>
					</header>
					<div class="content">
						<p>Ai có thể xem bài đăng?</p>
					</div>
					<ul class="list">
						<li>
							<div class="column">
								<div class="icon">
									<i class="fas fa-globe-asia"></i>
								</div>
								<div class="details">
									<p>Công khai</p>
									<span>Tất cả mọi người đều có thể xem</span>
								</div>
							</div>
							<div class="radio"></div>
						</li>
						<li>
							<div class="column">
								<div class="icon">
									<i class="fas fa-lock"></i>
								</div>
								<div class="details">
									<p>Riêng tư</p>
									<span>Chỉ bạn có thê thấy</span>
								</div>
							</div>
							<div class="radio"></div>
						</li>
					</ul>
				</section>
			</div>
		</div>
	</div>
	</dialog>

	<!-- Notifications -->
	<dialog id="favDialog_notifications">
	<div id="close_notifications">
		<i class="fa-solid fa-xmark"></i>
	</div>
	<div class="container_notifications">
		<header>
			<div class="notif_box">
				<h2 class="title">Thông báo</h2>
				<span id="notifes">3</span>
			</div>
			<p id="mark_all">Xem tất cả</p>
		</header>
		<main>
			<div class="notif_card unread">
				<img src="views/images/user/user3.jpg" alt="avatar" />
				<div class="description">
					<p class="user_activity">
						<strong>dangth</strong> đã bài tỏ quan tâm bài đăng <strong
							class="link">Post 1</strong>
					</p>
					<p class="time">1 ngày trước</p>
				</div>
			</div>
			<div>
				<div class="notif_card">
					<img src="views/images/user/user2.jpg" alt="avatar" />
					<div class="description">
						<p class="user_activity">
							<strong>An</strong> đã gửi cho bạn một tin nhắn
						</p>
						<p class="time">5 ngày trước</p>
					</div>
				</div>
			</div>
			<div class="notif_card">
				<img src="views/images/user/user1.jpg" alt="avatar" />
				<div class="description">
					<p class="user_activity">
						<strong>Vilb</strong> đã bài tỏ quan tâm bài đăng <strong
							class="link">Post 1</strong>
					</p>
					<p class="time">2 tuần trước</p>
				</div>
			</div>
		</main>
	</div>
	</dialog>

	<!-- Follow -->
	<dialog id="favDialog_follow">
	<div id="close_follow">
		<i class="fa-solid fa-xmark"></i>
	</div>
	<div class="follow">
		<p class="suggestion-text">Danh sách theo dõi</p>
		<div class="list-following">
			<div class="profile-card-follow">
				<div class="profile-pic">
					<img src="views/images/user/user1.jpg" alt="">
				</div>
				<div>
					<p class="username">Nguyễn Văn An</p>
					<p class="sub-text">an</p>
				</div>
				<button class="action-btn">Hủy</button>
			</div>
			<div class="profile-card-follow">
				<div class="profile-pic">
					<img src="views/images/user/user2.jpg" alt="">
				</div>
				<div>
					<p class="username">Lê Bích Vi</p>
					<p class="sub-text">vilb</p>
				</div>
				<button class="action-btn">Hủy</button>
			</div>
			<div class="profile-card-follow">
				<div class="profile-pic">
					<img src="views/images/user/user3.jpg" alt="">
				</div>
				<div>
					<p class="username">Đoàn Hiệp Sỹ</p>
					<p class="sub-text">sydh</p>
				</div>
				<button class="action-btn">Hủy</button>
			</div>
			<div class="profile-card-follow">
				<div class="profile-pic">
					<img src="views/images/user/user4.jpg" alt="">
				</div>
				<div>
					<p class="username">Vinhpq</p>
					<p class="sub-text">vinhqp</p>
				</div>
				<button class="action-btn">Hủy</button>
			</div>
			<div class="profile-card-follow">
				<div class="profile-pic">
					<img src="views/images/user/user5.jpg" alt="">
				</div>
				<div>
					<p class="username">Trần Hữu Đang</p>
					<p class="sub-text">dangth</p>
				</div>
				<button class="action-btn">Hủy</button>
			</div>
		</div>
	</div>
	</dialog>

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
			<i class="fa-solid fa-sun"></i> <input type="checkbox"
				id="toggle-btn" /> <label for="toggle-btn" class="toggle-btn">
				<span class="toggle"></span>
			</label> <i class="fa-solid fa-cloud-moon"></i>
		</div>
		<div class="button-container">
			<div class='button -dark center'>Vô hiệu hóa tài khoản</div>
		</div>
	</div>
	</dialog>
	<script src="views/js/home.js"></script>
</body>
</html>