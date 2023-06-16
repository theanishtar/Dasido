<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="views/css/validator.css">
</head>
<body>
	<div class="container">
		<h2>Mã xác nhận</h2>
		<p>
			DASIDO đã gửi mã xác nhận đến email của bạn <br /> Nhập mã dưới đây
			để xác nhận địa chỉ email của bạn
		</p>
		<fr:form action="/validate" method="POST">
			<div class="code-container">
				<input type="text" name="mxn" class="code" placeholder="Nhập mã">
			</div>
			<span>${messagevalidate}</span>
			<div>
				<button type="submit" class="btn btn-primary">Xác nhận</button>
			</div>
		</fr:form>

		<small class="info"> Quay lại <a href="signup"> đăng ký</a>
		</small>

	</div>
</body>
</html>