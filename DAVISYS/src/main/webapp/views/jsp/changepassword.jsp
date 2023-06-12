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

<link rel="stylesheet" href="views/css/changepass.css">

<script src="https://kit.fontawesome.com/152112956f.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<section>
	
			<div class="col-md-6 offset-md-3">

				<!-- form card change password -->
				<div class="card card-outline-secondary">
					<div class="card-header">
						<h3 class="mb-0">Đổi mật khẩu</h3>
						
					</div>
					<div class="card-body">
						<form class="form" action="/changepass" method="POST" enctype="multipart/form-data" >
							<c:if test="${changepass == 'Mật khẩu hiện tại của bạn không đúng!'  || changepass == 'Mật khẩu xác nhận không trùng khớp!'}">
							<p style="color: red;"><em>${changepass}</em> </p>
							</c:if>
							<c:if test="${changepass == 'Đổi mật khẩu thành công!'}">
							<p style="color:green;"><em>${changepass}</em> </p>
							</c:if>
							<div class="form-group">
								<label for="inputPasswordOld">Mật khẩu cũ </label> 
								 <span class="form-item-icon-eye hide-show-pass" style="padding-left: 1rem">
                                    <i onclick="showHidePass1()" class="fa-regular fa-eye" id="eye"></i>
                                </span>
								<input
									type="text" class="form-control" name="passold" id="inputPasswordOld"
									required="">
								
							</div>
							<div class="form-group">
								<label for="inputPasswordNew">Mật khẩu mới </label>
								<span class="form-item-icon-eye hide-show-pass" style="padding-left: 1rem">
                                    <i onclick="showHidePass2()" class="fa-regular fa-eye" id="eye1"></i>
                                </span> 
                                <input
									type="text" class="form-control" name="passnew" id="inputPasswordNew"
									required=""> 
									
									
							</div>
							<div class="form-group">
								<label for="inputPasswordConfirm">Xác nhận mật khẩu </label> 
								<span class="form-item-icon-eye hide-show-pass" style="padding-left: 1rem">
                                    <i onclick="showHidePass3()"  class="fa-regular fa-eye" id="eye2"></i>
                                </span>
								<input
									type="text" class="form-control"
									id="inputPasswordConfirm" name="confirmpass" required="">
									
									
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-success btn-lg float-right">Đổi</button>
							</div>
						</form>
					</div>
				</div>
				</div>
		
	</section>
	 <script src="views/js/show_hidePass.js"></script>
</body>
</html>