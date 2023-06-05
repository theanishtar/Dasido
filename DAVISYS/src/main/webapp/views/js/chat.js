const url = 'http://localhost:8080';
let stompClient = null;
let selectedUser = null;
let newMessages = new Map();
let image = null;
function connectToChat(userName) {
	console.log("connecting to chat...")
	console.log("Username: "+userName)
	let socket = new SockJS(url + '/chat');
	stompClient = Stomp.over(socket);
	stompClient.connect({}, function(frame) {
		console.log("connected to: " + frame);
			stompClient.subscribe("/topic/messages/" + userName, function(response) {
				let data = JSON.parse(response.body);
				console.log("data_fromlogin1: " + data.img);
				if (selectedUser === data.fromLogin) {
					render(data.message, data.fromLogin, data.img);
				} else {
					newMessages.set(data.fromLogin, data.message, data.img);
					$('#userNameAppender_' + data.fromLogin).append('<span id="newMessage_' + data.fromLogin + '" style="color: red">+1</span>');
				}
			});


		stompClient.subscribe("/topic/public", function(response) {
			let data = JSON.parse(response.body);
			let usersTemplateHTML = "";
			for (let key of Object.keys(data)) {
				let value = data[key];
				console.log(value)
				if(value.type ==='JOIN'){
					usersTemplateHTML = usersTemplateHTML + '<a href="#"  onclick="selectUser(\'' + key + '\')"><li class="clearfix" id="li">\n' +
					'                <img id="userNameAppenderImg_' + key + '" src="' + value.image + '" alt="avatar" />\n' +
					'                <div class="about">\n' +
					'                    <div id="userNameAppender_' + key + '" class="name">' + value.fullName + '</div>\n' +
					'                    <div class="status">\n' +
					'                        <i class="fa fa-circle " style="color:green"></i>\n' +
					'                    </div>\n' +
					'                </div>\n' +
					'            </li></a>';
				}
				
			}
			$('#usersList').html(usersTemplateHTML);
		});
		stompClient.send("/app/fetchAllUsers");

	});
	window.event.preventDefault();
}

function sendMsg(from, text, img) {
	stompClient.send("/app/chat/" + selectedUser, {}, JSON.stringify({
		fromLogin: from,
		message: text,
		img: image
	}));
}

function registration(userName) {
	/*let userName = document.getElementById("userName").value;*/
	console.log(userName);
	$.get(url + "/registration/" + userName, function(response) {
		connectToChat(userName);
	}).fail(function(error) {
		if (error.status === 400) {
			alert("Login is already busy!");
		}
	})
}

function selectUser(userName) {
	selectedUser = userName;
	let fullName = document.getElementById("userNameAppender_" + userName).textContent.trim();
	image = document.getElementById("userNameAppenderImg_" + userName).src;
	console.log(image);
	let isNew = document.getElementById("newMessage_" + userName) !== null;
	if (isNew) {
		let element = document.getElementById("newMessage_" + userName);
		element.parentNode.removeChild(element);
		render(newMessages.get(userName), userName,image);
	}
	let container_message = document.querySelector(".container_message"),
		clearfix = container_message.querySelector(".people-list .clearfix"),
		messageNull = container_message.querySelector(".message-null");
	close_mess = container_message.querySelector(".close_mess");
	clearfix.addEventListener("click", () => {
		container_message.classList.add("active");
		messageNull.style.display = 'none';
	});
	$('#selectedUserId').html('');
	$('#selectedUserImageId').html('');
	$('#selectedUserImageId').append('<img src="' + image + '" alt="avatar" />');
	$('#selectedUserId').append('Chat with ' + fullName);
}
