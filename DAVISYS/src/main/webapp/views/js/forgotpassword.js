const container = document.querySelector(".container"),
	input_submit = container.querySelector(".main .input-control .input-submit"),
	back = container.querySelector(".wrapper_validator .info");
wrapper = container.querySelector(".main .wrapper"),

	btn_confirm = container.querySelector(".wrapper_validator .btn-confirm"),
	wrapper_validator = container.querySelector(".main .wrapper_validator"),
	wrapper_changepass = container.querySelector(".main .wrapper_changepass"),

	input_submit.addEventListener("click", () => {
		let email = document.getElementById("email").value;
		$.ajax({
			url: "/getCode/" + email,
			type: "get",
			success: function(data) {
				if (data != "") {
					container.classList.add("active");
					wrapper.style.display = 'none';
					wrapper_changepass.style.display = 'none';
				}
				else {
					$('#messageForgot1').html('');
					$('#messageForgot1').append('Email không tồn tại!');
				}
			},
			error: function(xhr) {
				alert("error")
			}

		})
		/*$.get("localhost:8080/getCode/" + email, function(response) {
			if (response != "") {
				container.classList.add("active");
				wrapper.style.display = 'none';
				wrapper_changepass.style.display = 'none';
			}
			else {
				$('#messageForgot1').html('');
				$('#messageForgot1').append('Email không tồn tại!');
			}
		})*/
	});

back.addEventListener("click", () => {
	container.classList.remove("active");
	wrapper.style.display = 'block';
});


btn_confirm.addEventListener("click", () => {
	let mxn = document.getElementById("mxn").value;
	$.get("/getMa/" + mxn, function(response) {
		if (response != "") {
			container.classList.add("active");
			wrapper_validator.style.display = 'none';
			wrapper.style.display = 'none';
			wrapper_changepass.style.display = 'block';
		} else {
			$('#messageForgot2').html('');
			$('#messageForgot2').append('Mã xác nhận không đúng!');
		}
	})
});
function btn_submit() {
	let newpass = document.getElementById("newpass").value;
	let confirmpass = document.getElementById("confirmpass").value;
	$('#messageForgot3').html('');
	if (newpass != confirmpass) {
		$('#messageForgot3').append('Mật khẩu xác nhận chưa đúng!');
	} else {
		$.get("/updatepass/" + confirmpass, function(response) {
			if (response != "") {
				window.location.href = "login";
			}

		})

	}

}