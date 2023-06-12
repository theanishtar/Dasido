<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="views/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="views/css/admindpage.css" rel="stylesheet">
</head>

<body>
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
								<!-- x -->
								<c:forEach items="${posts}" var="post">
									<li>
										<div class="content">
											<c:forEach items="${ post.images }" var="img" begin="0"
												end="0">
												<img src="/${img}" alt="">
											</c:forEach>
											<p class="description">${post.post.post}</p>
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
								</c:forEach>
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
								<c:forEach items="${users}" var="user">
									<li>
										<div class="content">
											<img src="/${user.avatar}" class="thumb" />
											<p class="description">${user.fullname}</p>
										</div>
										<div class="number-report">
											<strong>${user.mark}</strong>
										</div>
										<div class="dropdown-options">
											<i class="fa-solid fa-ellipsis" id="options"></i>
											<div class="dropdown-content">
												<p>Tắt trạng thái</p>
											</div>
										</div>
									</li>
								</c:forEach>
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
										<i class="fa-solid fa-thumbs-up"></i> <br> <span>Bài
											đăng</span>
								</label></li>
								<li title="Account"><label for="tab2" role="button">
										<i class="fa-solid fa-users"></i> <br> <span>Tài
											khoản</span>
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
											<c:forEach items="${postsReport}" var="postR">
												<tr>
													<td data-th="Ảnh"><img src="/${postR[1]}" alt=""></td>
													<td data-th="Người đăng ">${postR[2]}</td>
													<td data-th="Lượt thích ">${postR[3]}</td>
												</tr>
											</c:forEach>
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
											<c:forEach items="${usersReport}" var="usersR">
												<tr>
													<td data-th="Tên">${usersR.fullname}</td>
													<td data-th="Điểm">${usersR.mark}</td>
												</tr>
											</c:forEach>
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
</body>
</html>