<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="views/css/message.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://kit.fontawesome.com/152112956f.js" crossorigin="anonymous"></script>
</head>
<body>
 <nav class="primary-navigation navbar navbar-expand-lg navbar-light" id="nav-horizontal">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul>
                <li class="search">
                    <div class="input-box">
                        <i class="fa-solid fa-magnifying-glass"></i>
                        <input class="find" type="text" placeholder="Tìm kiếm" />
                    </div>
                </li>
                <li><a href="adminpage">Quản lý</a></li>
                <li class="account"><a href="views/html/profile.html">Tài khoản &dtrif;</a>
                    <ul class="dropdown">
                        <li><a href="views/html/updateprofile.html">Cập nhật tài khoản</a></li>
                        <li><a href="views/index.html">Đăng xuất</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>


    <aside class="sidebar">
        <header class="sidebar-header">
            <h1>DASIDO</h1>
        </header>
        <nav>
            <a href="homm">
                <span>
                    <i class="fa-solid fa-house"></i>
                    <span>Trang chủ</span>
                </span>
            </a>

            <a id="showDialog">
                <span>
                    <i id="showDialog" class="fa-solid fa-plus"></i>
                    <span>Đăng bài</span>
                </span>
            </a>

            <a href="history">
                <span>
                    <i class="fa-solid fa-clock-rotate-left"></i>
                    <span>Lịch sử</span>
                </span>
            </a>

            <a href="message">
                <span>
                    <i class="fa-solid fa-location-arrow">
                        <span>12</span>
                    </i>
                    <span>Tin nhắn</span>
                </span>
            </a>

            <a id="showDialog_Notifications">
                <span>
                    <i class="fa-regular fa-bell">
                        <span>12</span>
                    </i>
                    <span>Thông báo</span>
                </span>
            </a>

            <a id="showButton_follow">
                <span>
                    <i class="fa-regular fa-heart"></i>
                    <span>Theo dõi</span>
                </span>
            </a>

            <a id="showButton_setting">
                <span>
                    <i class="fa-solid fa-gear"></i>
                    <span>Cài đặt</span>
                </span>
            </a>
        </nav>
    </aside>

    <!-- main section -->
    <section class="main">
        <div class="container_message clearfix">
            <div class="people-list" id="people-list">
                <div class="search">
                    <input type="text" placeholder="Tìm kiếm bạn bè" />
                    <i class="fa fa-search"></i>
                </div>
                <ul class="list">
                    <a class="clearfix">
                        <li>
                            <img src="views/images/user/user5.jpg" alt="avatar" />
                            <div class="about">
                                <div class="name">Trần Hữu Đang</div>
                                <div class="status">
                                    hoạt động
                                </div>
                            </div>
                        </li>
                    </a>

                    <li class="clearfix">
                        <img src="views/images/user/user2.jpg" alt="avatar" />
                        <div class="about">
                            <div class="name">Lê Bích Vi</div>
                            <div class="status">
                                10 phút trước
                            </div>
                        </div>
                    </li>

                    <li class="clearfix">
                        <img src="views/images/user/user3.jpg" alt="avatar" />
                        <div class="about">
                            <div class="name">Đoàn Hiệp Sỹ</div>
                            <div class="status">
                                hoạt động
                            </div>
                        </div>
                    </li>

                    <li class="clearfix">
                        <img src="views/images/user/user4.jpg" alt="avatar" />
                        <div class="about">
                            <div class="name">Phùng Quốc Vinh</div>
                            <div class="status">
                                hoạt động
                            </div>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="chat">
                <div class="message-null">
                    <h1>LOGO</h1>
                    <div>
                        <p>Gửi ảnh và tin nhắn riêng tư cho bạn bè của bạn</p>
                    </div>
                </div>
                <div class="message-content">
                    <div class="chat-header clearfix">
                        <img src="views/images/user/user1.jpg" alt="avatar" />
    
                        <div class="chat-about">
                            <div class="chat-with">An</div>
                            <div class="chat-num-messages">Hoạt động 9 phút trước</div>
                        </div>
                        <div class="close_mess float-right">
                            <i class="fa-solid fa-xmark"></i>
                        </div>
                    </div> 
    
                    <div class="chat-history">
                        <ul>
                            <li class="clearfix">
                                <div class="message my-message">
                                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Delectus accusantium veniam dignissimos quaerat perferendis sed praesentium reiciendis distinctio consequatur corporis eveniet dolorem, obcaecati blanditiis velit necessitatibus, eum, rem magnam dolores.
                                </div>
                                <div class="message-data align-right">
                                    <span class="message-data-time">10:10 AM, Hôm nay</span>
                                </div>
                            </li>
    
                            <li>
                                <div class="mess-content">
                                        <img class="avatar-fr" src="views/images/user/user1.jpg" alt="">
                                    <span class="message other-message">
                                        Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                    </span>
                                </div>
                                <div class="message-data">
                                    <span class="message-data-time">10:12 AM, Hôm nay</span>
                                </div>
                            </li>
                        </ul>
    
                    </div>
                    <div class="chat-message clearfix">
                        <input name="message-to-send" id="message-to-send" placeholder="Nhập tin nhắn"/>
                            <i class="fa-solid fa-paper-plane"></i> 
                    </div> 
                </div>
                

            </div> <!-- end chat -->

        </div> <!-- end container -->

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
<script src="views/js/message.js"></script>
</body>
</html>