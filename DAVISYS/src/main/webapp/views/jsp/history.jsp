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
<link rel="stylesheet" href="views/css/history.css">
<!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
 -->
<script src="https://kit.fontawesome.com/152112956f.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<!-- main section -->
	<section class="main">
		<div class="container_history">
			<div class="shadow rounded-lg d-block d-sm-flex">
				<div class="profile-tab-nav border-right">
					<div class="p-4">
						<h4 class="text-center" id="fullname">
							<s:message code="history.activity" />
						</h4>
					</div>
					<div class="nav flex-column nav-pills" id="v-pills-tab"
						role="tablist" aria-orientation="vertical">
						<a class="nav-link active" id="interact-tab" data-toggle="pill"
							href="#interact" role="tab" aria-controls="interact"
							aria-selected="true"> <i class="fa-solid fa-thumbs-up"></i> <s:message
								code="history.interaction" />
						</a> <a class="nav-link" id="share-tab" data-toggle="pill"
							href="#share" role="tab" aria-controls="share"
							aria-selected="false"> <i class="fa-solid fa-share"></i> <s:message
								code="history.sharepost" />
						</a>
					</div>
				</div>
				<div class="tab-content p-2 p-md-4" id="v-pills-tabContent">
					<div class="tab-pane fade show active" id="interact"
						role="tabpanel" aria-labelledby="interact-tab">
						<h4 class="mb-4">
							<s:message code="history.interaction" />
						</h4>
						<%-- <div class="deleteAll">
							<div class="checkAll">
								<input type="checkbox" class="checkDeleteAll"> <span>
									<s:message code="history.all" />
								</span>
							</div>
							<button class="btn btn-light">
								<i class="fa-solid fa-trash"></i>
								<s:message code="history.unlike" />
							</button>
						</div> --%>
						<div id="tab-history">
							<ul class="list">
								<c:forEach items="${ listHI }" var="postH">
									<li>
									<!-- <input type="checkbox" class="checkDelete"> -->
										<div class="content">
<%-- 											<c:forEach items="${ listHIImages }" var="img" begin="0"
												end="0">
												<img src="${img}" alt="" class="thumb">
											</c:forEach> --%>
											<img src="${postH[1]}" alt="" class="thumb">
											<p class="description">
												<s:message code="history.youlikepicture" />
												<strong>@${postH[0]}</strong>
											</p>
										</div>
										<div class="dropdown-options">
											<i class="fa-solid fa-ellipsis" id="options"></i>
											<div class="dropdown-content">
												<p>
													<a href="/post/${postH[2]}"><s:message code="history.whatagain" /></a> 
												</p>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="tab-pane fade" id="share" role="tabpanel"
						aria-labelledby="share-tab">
						<h4 class="mb-4">
							<s:message code="history.sharepost" />
						</h4>
						<div id="tab-history-share" class="tab-history-share">
							<ul class="list">
								<c:forEach items="${ listHS }" var="shareH">
									<li>
										<div class="content">
											<c:forEach items="${ listHSImages }" var="img" begin="0"
												end="0">
												<img src="${img}" alt="" class="thumb">
											</c:forEach>
											<p class="description">
												<s:message code="history.sharepicture" />
												<strong>@${shareH[0]}</strong>
											</p>
										</div>
										<div class="dropdown-options">
											<i class="fa-solid fa-ellipsis" id="options"></i>
											<div class="dropdown-content">
												<p>
													<s:message code="history.whatagain" />
												</p>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>