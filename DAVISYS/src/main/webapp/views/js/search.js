function searchByName(param) {
	var txtSearch = param.value;
	$.ajax({
		url: "./searchByName",
		type: "get",
		data: {
			txt: txtSearch
		},
		success: function(data) {
			var row = document.getElementById("dropdownFind");
			row.innerHTML = data;
		},
		error: function(xhr) {
			alert("error")
		}

	});
}

function loadCommnent() {
	$.ajax({
		url: "./loadNotification",
		type: "get",
		data: {
			txt: "s"
		},
		success: function(data) {
			var row = document.getElementById("notification-content");
			row.innerHTML = data;
		},
		error: function(xhr) {
			alert("error")
		}

	});
}