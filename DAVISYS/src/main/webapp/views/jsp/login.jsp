<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/views/css/login.css">
    <script src="https://kit.fontawesome.com/152112956f.js" crossorigin="anonymous"></script>
</head>
<body>
<section class="reason">
        <div class="section__container reason__container">
            <div class="left_content">
                <div>
                    <div class="section__title">
                        <!-- <p>DASIDO</p> -->
                        <div class="animated-word">
                            <div class="letter">D</div>
                            <div class="letter">A</div>
                            <div class="letter">S</div>
                            <div class="letter">I</div>
                            <div class="letter">D</div>
                            <div class="letter">O</div>
                        </div>
                        Diễn đàn tặng đồ cũ 
                    </div>
                    <p class="section__subtitle">
                        Chào mừng bạn đến với DASIDO <br>
                        Nơi bạn có thể nhận hàng ngàn món đồ secondhand miễn phí !!!
                    </p>
                    <div class="return">
                        Quay lại
                        <a href="index">trang chủ</a>
                    </div>
                </div>
                
            </div>
            <div class="right_content">
                <div class="login-card-container">
                    <div class="login-card">
                        <div class="login-card-logo">
                            <!-- <img src="views/images/logo.png" alt="logo"> -->
                            LOGO
                        </div>
                        <div class="login-card-header">
                            <h1>Đăng nhập</h1>
                            <div>Vui lòng đăng nhập để sử dụng diễn đàn</div>
                            <span class="error">${message}</span>
                        </div>
                        <form class="login-card-form" action="/log" method="post">
                            <div class="form-item">
                                <span class="form-item-icon material-symbols-rounded">
                                    <i class="fa-solid fa-user"></i>
                                </span>
                                <input type="text" placeholder="Tên đăng nhập" value="${user}" name="usernamelg" id="usernameForm" 
                                required>
                            </div>
                            <div class="form-item">
                                <span class="form-item-icon material-symbols-rounded">
                                    <i class="fa-solid fa-lock"></i>
                                </span>
                                <input type="password" value="${pass}" placeholder="Mật khẩu" name="passwordlg" id="passwordForm"
                                 required>
                                 <span class="form-item-icon-eye hide-show-pass">
                                    <i onclick="showHidePass()" class="fa-regular fa-eye" id="eye"></i>
                                </span>
                            </div>
                            <div class="form-item-other">
                                <div class="checkbox">
                                    <input type="checkbox" name="remember" value="true" id="rememberMeCheckbox">
                                    <label for="rememberMeCheckbox">Duy trì đăng nhập</label>
                                </div>
                                <a href="forgot">Quên mật khẩu!</a>
                            </div>
                            <button type="submit">Đăng nhập</button>
                        </form>
                    </div>
                    <div class="striped">
                        <span class="striped-line"></span>
                        <span class="striped-text">Or</span>
                        <span class="striped-line"></span>
                    </div>
                    <div class="method">
                        <div class="method-control">
                            <a href="#" class="method-action">
                                <i class="fa-brands fa-google"></i>
                                <span>Đăng nhập với Google</span>
                            </a>
                        </div>
                    </div>
                    <div class="login-card-footer">
                        Bạn chưa có tài khoản? <a href="signup">Đăng ký</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script src="views/js/show_hidePass.js"></script>
</body>
</html>