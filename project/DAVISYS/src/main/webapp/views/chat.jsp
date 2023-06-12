<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Web Chat</title>
<link href="/webjars/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>
</head>
<body>
	<noscript>
		<h2 style="color: #ff0000">Seems your browser doesn't support
			Javascript! Websocket relies on Javascript being enabled. Please
			enable Javascript and reload this page!</h2>
	</noscript>
	<div id="main-content" class="container">
		<div class="row">
			<div class="col-md-6">
				<form class="form-inline">
					<div class="form-group">

						<label for="connect">WebSocket connection:</label>
						<button id="connect" class="btn btn-default" type="submit">Connect</button>
						<button id="disconnect" class="btn btn-default" type="submit"
							disabled="disabled">Disconnect</button>
						<br> <label for="fromid" id="">From: </label> <input
							type="text" id="from" class="form-control"
							placeholder="token..."> <br> <br> <label
							for="token" id="tokenid">Sendto: </label> <input type="text"
							id="token" class="form-control" placeholder="token...">
					</div>
				</form>
			</div>
			<div class="col-md-6">
				<form class="form-inline">
					<div class="form-group">
						<label for="name">What is your name?</label> <input type="text"
							id="name" class="form-control" placeholder="Your name here...">
					</div>
					<button id="send" class="btn btn-default" type="submit">Send</button>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table id="conversation" class="table table-striped">
					<thead>
						<tr>
							<th>Greetings</th>
						</tr>
					</thead>
					<tbody id="greetings">
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var stompClient = null;
		var token = $("#from").val();

		function setConnected(connected) {
			$("#connect").prop("disabled", connected);
			$("#disconnect").prop("disabled", !connected);
			if (connected) {
				$("#conversation").show();
			} else {
				$("#conversation").hide();
			}
			$("#greetings").html("");
		}

		function connect() {
			var socket = new SockJS('/gs-guide-websocket');
			stompClient = Stomp.over(socket);
			stompClient.connect({}, function(frame) {
				setConnected(true);
				//console.log('Connected: ' + frame);
				stompClient.subscribe('/topic/mess', function(greeting) {
					console.log(JSON.parse(greeting.body));
					var mes = JSON.parse(greeting.body);
					var token = $("#from").val();
					var toUsername = $("#token").val();
					// {message: 'Dang Tran', from: 'dangth', to: 'dannk'}
					if (mes.to == token && mes.from != token)
						showGreeting(mes.from+": "+JSON.parse(greeting.body).message);
					if(mes.from == token)
						showGreeting("You: "+JSON.parse(greeting.body).message);
				});
			});
		}

		function disconnect() {
			if (stompClient !== null) {
				stompClient.disconnect();
			}
			setConnected(false);
			console.log("Disconnected");
		}

		function sendName() {
			var toUsername = $("#token").val();
			//alert(toUsername);

			stompClient.send("/app/message", {}, JSON.stringify({
				'message' : $("#name").val(),
				'from' : $("#from").val(),
				'to' : toUsername
			}));
		}

		function showGreeting(message) {
			console.log("mess: " + message);
			$("#greetings").append("<tr><td>" + message + "</td></tr>");
		}
		function setToken() {
			var gToken = localStorage.getItem("token-webchat");
			let token = prompt("Please enter your name", gToken);

			localStorage.setItem("token-webchat", token);
		}

		$(function() {
			$("form").on('submit', function(e) {
				e.preventDefault();
			});
			$("#connect").click(function() {
				connect();
			});
			$("#disconnect").click(function() {
				disconnect();
			});
			$("#send").click(function() {
				sendName();
			});
			$("#setToken").click(function() {
				setToken();
			});
		});
	</script>
</body>
</html>