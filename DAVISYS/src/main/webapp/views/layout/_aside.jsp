<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/views/css/dialog.css">
<script src="/views/js/jquery.min.js"></script>
<script src="/views/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
</head>
<body>
	<style>
.sidebar {
	position: -webkit-sticky;
	position: sticky;
	top: 0;
	left: 0;
	z-index: 100;
	background-color: #1f1d2b;
}

.sidebar .logo {
	max-width: 550%;
	padding-left: -200px;
	margin-left: -29px;
	background-color: #1f1d2b;
	width: calc(100% + 60px);
	height: calc(100% + 60px);
}

#logo-aside {
	padding-left: -20px;
	margin-left: -20px;
}

.logo-expand {
	width: 195px;
	margin-left: -20px;
	padding-left: -10px;
	border-bottom: solid 2px rgba(47, 51, 54, 0.827);
}

.sidebar.collapse {
	width: 90px;
	border-right: 1px solid var(--border-color);
}

.collapse:not(.show) {
	/* display: none; */
	display: block;
}

.collapse {
	height: 100%;
}
</style>
	<div class="sidebar">
		<img src="/views/images/LogoDasido.png" alt="" srcset="" class="logo">
		<a class="logo-expand" href="#"> <img alt=""
			src="/views/images/logo_aside_euphoria.png">
		</a>
		<div class="side-wrapper">
			<div class="side-title"></div>
			<div class="side-menu">
				<a class="sidebar-link discover is-active" href="/main"> <i
					class="fa-solid fa-house"></i> <s:message code="aside.home" />
				</a> <a class="sidebar-link trending" href="/message"> <i
					class="fa-solid fa-paper-plane"></i> <s:message
						code="aside.message" />
				</a> <a class="sidebar-link" href="#" data-toggle="modal"
					data-target="#myModal"> <i class="fa-solid fa-heart"></i> <s:message
						code="aside.follow" />
				</a> <a class="sidebar-link" href="/history"> <i
					class="fa-solid fa-clock-rotate-left"></i> <s:message
						code="aside.history" />
				</a> <a class="sidebar-link" href="/contact"> <i
					class="fa-solid fa-envelope"></i></i> <s:message code="aside.contact" />
				</a>
			</div>
		</div>
		<div class="side-wrapper">
			<div class="side-title">
				<s:message code="aside.tool" />
			</div>
			<div class="side-menu">
				<a class="sidebar-link" href="#" data-toggle="modal"
					data-target="#favDialog_setting"> <i class="fa-solid fa-gear"></i>
					<s:message code="aside.setting" />
				</a>
				<c:if test="${sessionScope.user.user_Role==true}">
					<a class="sidebar-link" href="/admin"> <i
						class="fa-solid fa-users"></i> <s:message code="aside.admin" />
					</a>
				</c:if>
			</div>
		</div>
	</div>


	<!-- Setting -->
	<div id="favDialog_setting" class="modal fade" role="dialog">
		<div class="">
			<a id="close_setting" onclick="closeDialog_setting()"> <i
				class="fa-solid fa-xmark"></i>
			</a>
			<div class="setting">
				<p class="suggestion-text"><s:message code="aside.setting" /></p>
				<%-- <div class="select">
					<select name="format" id="format">
						<option selected disabled>Chọn ngôn ngữ</option>
						<option value="vietnamese">Tiếng Việt</option>
						<option value="english">Tiếng Anh</option>
					</select>
				</div> --%>
				<div class="dropdown language">
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="dropdown"><s:message code="aside.language" /></button>
					<div class="dropdown-menu">
						<a href="?lg=en" class="dropdown-item"><s:message code="aside.english" /></a>
						<a href="?lg=vi" class="dropdown-item"><s:message code="aside.vietnam" /></a>
					</div>
				</div>
				 
				<div class="darkmode">
					<div class="toggleWrapper">
						<input type="checkbox" class="dn" id="dn" /> <label
							 id="darkmode-span" for="dn" class="toggle" onclick="change()">
							<span class="toggle__handler"> <span
								class="crater crater--1"></span> <span class="crater crater--2"></span>
								<span class="crater crater--3"></span>
						</span> <span class="star star--1"></span> <span class="star star--2"></span>
							<span class="star star--3"></span> <span class="star star--4"></span>
							<span class="star star--5"></span> <span class="star star--6"></span>
						</label>
					</div>
				</div>
				<div class="button-container">
					<div class='button -dark center'>
						<s:message code="aside.disable" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End setting -->

	<!-- Follow -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog" id="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div id="close_follow" onclick="closeDialog_setting()">
					<i class="fa-solid fa-xmark"></i>
				</div>
				<div class="modal-body" style="padding: 0">
					<div class="follow">
						<p class="suggestion-text">
							<s:message code="aside.listfollow" />
						</p>
						<div class="list-following">
							<c:forEach items="${follower}" var="fls">
								<div class="profile-card-follow">
									<div class="profile-pic">
										<img src="${ fls.avatar }" alt="">
									</div>
									<div>
										<p class="username">${ fls.fullname }</p>
										<p class="sub-text">${ fls.username }</p>
									</div>
									<!-- <button class="action-btn">Hủy</button> -->
									<a href="/deleteFollow/${fls.ID}" class="action-btn"><s:message
											code="aside.cancel" /></a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end follow -->

	<!-- Share -->
	<c:forEach items="${posts}" var="posts">
	
	<div id="favDialog_share${ posts.post.ID }" class="modal fade" role="dialog">
	<form action="/share/${posts.post.ID}" method="get">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="close_share" onclick="closeDialog_setting()">
					<i class="fa-solid fa-xmark"></i>
				</div>
				<div class="share">
					<p class="suggestion-text">
						<s:message code="aside.share" />
					</p>
					<p class="enter-email-text">
						<s:message code="aside.typemail" />
					</p>
					<div class="input-group">
						<input required="" type="text" name="text" autocomplete="off"
							class="input" /> <label class="email-label">Email</label>
					</div>
					<button class="share">
						<div class="svg-wrapper-1">
							<div class="svg-wrapper">
								<svg height="24" width="24" viewBox="0 0 24 24"
									xmlns="http://www.w3.org/2000/svg">
                          			<path d="M0 0h24v24H0z" fill="none"></path>
                          			<path
										d="M1.946 9.315c-.522-.174-.527-.455.01-.634l19.087-6.362c.529-.176.832.12.684.638l-5.454 19.086c-.15.529-.455.547-.679.045L12 14l6-8-8 6-8.054-2.685z"
										fill="currentColor"></path>
                        		</svg>
							</div>
						</div>
						<span><s:message code="aside.send" /></span>
					</button>
				</div>
			</div>
		</div>
		</form>
	</div>
	
	</c:forEach>
	<script src="views/js/home.js"></script>
	<%-- <script src="views/js/dialog.js"></script> --%>
	<script src="/views/js/comment.js"></script>
	<script src="/views/js/mode.js"></script>
	<!-- <script src="/views/js/home.js"></script> -->
</body>
</html>