<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/views/css/forgotpassword.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="/views/js/jquery.min.js"></script>

<script src="https://kit.fontawesome.com/152112956f.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
</head>
<body>
	<main class="main">
		<div class="container">
			<section class="wrapper">
				<div class="heading">
					<h1 class="text text-large">Bạn quên mật khẩu?</h1>
					<p class="text text-normal">Hãy nhập email của bạn để nhận mã
						đổi mật khẩu</p>
				</div>
				<form name="signin" class="form">
					<div class="input-control">
						<label for="email" class="input-label" hidden>Email</label> <input
							type="email" name="emailForgot" id="email" class="input-field"
							placeholder="Nhập email" required> <span
							id="messageForgot1"></span>
					</div>
					<div class="input-control">
						<input type="button" name="submit" class="input-submit"
							value="Nhận mã" required>
					</div>
				</form>
				<div class="striped">
					<span class="striped-line"></span> <span class="striped-text">Or</span>
					<span class="striped-line"></span>
				</div>
				<div class="method">
					<div class="method-control">
						<a href="login" class="method-action"> <i
							class="fa-solid fa-right-to-bracket"></i> <span> Đăng nhập</span>
						</a>
					</div>
				</div>
			</section>

			<section class="wrapper_validator">
				<div class="container_validator">

					<h2>Mã xác nhận</h2>
					<p>
						DASIDO đã gửi mã xác nhận đến email của bạn <br /> Nhập mã dưới
						đây để xác nhận địa chỉ email của bạn
					</p>

					<div class="code-container">
						<input type="text" class="code" id="mxn" maxlength="6"
							placeholder="Nhập mã"> <span id="messageForgot2"></span>
					</div>

					<div>
						<button type="submit" class="btn-confirm">Xác nhận</button>
					</div>
					<small class="info"> Quay lại </small>

				</div>
			</section>

			<section class="wrapper_changepass">
				<div class="container_changepass">
					<h2>Đổi mật khẩu</h2>

					<div class="code-container">
						<input type="text" id="newpass" class="change-pass"
							placeholder="Mật khẩu mới">
					</div>
					<div class="code-container">
						<input type="text" id="confirmpass" class="change-pass"
							placeholder="Xác nhận mật khẩu">
					</div>
					<span id="messageForgot3"></span>
					<div>
						<button type="submit" id="btn_submit" onclick="btn_submit()"
							class="btn-change">Xác nhận</button>
					</div>
					<span class="back-validator"> <a href="login"> <i
							class="fa-solid fa-right-to-bracket"></i> Đăng nhập
					</a>
					</span>
				</div>
			</section>
		</div>
	</main>

	<script src="/views/js/forgotpassword.js"></script>
</body>
</html>