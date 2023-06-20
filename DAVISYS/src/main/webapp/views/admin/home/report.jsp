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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!-- tab -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.1/mdb.min.js"></script>
<!-- tab -->
<script src="https://kit.fontawesome.com/152112956f.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<section class="main">
		<div class="container_admin">
			<div class="">
				<div class="" id="account-management">
					<div class="tabs">
						<!-- Tabs navs -->
						<ul class="nav nav-tabs mb-3" id="ex1" role="tablist">
							<li class="nav-item" role="presentation"><a
								class="nav-link active" id="ex1-tab-1" data-mdb-toggle="tab"
								href="#ex1-tabs-1" role="tab" aria-controls="ex1-tabs-1"
								aria-selected="true"> <i class="fa-solid fa-list-ul"></i> <s:message
										code="admin.postreport" /></a></li>
							<li class="nav-item" role="presentation"><a class="nav-link"
								id="ex1-tab-2" data-mdb-toggle="tab" href="#ex1-tabs-2"
								role="tab" aria-controls="ex1-tabs-2" aria-selected="false">
									<i class="fa-solid fa-users"></i> <s:message
										code="admin.postmark" />
							</a></li>
							<li class="nav-item" role="presentation"><a class="nav-link"
								id="ex1-tab-3" data-mdb-toggle="tab" href="#ex1-tabs-3"
								role="tab" aria-controls="ex1-tabs-3" aria-selected="false">
									<i class="fa-solid fa-users"></i> <s:message
										code="admin.accountmark" />
							</a></li>
						</ul>
						<!-- Tabs navs -->

						<!-- Tabs content -->
						<div class="tab-content" id="ex1-content">
							<div class="tab-pane fade show active" id="ex1-tabs-1"
								role="tabpanel" aria-labelledby="ex1-tab-1">
								<table class="rwd-table-post">
									<thead>
										<tr>
											<th><s:message code="admin.image" /></th>
											<th><s:message code="contact.content" /></th>
											<th><s:message code="admin.userpost" /></th>
											<th></th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${postsHaveReport}" var="postHR">
											<tr>
												<td data-th="<s:message code="admin.image" />"><img
													src="${postHR[1]}" alt=""></td>
												<td data-th="<s:message code="contact.content" />">${postHR[2]}</td>
												<td data-th="<s:message code="admin.userpost" />">${postHR[3]}</td>
												<td><a href="/post/${postHR[0]}"><s:message code="admin.seen" /></a></td>
												<td><a href="/lockpost/${postHR[0]}">Khóa</a></td>
											</tr>
										</c:forEach>	
									</tbody>
								</table>
							</div>
							<div class="tab-pane fade" id="ex1-tabs-2" role="tabpanel"
								aria-labelledby="ex1-tab-2">
								<table class="rwd-table-post">
									<thead>
										<tr>
											<th><s:message code="admin.image" /></th>
											<th><s:message code="admin.userpost" /></th>
											<th><s:message code="admin.countlike" /></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${postsReport}" var="postR">
											<tr>
												<td data-th="<s:message code="admin.image" />"><img
													src="${postR[1]}" alt=""></td>
												<td data-th="<s:message code="admin.userpost" />">${postR[2]}</td>
												<td data-th="<s:message code="admin.countlike" />">${postR[3]}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="tab-pane fade" id="ex1-tabs-3" role="tabpanel"
								aria-labelledby="ex1-tab-3">
								<div class="wrapper">
									<table class="rwd-table">
										<thead>
											<tr>
												<th><s:message code="admin.username" /></th>
												<th><s:message code="admin.mark" /></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${usersReport}" var="usersR">
												<tr>
													<td data-th="<s:message code="admin.username" />">${usersR.fullname}</td>
													<td data-th="<s:message code="admin.mark" />">${usersR.mark}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- Tabs content -->
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>