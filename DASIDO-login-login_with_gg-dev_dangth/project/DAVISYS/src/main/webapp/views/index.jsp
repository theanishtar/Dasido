<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="views/css/message.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://kit.fontawesome.com/152112956f.js"
	crossorigin="anonymous"></script>
<script src="views/js/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.0/handlebars.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>


</head>
<body>
	<c:if test="${currentUserGG != null}">
		<input type="text" id="userName" class="" value="${currentUserGG.sub}"
			placeholder="Tìm kiếm" style="margin-bottom: 10px; display: none" />

		<div class="container_message clearfix">
			<div class="people-list" id="people-list">
				<div class="search">
					<input type="text" placeholder="Tìm kiếm"
						style="margin-bottom: 10px;" />
					<div style="margin-left: 30px">
						<button style="border-radius: 15px" onclick="fetchAll()">Refresh</button>
					</div>
				</div>
				<ul class="list" id="usersList">
				</ul>
			</div>



			<div class="chat">
				<div class="chat-header clearfix">
					<img src="views/images/user1.jpg" alt="avatar" />

					<div class="chat-about">
						<div class="chat-with" id="selectedUserId"></div>
						<div class="chat-num-messages"></div>
					</div>
				</div>
				<!-- end chat-header -->

				<div class="chat-history">
					<ul>

					</ul>

				</div>
				<!-- end chat-history -->
				<div class="chat-message clearfix">
					<input name="message-to-send" id="message-to-send"
						placeholder="Nhập tin nhắn" />
					<!-- <button class="sendMessage"> -->
					<i id="sendBtn" class="fa-solid fa-paper-plane"></i>
					<!-- </button> -->
				</div>
				<!-- end chat-message -->

			</div>
			<!-- end chat -->

		</div>
		<!-- end container -->
		<script id="message-template" type="text/x-handlebars-template">
    <li class="clearfix">
        <div class="message-data align-right">
            <span class="message-data-time">{{time}}, Today</span> &nbsp; &nbsp;
            <span class="message-data-name">You</span> <i class="fa fa-circle me"></i>
        </div>
        <div class="message other-message float-right">
            {{messageOutput}}
        </div>
    </li>
</script>

		<script id="message-response-template"
			type="text/x-handlebars-template">
    <li>
        <div class="message-data">
            <span class="message-data-name"><i class="fa fa-circle online"></i> {{userName}}</span>
            <span class="message-data-time">{{time}}, Today</span>
        </div>
        <div class="message my-message">
            {{response}}
        </div>
    </li>
</script>


		<script src="views/js/custom.js"></script>
		<script src="views/js/chat.js"></script>
		<script>
			var name = "${currentUserGG.name}";
			registration();
			fetchAll();
		</script>
	</c:if>



</body>
</html>