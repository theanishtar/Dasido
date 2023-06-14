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
			<c:if
				test="${messageban == 'Không được vô hiệu hóa admin!'  || messageban == 'Tài khoản đang hoạt động!'}">
				<p style="color: red;">
					<em>${messageban}</em>
				</p>
			</c:if>

			<div class="" id="account-management">
				<div class="tabs">
					<div class="tab-content" id="ex1-content">
						<div class="" id="ex1-tabs-1" role="tabpanel"
							aria-labelledby="ex1-tab-1">
							<table class="rwd-table">
								<thead>
									<tr>
										<th><s:message code="admin.image" /></th>
										<th><s:message code="contact.fullname" /></th>
										<th><s:message code="admin.mark" /></th>
										<th><s:message code="admin.status" /></th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${users}" var="user">
										<tr>
											<td data-th="<s:message code="admin.image" />"><img src="${user.avatar}"
												class="thumb" width="50px" /></td>
											<td data-th="<s:message code="contact.fullname" />">${user.fullname}</td>
											<td>${user.mark}</td>
											<td>${user.ban == false ?'Hoạt động':'Khóa'}</td>
											<td><a href="/edit/${user.username}"><s:message code="admin.seen" /></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
	</section>
</body>
</html>