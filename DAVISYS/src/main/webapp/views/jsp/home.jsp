<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="views/css/home.css">
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

        <div class="navbar-collapse collapse" id="navbarSupportedContent" style="height: fit-content !important;">
            <ul>
                <li class="search">
                    <div class="input-box">
                        <i class="fa-solid fa-magnifying-glass"></i>
                        <input class="find" type="text" placeholder="Tìm kiếm" />
                    </div>
                </li>
                <!-- <li><a href="#">Quản lý &dtrif;</a>
                    <ul class="dropdown">
                        <li><a href="#">Bài đăng</a></li>
                        <li><a href="#">Người dùng</a></li>
                        <li><a href="#">Xem xét và xóa báo cáo</a></li>
                        <li><a href="#">Thống kê</a></li>
                    </ul>
                </li> -->
                <li><a href="adminpage">Quản lý</a></li>
                <li class="account"><a href="profile">Tài khoản &dtrif;</a>
                    <ul class="dropdown">
                        <li><a href="updateprofile">Cập nhật tài khoản</a></li>
                        <li><a href="index">Đăng xuất</a></li>
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
        <!-- post section -->
        <div class="post-container">
            <div class="post">
                <div class="info">
                    <div class="post-header">
                        <img src="views/images/user/user.jpg" class="user-icon" alt="">
                        <p class="username">@dannk</p>
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
                        <img src="views/images/posts/post1.jpg" alt="">
                    </div>
                </div>
                <div class="post-detail">
                    <div class="detail-intracables">
                        <i class="fa-regular fa-paper-plane"></i>
                        <i class="fa-solid fa-share"></i>
                        <i class="fa-regular fa-comment"></i>
                    </div>
                    <span class="interest">10 Lượt quan tâm</span>
                    <p class="username">@dannk</p>
                    <p class="post-des">Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolores ipsa incidunt
                        obcaecati esse illo voluptates libero debitis nisi. Id tempora vel illum vitae temporibus
                        commodi non cupiditate atque voluptas. Ipsam.</p>

                    <div class="comment-box">
                        <input type="text" id="comment-input" placeholder="Bình luận">
                        <button class="add-comment-btn"> <i class="send">Gửi</i></button>
                    </div>

                    <span class="comment-count">50 bình luận</span>
                </div>
            </div>
            <hr>
            <div class="post">
                <div class="info">
                    <div class="post-header">
                        <img src="views/images/user/user.jpg" class="user-icon" alt="">
                        <p class="username">@dannk</p>
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
                        <img src="views/images/posts/post2.jpg" alt="">
                    </div>
                </div>
                <div class="post-detail">
                    <div class="detail-intracables">
                        <i class="fa-regular fa-paper-plane"></i>
                        <i class="fa-solid fa-share"></i>
                        <i class="fa-regular fa-comment"></i>
                    </div>
                    <span class="interest">15 Lượt quan tâm</span>
                    <p class="username">@dannk</p>
                    <p class="post-des">Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolores ipsa incidunt
                        obcaecati esse illo voluptates libero debitis nisi. Id tempora vel illum vitae temporibus
                        commodi non cupiditate atque voluptas. Ipsam.</p>

                    <div class="comment-box">
                        <input type="text" id="comment-input" placeholder="Bình luận">
                        <button class="add-comment-btn"> <i class="fa-regular fa-comment"></i></button>
                    </div>

                    <span class="comment-count">20 bình luận</span>
                </div>
            </div>
        </div>

        <!-- right section -->
        <div class="user-about-section">
            <div class="right-col">
                <h1 class="suggestion-heading-trend"><i class="fa-solid fa-fire"></i> Thịnh hành</h1>
                <div class="right-top">
                    <a class="profile-card">
                        <p class="top-trend" style="color: red;"><i class="fa-solid fa-medal"></i> #1</p>
                        <div class="profile-pic">
                            <img src="views/images/posts/post1.jpg" alt="">
                        </div>
                        <div>
                            <p class="username">Post 1</p>
                            <p class="sub-text">Lorem, ipsum dolor sit amet consectetur adipisicing elit.</p>
                        </div>
                    </a>
                    <a class="profile-card">
                        <p class="top-trend"><i class="fa-solid fa-medal"></i>#2</p>
                        <div class="profile-pic">
                            <img src="views/images/posts/post2.jpg" alt="">
                        </div>
                        <div>
                            <p class="username">Post 2</p>
                            <p class="sub-text">Lorem, ipsum dolor sit amet consectetur adipisicing elit.</p>
                        </div>
                    </a>
                    <a class="profile-card">
                        <p class="top-trend"><i class="fa-solid fa-medal"></i>#3</p>
                        <div class="profile-pic">
                            <img src="views/images/posts/post1.jpg" alt="">
                        </div>
                        <div>
                            <p class="username">Post 3</p>
                            <p class="sub-text">Lorem, ipsum dolor sit amet consectetur adipisicing elit.</p>
                        </div>
                    </a>
                </div>
                <h1 class="suggestion-heading">Đề xuất cho bạn</h1>
                <div class="suggestion-container">
                    <div class="user-card">
                        <img src="views/images/user/user5.jpg" class="user-dp" alt="">
                        <p class="username">@dangth</p>
                        <button class="follow-btn">follow</button>
                    </div>
                    <div class="user-card">
                        <img src="views/images/user/user2.jpg" class="user-dp" alt="">
                        <p class="username">@vilb</p>
                        <button class="follow-btn">follow</button>
                    </div>
                    <div class="user-card">
                        <img src="views/images/user/user3.jpg" class="user-dp" alt="">
                        <p class="username">@sydh</p>
                        <button class="follow-btn">follow</button>
                    </div>
                    <div class="user-card">
                        <img src="views/images/user/user4.jpg" class="user-dp" alt="">
                        <p class="username">@vinhpq</p>
                        <button class="follow-btn">follow</button>
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
                        <header>
                            Đăng bài
                        </header>
                        
                        <form action="#">
                            <div class="content">
                                <img src="views/images/user/user.jpg" alt="logo">
                                <div class="details">
                                    <p>dannk</p>
                                    <div class="privacy">
                                        <i class="fas fa-user-friends"></i>
                                        <span> Bạn bè </span>
                                        <i class="fas fa-caret-down"></i>
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
                            <div class="arrow-back"><i class="fas fa-arrow-left"></i></div>
                            <p>Đối tượng của bài viết</p>
                        </header>
                        <div class="content">
                            <p>Ai có thể xem bài đăng?</p>
                        </div>
                        <ul class="list">
                            <li>
                                <div class="column">
                                    <div class="icon"><i class="fas fa-globe-asia"></i></div>
                                    <div class="details">
                                        <p>Công khai</p>
                                        <span>Tất cả mọi người đều có thể xem</span>
                                    </div>
                                </div>
                                <div class="radio"></div>
                            </li>
                            <li>
                                <div class="column">
                                    <div class="icon"><i class="fas fa-lock"></i></div>
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
                    <strong>dangth</strong> đã bài tỏ quan tâm bài đăng
                    <strong class="link">Post 1</strong>
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
                    <strong>Vilb</strong> đã bài tỏ quan tâm bài đăng
                    <strong class="link">Post 1</strong>
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
                <i class="fa-solid fa-sun"></i>
                <input type="checkbox" id="toggle-btn" />
                <label for="toggle-btn" class="toggle-btn">
                    <span class="toggle"></span>
                </label>
                <i class="fa-solid fa-cloud-moon"></i>
             </div>
             <div class="button-container">
                <div class='button -dark center'>Vô hiệu hóa tài khoản</div>
            </div>
        </div>
    </dialog>
    <script src="views/js/home.js"></script>
</body>
</html>