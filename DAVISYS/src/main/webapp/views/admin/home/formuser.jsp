<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="views/css/sb-admin-2.min.css" rel="stylesheet">
<link href="views/css/admindpage.css" rel="stylesheet">
<!-- tab -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.1/mdb.min.js"></script>
<!-- tab -->
<!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous"> -->

<script src="https://kit.fontawesome.com/152112956f.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<section class="main">
		<div class="container_admin">
			<div class="">
				<div class="" id="account-management">
					<div class="tabs">
						<div class="" id="ex1-tabs-2">
							<div class="wrapper">
								<c:if test="${messageban == 'Không được vô hiệu hóa admin!'  || messageban == 'Tài khoản đang hoạt động!'}">
									<p style="color: red;">
										<em>${messageban}</em>
									</p>
								</c:if>


								<form action="/edit/${Users.ID}">
									<div class="form-header">
										<div class="avartar">
											<a href=""> <img src="${Users.avatar}" alt="">
											</a>
										</div>
										<div class="form-group">
											<div class="form-holder active">
												<label><s:message code="contact.fullname" /></label> <input type="text"
													placeholder="<s:message code="contact.fullname" />" value="${Users.fullname}"
													class="form-control" class="form-control" readonly>
											</div>
											<div class="form-holder">
												<label><s:message code="updateprofile.username" /></label> <input type="text"
													placeholder="<s:message code="updateprofile.username" />" name="username"
													value="${Users.username}" class="form-control" readonly>
											</div>
											<div class="form-holder">
												<label><s:message code="updateprofile.password" /></label> <input type="text"
													placeholder="<s:message code="updateprofile.password" />" value="${Users.password}"
													class="form-control" readonly>
											</div>
											<div class="form-holder">
											<label>Email</label> <input type="text" placeholder="Email"
												value="${Users.email}" class="form-control" readonly>
										</div>
										<div class="form-holder">
											<label><s:message code="updateprofile.birthday" /></label> <input type="date"
												placeholder="<s:message code="updateprofile.birthday" />" value="${Users.birthday}"
												class="form-control" readonly>
										</div>
										<div class="form-holder">
											<label><s:message code="updateprofile.sex" /></label> <input type="text"
												placeholder="<s:message code="updateprofile.sex" />" value="${Users.gender}"
												class="form-control" readonly>
										</div>
										<div class="form-holder">
											<label><s:message code="admin.mark" /></label> <input type="text" placeholder="<s:message code="admin.mark" />"
												value="${Users .mark}" class="form-control" readonly>
										</div>
										<div class="form-holder">
											<label><s:message code="admin.ban" /></label> <input type="text"
												placeholder="<s:message code="admin.ban" />" value="${Users.ban}"
												class="form-control" readonly>
										</div>
										<div class="form-holder">
											<label><s:message code="admin.countreport" /></label> <input type="text" placeholder="<s:message code="admin.countreport" />"
												value="${Users.get_report}" class="form-control" readonly>
										</div>
										<div class="row btn-form">
											<c:if test="${ Users.ban == false}">
												<div class="col-md-3">
													<button type="submit" formaction="/ban"
														class="btn btn-danger"><s:message code="admin.banaccount" /></button>
												</div>
											</c:if>

											<c:if test="${ Users.ban == true }">
												<div class="col-md-3">
													<button type="submit" formaction="/onban"
														class="btn btn-success"><s:message code="admin.openaccount" /></button>
												</div>
											</c:if>

										</div>
										</div>
									</div>
									<!-- <div class="row"> -->
										<!-- <div class="col-md-6"> -->
										<%-- <div class="form-holder">
											<label>Email</label> <input type="text" placeholder="Email"
												value="${Users.email}" class="form-control" readonly>
										</div>
										<div class="form-holder">
											<label><s:message code="updateprofile.birthday" /></label> <input type="date"
												placeholder="<s:message code="updateprofile.birthday" />" value="${Users.birthday}"
												class="form-control" readonly>
										</div>
										<div class="form-holder">
											<label><s:message code="updateprofile.sex" /></label> <input type="text"
												placeholder="<s:message code="updateprofile.sex" />" value="${Users.gender}"
												class="form-control" readonly>
										</div>
										<div class="form-holder">
											<label><s:message code="admin.mark" /></label> <input type="text" placeholder="<s:message code="admin.mark" />"
												value="${Users .mark}" class="form-control" readonly>
										</div>
										<div class="form-holder">
											<label><s:message code="admin.ban" /></label> <input type="text"
												placeholder="<s:message code="admin.ban" />" value="${Users.ban}"
												class="form-control" readonly>
										</div>
										<div class="form-holder">
											<label><s:message code="admin.countreport" /></label> <input type="text" placeholder="<s:message code="admin.countreport" />"
												value="${Users.get_report}" class="form-control" readonly>
										</div>
										<div class="row btn-form">
											<c:if test="${ Users.ban == false}">
												<div class="col-md-3">
													<button type="submit" formaction="/ban"
														class="btn btn-danger"><s:message code="admin.banaccount" /></button>
												</div>
											</c:if>

											<c:if test="${ Users.ban == true }">
												<div class="col-md-3">
													<button type="submit" formaction="/onban"
														class="btn btn-success"><s:message code="admin.openaccount" /></button>
												</div>
											</c:if>

										</div> --%>
									<!-- </div> -->
								</form>
							</div>
						</div>
					</div>
					<!-- Tabs content -->
				</div>
			</div>
		</div>
	</section>
</body>
</html>