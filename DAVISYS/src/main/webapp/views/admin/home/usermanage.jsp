<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="views/css/sb-admin-2.min.css" rel="stylesheet">
<link href="views/css/admindpage.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="https://kit.fontawesome.com/152112956f.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<section class="main">
		<div class="container_admin">
			 <div class="shadow rounded-lg d-block d-sm-flex">
				<div class="" id="account-management">
					<div class="tabs">
						<input type="radio" id="tab1" name="tab-control" checked>
						<input type="radio" id="tab2" name="tab-control">
						<ul>
							<li class="nav-item nav-link ${active1}" id="nav-home-tab"
                            data-toggle="tab" name="" href="#nav-home" role="tab"
                            aria-controls="nav-home" aria-selected="true"> <i class="fa-solid fa-thumbs-up"></i> <br>
									<span>Tài khoản</span>
							</label></li>
							<li class="nav-item nav-link ${active2}" id="nav-profile-tab"
                            data-toggle="tab" href="#nav-profile" role="tab"
                            aria-controls="nav-profile" aria-selected="false"> <i class="fa-solid fa-users"></i> <br>
									<span>Thông tin</span>
							</label></li>
						</ul>
						<div class="slider">
							<div class="indicator"></div>
						</div>
						<div class="tab-content" id="nav-tabContent">
							<section  class="tab-pane fade show ${active1}" id="nav-home"
                        role="tabpanel" aria-labelledby="nav-home-tab">
								<h2>Tài khoản</h2>
								<table class="rwd-table">
									<thead>
										<tr>
											<th>Ảnh</th>
											<th>Họ và tên</th>
											<th>Điểm</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${users}" var="user">
											<tr>
												<td data-th="Tên"><img src="/${user.avatar}"
													class="thumb" width="50px" /></td>
												<td data-th="Điểm">${user.fullname}</td>
												<td>${user.mark}</td>
												<td><a href="/edit/${user.username}">Xem</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</section>
							<section class="tab-pane fade ${active2}" id="nav-profile" role="tabpanel"
                        aria-labelledby="nav-profile-tab">
								<form>
									<p>${messageban}</p>
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="inputEmail4">Tên đăng nhập</label> <input
												type="email" name="username" value="${Users .username}"
												class="form-control" id="inputEmail4" placeholder=""
												readonly>
										</div>
										<div class="form-group col-md-6">
											<label for="inputPassword4">Mật khẩu</label> <input
												type="password" value="${Users .password}"
												class="form-control" id="inputPassword4" placeholder=""
												readonly>
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="inputEmail4">Họ và tên</label> <input
												type="email" value="${Users .fullname}" class="form-control"
												id="inputEmail4" placeholder="" readonly>
										</div>
										<div class="form-group col-md-6">
											<label for="inputPassword4">Email</label> <input type="text"
												value="${Users .email}" class="form-control"
												id="inputPassword4" placeholder="" readonly>
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="inputCity">Ngày sinh</label> <input type="date"
												value="${Users .birthday}" class="form-control" id=""
												readonly>
										</div>
										<div class="form-group col-md-2">
											<label for="inputCity">Giới tính</label> <input type="text"
												value="${Users .gender}" class="form-control" id="" readonly>
										</div>
										<div class="form-group col-md-2">
											<label for="inputZip">Điểm</label> <input type="text"
												value="${Users .mark}" class="form-control" id="" readonly>
										</div>
										<div class="form-group col-md-2">
											<label for="inputZip">Báo cáo</label> <input type="text"
												value="${Users .ban}" class="form-control" id="" readonly>
										</div>
									</div>
									<div class="row">
										<div class="col-md-3"> 
										<button type="submit" formaction="/ban" class="btn btn-danger">Vô
											hiệu hóa tài khoản</button></div> 
											<div class="col-md-3"> 
										<button type="submit" formaction="/onban"
											class="btn btn-success">Mở tài khoản</button>
										 </div> 
									</div>

								</form>
							</section>
						</div>
					</div>

				</div>
			</div> 


			<%-- <section id="tabs">
				<div class="container">
					<div class="row">
						<div class="col-md-12 ">
							<nav class="row justify-content-center ml-0 mr-0">
								<div class="nav nav-tabs" id="nav-tab" role="tablist">
									<a class="nav-item nav-link active" id="nav-home-tab"
										data-toggle="tab" href="#nav-home" role="tab"
										aria-controls="nav-home" aria-selected="true">Quản lý
									</a> 
									<a class="nav-item nav-link" id="nav-profile-tab"
										data-toggle="tab" href="#nav-profile" role="tab"
										aria-controls="nav-profile" aria-selected="false">Danh
										sách</a>
								</div>
							</nav>
							<div class="tab-content" id="nav-tabContent">
								<div class="tab-pane fade show active" id="nav-home"
									role="tabpanel" aria-labelledby="nav-home-tab">
									<div class="row justify-content-center">
										<!-- <h2>Tài khoản</h2> -->
										<table class="rwd-table">
											<thead>
												<tr>
													<th>Ảnh</th>
													<th>Họ và tên</th>
													<th>Điểm</th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${users}" var="user">
													<tr>
														<td data-th="Tên"><img src="/${user.avatar}"
															class="thumb" width="50px" /></td>
														<td data-th="Điểm">${user.fullname}</td>
														<td>${user.mark}</td>
														<td><a href="/edit/${user.username}">Xem</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<div class="tab-pane fade" id="nav-profile" role="tabpanel"
									aria-labelledby="nav-profile-tab">
									<form>
										<p>${messageban}</p>
										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="inputEmail4">Tên đăng nhập</label> <input
													type="email" name="username" value="${Users .username}"
													class="form-control" id="inputEmail4" placeholder=""
													readonly>
											</div>
											<div class="form-group col-md-6">
												<label for="inputPassword4">Mật khẩu</label> <input
													type="password" value="${Users .password}"
													class="form-control" id="inputPassword4" placeholder=""
													readonly>
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="inputEmail4">Họ và tên</label> <input
													type="email" value="${Users .fullname}"
													class="form-control" id="inputEmail4" placeholder=""
													readonly>
											</div>
											<div class="form-group col-md-6">
												<label for="inputPassword4">Email</label> <input type="text"
													value="${Users .email}" class="form-control"
													id="inputPassword4" placeholder="" readonly>
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="inputCity">Ngày sinh</label> <input type="date"
													value="${Users .birthday}" class="form-control" id=""
													readonly>
											</div>
											<div class="form-group col-md-2">
												<label for="inputCity">Giới tính</label> <input type="text"
													value="${Users .gender}" class="form-control" id=""
													readonly>
											</div>
											<div class="form-group col-md-2">
												<label for="inputZip">Điểm</label> <input type="text"
													value="${Users .mark}" class="form-control" id="" readonly>
											</div>
											<div class="form-group col-md-2">
												<label for="inputZip">Báo cáo</label> <input type="text"
													value="${Users .ban}" class="form-control" id="" readonly>
											</div>
										</div>
										<div class="row">
											<div class="col-md-3">
												<button type="submit" formaction="/ban"
													class="btn btn-danger">Vô hiệu hóa tài khoản</button>
											</div>
											<div class="col-md-3">
												<button type="submit" formaction="/onban"
													class="btn btn-success">Mở tài khoản</button>
											</div>
										</div>

									</form>
									<!-- <div class="btn_page">
                                    <ul>
                                        <li class="pl-0"><a href=""><i class="fa-solid fa-chevron-left"></i> First</a></li>
                                        <li><a href=""><i class="fa-solid fa-angles-left"></i></a></li>
                                        <div>1</div>
                                        <li><a href=""><i class="fa-solid fa-angles-right"></i></a></li>
                                        <li><a href="">Last <i class="fa-solid fa-chevron-right"></i></a></li>
                                    </ul>
                                </div> -->
								</div>
							</div>

						</div>
					</div>
				</div>
			</section> --%>
		</div>
	</section>
</body>
</html>