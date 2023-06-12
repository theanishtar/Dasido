<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<style>
.header {
	position: -webkit-sticky;
	position: sticky;
	top: 0;
	z-index: 100;
	background-color: #1f1d2b;
}
</style>
	<div class="header">
		<div class="search-bar">
			<input type="text" placeholder="Search">
		</div>
		<div class="user-settings">
			<%-- <c:if test="${sessionScope.user==null}">
				<img alt="" src="/views/images/user/user.jpg">
			</c:if> --%>
			<c:if test="${sessionScope.user!=null}">
				<img class="user-img" src="${sessionScope.user.avatar}" alt="">
			</c:if>

			<div class="user-name">
				<c:if test="${sessionScope.user==null}">
            Tài khoản 
            </c:if>
				<c:if test="${sessionScope.user!=null}">
           ${sessionScope.user.fullname}
            </c:if>
			</div>
			<div class="dropdown">
				<span> <svg viewBox="0 0 492 492" fill="currentColor">
						<path
							d="M484.13 124.99l-16.11-16.23a26.72 26.72 0 00-19.04-7.86c-7.2 0-13.96 2.79-19.03 7.86L246.1 292.6 62.06 108.55c-5.07-5.06-11.82-7.85-19.03-7.85s-13.97 2.79-19.04 7.85L7.87 124.68a26.94 26.94 0 000 38.06l219.14 219.93c5.06 5.06 11.81 8.63 19.08 8.63h.09c7.2 0 13.96-3.57 19.02-8.63l218.93-219.33A27.18 27.18 0 00492 144.1c0-7.2-2.8-14.06-7.87-19.12z">
						 </path>
					</svg>
				</span>
				<div class="dropdown-content">
					<a href="/profile/${user.ID}">Thông tin</a> 
					<a href="/updatepro">Cập nhật</a> 
					<a href="/changepass">Đổi mật khẩu</a> 
					<a href="/logout">Đăng xuất</a>
				</div>
			</div>
			<div class="notify">
				<div class="notification"></div>
				<div class="dropdownNotification">
					<span> <svg viewBox="0 0 24 24" fill="currentColor">
							<path fill-rule="evenodd" clip-rule="evenodd"
								d="M18.707 8.796c0 1.256.332 1.997 1.063 2.85.553.628.73 1.435.73 2.31 0 .874-.287 1.704-.863 2.378a4.537 4.537 0 01-2.9 1.413c-1.571.134-3.143.247-4.736.247-1.595 0-3.166-.068-4.737-.247a4.532 4.532 0 01-2.9-1.413 3.616 3.616 0 01-.864-2.378c0-.875.178-1.682.73-2.31.754-.854 1.064-1.594 1.064-2.85V8.37c0-1.682.42-2.781 1.283-3.858C7.861 2.942 9.919 2 11.956 2h.09c2.08 0 4.204.987 5.466 2.625.82 1.054 1.195 2.108 1.195 3.745v.426zM9.074 20.061c0-.504.462-.734.89-.833.5-.106 3.545-.106 4.045 0 .428.099.89.33.89.833-.025.48-.306.904-.695 1.174a3.635 3.635 0 01-1.713.731 3.795 3.795 0 01-1.008 0 3.618 3.618 0 01-1.714-.732c-.39-.269-.67-.694-.695-1.173z" />
						</svg>
					</span>
					<div class="dropdownNotification-content" id="box">
						<h2>
							Thông báo <span>2</span>
						</h2>
						<div class="notifications-item">
							<img src="https://i.imgur.com/uIgDDDd.jpg" alt="img">
							<div class="text">
								<h4>Samso aliao</h4>
								<p>Samso Nagaro Like your home work</p>
								<span class="new-notifications">Mới</span>
							</div>
						</div>
						<div class="notifications-item">
							<img
								src="https://img.icons8.com/flat_round/64/000000/vote-badge.png"
								alt="img">
							<div class="text">
								<h4>John Silvester</h4>
								<p>+20 vista badge earned</p>
								<span class="new-notifications">Mới</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>