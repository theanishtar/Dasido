<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<link rel="stylesheet" href="views/css/updateprofile.css">

<script src="https://kit.fontawesome.com/152112956f.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<section>
		<form action="/updatepro" method="POST" enctype="multipart/form-data">
			<div class="">
				<div class="row">
					<div class="col-lg-4">
						<div class="card mb-4">
							<div class="card-body text-center">
								<label> <img src="${user.avatar}" alt="avatar"
									class="rounded-circle img-fluid" style="width: 150px;"> <input
									name="file" type="file" style="display: none;">
								</label>
								<h5 class="my-3">${user.fullname}</h5>
								<p class="text-muted mb-4">
									${totalPost}
									<s:message code="main.post" />
								</p>
								<c:if
									test="${messageupdate == 'Email đã tồn tại!'  || messageupdate == 'Tên đăng nhập đã tồn tại!'}">
									<p style="color: red;">
										<em>${messageupdate}</em>
									</p>
								</c:if>
								<c:if test="${messageupdate == 'Cập nhật thành công!'}">
									<p style="color: green;">
										<em>${messageupdate}</em>
									</p>
								</c:if>
							</div>
						</div>
					</div>
					<div class="col-lg-8">
						<div class="card mb-4">
							<div class="card-body">
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">
											<s:message code="contact.fullname" />
										</p>
									</div>
									<div class="col-sm-9">
										<input class="text-muted mb-0" value="${user.fullname}"
											name="fullname" required>

									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">
											<s:message code="updateprofile.username" />
										</p>
									</div>
									<div class="col-sm-9">
										<input class="text-muted mb-0" value="${user.username}"
											name="username" required readonly>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">
											<s:message code="updateprofile.password" />
										</p>
									</div>
									<div class="col-sm-9">
										<input class="text-muted mb-0" type="password"
											value="${user.password}" name="password" readonly>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Email</p>
									</div>
									<div class="col-sm-9">
										<input class="text-muted mb-0" type="email" value="${user.email}"
											name="email" required readonly>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">
											<s:message code="updateprofile.birthday" />
										</p>
									</div>
									<div class="col-sm-9">
										<input type="date" class="text-muted mb-0"
											value="${user.birthday}" name="birthday" required>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">
											<s:message code="updateprofile.sex" />
										</p>
									</div>
									<div class="col-sm-9">
										<select class="text-muted mb-0" name="gender" id="gender">
											<c:if test="${user.gender != null }">
												<option value="${user.gender}">${user.gender}</option>
											</c:if>
											<option value="Nam"><s:message
													code="updateprofile.male" /></option>
											<option value="Nữ"><s:message
													code="updateprofile.female" /></option>
											<option value="Khác"><s:message
													code="updateprofile.other" /></option>
										</select>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">
											<s:message code="updateprofile.province" />
										</p>
									</div>
									<div class="col-sm-9">
										<select class="text-muted mb-0" name="address" id="address">
											<c:if test="${user.province.name != null}">
												<option value="${user.province.code}">
													${user.province.name}</option>
											</c:if>


											<c:forEach items="${listTP}" var="add">
												<option value="${add.code}">${add.name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">
											<s:message code="updateprofile.mark" />
										</p>
									</div>
									<div class="col-sm-9">
										<input type="text" class="text-muted mb-0"
											value="${user.mark}" readonly>
									</div>
								</div>
								
								<div class="row">
									<div class="col-sm-3 btn-updateprofile">
										<button type="submit" class="btn btn-primary">
											<s:message code="profile.update" />
										</button>
										<button class="btn btn-light" formaction="/huy">
											<s:message code="updateprofile.cancel" />
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</section>
</body>
</html>