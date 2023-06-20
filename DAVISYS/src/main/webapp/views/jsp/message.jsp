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

<!-- <link rel="stylesheet" href="views/css/message.css"> -->
<!-- <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
	<link rel='stylesheet'
		href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css'> -->
<!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
-->
<link rel="stylesheet" href="/views/css/message.css">
<script src="https://kit.fontawesome.com/152112956f.js"
	crossorigin="anonymous"></script>
<!-- <script src="views/js/jquery.min.js"></script>
 <script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.0/handlebars.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head> -->
<body>
	<div class="main-blogs">
		<div class="row chat-main">
			<input type="text" id="userName"
				value="${sessionScope.user.username}"
				style="margin-bottom: 10px; display: none" /> <input type="text"
				id="userAvatar" value="${sessionScope.user.avatar}"
				style="margin-bottom: 10px; display: none" />
			<section class="discussions" id="usersList">
				<!-- <div class="discussion search">
								<div class="searchbar">
									<i class="fa fa-search" aria-hidden="true"></i>
									<input type="text" placeholder="Search..."></input>
								</div>
							</div> -->
			</section>
			<section class="chat-disscus">
				<div class="header-chat">
					<div id="selectedUserImageId"></div>
					<div id="selectedUserId"></div>
				</div>
				<div class="messages-chat"></div>
				<div class="footer-chat">
					<i class="icon fa fa-smile-o clickable" style="font-size: 25pt;"
						aria-hidden="true"></i> <input type="text" class="write-message"
						placeholder="Type your message here" name="message-to-send"
						id="message-to-send"></input> 
						<!-- <i id="sendBtn"
						class="icon send fa fa-paper-plane-o clickable" aria-hidden="true"></i> -->
				</div>
			</section>
		</div>
	</div>
	<script src="views/js/dialog.js"></script>
	<script id="message-template" type="text/x-handlebars-template">
					<div class="message text-only">
						<div class="response">
							<p class="text">{{messageOutput}}</p>
						</div>
					</div>
					<p class="response-time time">{{time}}, Today</p>
</script>
	<script id="message-response-template"
		type="text/x-handlebars-template">
					<div class="message">
						<div class="photo"
							style="background-image: url({{Img}});">
							<div class="online"></div>
						</div>
						<p class="text"> {{response}}</p>
					</div>
					<p class="time">{{time}}, Today</p></script>
</body>
</html>