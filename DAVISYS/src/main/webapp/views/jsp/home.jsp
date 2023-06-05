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
<link rel="stylesheet" href="views/css/home.css">
<link rel="stylesheet" href="views/css/loadimages.css">
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
<script src="views/js/jquery.min.js"></script>
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

		<div class="navbar-collapse collapse" id="navbarSupportedContent"
			style="height: fit-content !important;">
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
							test="${sessionScope.user==null}">
            Tài khoản &dtrif;
            </c:if> <c:if test="${sessionScope.user!=null}">
           ${sessionScope.user.fullname}&dtrif;
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
		<!-- post section -->
		<div class="post-container">
			<c:forEach items="${posts}" var="posts">
				<div class="post">
					<div class="info">
						<div class="post-header">
							<a href="profile"> <img src="${ posts.user.avatar }"
								class="user-icon" alt="">
								<p class="username">@${ posts.user.username }</p> <span>${ posts.date_Post }</span>
							</a>

						</div>
						<div class="dropdown-options">
							<i class="fa-solid fa-ellipsis" id="options"></i>
							<div class="dropdown-content">
								<p>Báo cáo bài viết</p>
								<p>views.</p>
							</div>
						</div>
					</div>
					<div class="post-feed">
						<div class="post-img-container">
							<img src="${ posts.link_Image }" alt="">
						</div>
					</div>
					<div class="post-detail">
						<div class="detail-intracables">
							<i class="fa-regular fa-paper-plane"></i> <i
								class="showButton_share fa-solid fa-share"></i> <i
								class="showCmt fa-regular fa-comment"></i>
						</div>
						<span class="interest">#${ posts.hashTag }</span>
						<span class="interest">Trạng thái: chưa có người nhận</span>
						<p class="username">Vị trí: ${ posts.address_Product }</p>
						<p class="post-des">${ posts.post }</p>

						<div class="comment-box">
							<input type="text" id="comment-input" placeholder="Bình luận">
							<button class="add-comment-btn">
								<i class="send">Gửi</i>
							</button>
						</div>

						<span class="comment-count">50 bình luận</span>
					</div>
				</div>
				<hr>
			</c:forEach>
		</div>

		<!-- right section -->
		<div class="user-about-section">
			<div class="right-col">
				<h1 class="suggestion-heading-trend">
					<i class="fa-solid fa-fire"></i> Thịnh hành
				</h1>
				<div class="right-top">
					<a class="profile-card">
						<p class="top-trend" style="color: red;">
							<i class="fa-solid fa-medal"></i> #1
						</p>
						<div class="profile-pic">
							<img src="views/images/posts/post1.jpg" alt="">
						</div>
						<div>
							<p class="username">Post 1</p>
							<p class="sub-text">Lorem, ipsum dolor sit amet consectetur
								adipisicing elit.</p>
						</div>
					</a> <a class="profile-card">
						<p class="top-trend">
							<i class="fa-solid fa-medal"></i>#2
						</p>
						<div class="profile-pic">
							<img src="views/images/posts/post2.jpg" alt="">
						</div>
						<div>
							<p class="username">Post 2</p>
							<p class="sub-text">Lorem, ipsum dolor sit amet consectetur
								adipisicing elit.</p>
						</div>
					</a> <a class="profile-card">
						<p class="top-trend">
							<i class="fa-solid fa-medal"></i>#3
						</p>
						<div class="profile-pic">
							<img src="views/images/posts/post1.jpg" alt="">
						</div>
						<div>
							<p class="username">Post 3</p>
							<p class="sub-text">Lorem, ipsum dolor sit amet consectetur
								adipisicing elit.</p>
						</div>
					</a>
				</div>
				<h1 class="suggestion-heading">Đề xuất cho bạn</h1>
				<div class="suggestion-container">
					<c:forEach items="${listFriends}" var="lsf" begin='0' end='3'>
						<div class="user-card">
							<img src="${ lsf.avatar }" class="user-dp" alt="">
							<p class="username">@${ lsf.username }</p>
							<a href="/addFollow/${lsf.ID}" class="follow-btn">follow</a>
						</div>
					</c:forEach>
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

					<form action="/uploadImg" method="post"
						enctype="multipart/form-data">
						<div class="content">
							<img src="${sessionScope.user.avatar}" alt="logo">
							<div class="details">
								<p>${sessionScope.user.fullname}</p>
								<div class="privacy" id="ststus_post">
									
								</div>
							</div>
						</div>
						<div class="content-post">
						<input type="text" placeholder="Tên sản phẩm?" name="product" required>
							<textarea placeholder="Nội dung?" spellcheck="false" name="content" required></textarea>
							<div id="images-to-upload"></div>
						</div>

						<div class="options">
							<p>Thêm vào bài viết của bạn</p>
							<ul class="list">
								<li><label> <img
										src="views/images/icons/gallery.svg" alt="gallery"> <input
										id="ip_images" type="file" accept="image/*" name="image_file"
										multiple="true">
								</label></li>
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
							</div> <input type="radio"  class="radio show_status" value="true" name="radio"
							checked="checked">
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
							</div> <input type="radio"  class="radio show_status" value="false" name="radio">
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
			<i class="fa-solid fa-cloud-moon"></i>
			<div class="toggle-switch">
				<label class="switch-label"> <input type="checkbox"
					class="checkbox"> <span class="slider"></span>
				</label>
			</div>
			<i class="fa-solid fa-sun"></i>
		</div>
		<div class="button-container">
			<div class='button -dark center'>Vô hiệu hóa tài khoản</div>
		</div>
	</div>
	</dialog>

	<!-- Setting -->
	<dialog id="favDialog_share">
	<div id="close_share">
		<i class="fa-solid fa-xmark"></i>
	</div>
	<div class="setting">
		<p class="suggestion-text">Chia sẻ</p>
		<p>Nhập email bạn muốn chia sẻ</p>
		<div class="input-group">
			<input required="" type="text" name="text" autocomplete="off"
				class="input"> <label class="user-label">Email</label>
		</div>
		<button class="share">
			<div class="svg-wrapper-1">
				<div class="svg-wrapper">
					<svg height="24" width="24" viewBox="0 0 24 24"
						xmlns="http://www.w3.org/2000/svg">
                          <path d="M0 0h24v24H0z" fill="none"></path>
                          <path
							d="M1.946 9.315c-.522-.174-.527-.455.01-.634l19.087-6.362c.529-.176.832.12.684.638l-5.454 19.086c-.15.529-.455.547-.679.045L12 14l6-8-8 6-8.054-2.685z"
							fill="currentColor"></path>
                        </svg>
				</div>
			</div>
			<span>Gửi</span>
		</button>
	</div>
	</dialog>

	<dialog id="favDialog_comment">
	<div id="close_cmt" type="button">
		<i class="fa-solid fa-xmark"></i>
	</div>
	<div class="cmt-container">
		<div class="post">
			<div class="post-detail">
				<div class="full-boxer">
					<div class="comment__container opened" id="first-comment">
						<div class="comment__card">
							<div class="box-top">
								<div class="Profile">
									<div class="profile-image">
										<img src="views/images/user/user.jpg">
									</div>
									<div class="Name">
										<strong>Nguyễn Khánh Đan</strong> <span>@dannk</span>
									</div>
								</div>
							</div>
							<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit.
								Voluptatum eaque itaque sit tempora officiis, quisquam atque?
								Impedit dignissimos error laudantium!</p>
							<div class="comment__card-footer">
								<div class="show-replies">Trả lời 2</div>
							</div>
						</div>
						<div class="comment__container" dataset="first-comment"
							id="first-reply">
							<div class="comment__card">
								<div class="box-top">
									<div class="Profile">
										<div class="profile-image">
											<img src="views/images/user/user.jpg">
										</div>
										<div class="Name">
											<strong>Nguyễn Khánh Đan</strong> <span>@dannk</span>
										</div>
									</div>
								</div>
								<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit.
									Voluptatum eaque itaque sit tempora officiis, quisquam atque?
									Impedit dignissimos error laudantium!</p>
							</div>
						</div>
						<div class="comment__container" dataset="first-comment">
							<div class="comment__card">
								<div class="box-top">
									<div class="Profile">
										<div class="profile-image">
											<img src="views/images/user/user.jpg">
										</div>
										<div class="Name">
											<strong>Nguyễn Khánh Đan</strong> <span>@dannk</span>
										</div>
									</div>
								</div>
								<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit.
									Voluptatum eaque itaque sit tempora officiis, quisquam atque?
									Impedit dignissimos error laudantium!</p>
							</div>
						</div>
					</div>
				</div>

				<div class="detail-intracables" style="margin-top: 1rem;">
					<i class="fa-regular fa-paper-plane"></i> <i
						class="fa-solid fa-share"></i> <i class="fa-regular fa-comment"></i>
				</div>
				<span class="interest">10 Lượt quan tâm</span>
				<div class="comment-box">
					<input type="text" id="comment-input" placeholder="Bình luận">
					<button class="add-comment-btn">
						<i class="fa-regular fa-comment"></i>
					</button>
				</div>

				<span class="comment-count">50 bình luận</span>
			</div>
		</div>
	</div>
	</dialog>
	<script src="views/js/home.js"></script>
	<script src="views/js/loadimages.js"></script>
</body>
</html>