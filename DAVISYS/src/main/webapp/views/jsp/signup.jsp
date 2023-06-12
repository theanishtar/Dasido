<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="views/css/signup.css">
    <script src="https://kit.fontawesome.com/152112956f.js" crossorigin="anonymous"></script>
</head>
<body>
<section class="reason">
        <div class="section__container reason__container">
            <div class="left_content">
                <div class="container">
                    <div class="signup-content">
                        <form method="POST" id="signup-form" class="signup-form">
                            <h2 class="form-title">Đăng ký</h2>
                            <!-- <p class="content">Đăng ký để trao và nhận hàng ngàn món đồ Secondhand!!!</p> -->
                            <div class="form-group">
                                <input type="text" class="form-input" name="username" id="username" placeholder="Tên đăng nhập"/>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-input" name="email" id="email" placeholder="Email"/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-input" name="password" id="password" placeholder="Mật khẩu"/>
                                <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-input" name="re_password" id="re_password" placeholder="Xác nhận mật khẩu"/>
                            </div>
                            <div class="form-group">
                                <input type="submit" name="submit" id="submit" class="form-submit" value="Đăng ký"/>
                            </div>
                        </form>
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
                        <p class="loginhere">
                            Bạn đã có tài khoản? <a href="log" class="loginhere-link">Đăng nhập</a>
                        </p>
                    </div>
                </div>
                
            </div>
            <div class="right_content">
                <div>
                    <div class="section__title">
                        <p>Diễn đàn DASIDO</p>
                        "Chia sẻ đồ cũ - Tạo niềm vui mới"
                    </div>
                    <p class="section__subtitle">
                        <!-- "Chia sẻ đồ cũ - Tạo niềm vui mới"<br> -->
                        Đăng ký ngay để nhận hàng ngàn món đồ Secondhand miễn phí!!!
                    </p>
                    <div class="return">
                        Quay lại
                        <a href="index">trang chủ</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>