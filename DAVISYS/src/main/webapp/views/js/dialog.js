/*===========Dialog Post=============*/
// Show-close dialog create post
const showButton = document.getElementById('showDialog');
const favDialog = document.getElementById('favDialog');
const close_createPost = document.getElementById('close_createPost');

showButton.addEventListener('click', () => {
	favDialog.showModal();
});
close_createPost.addEventListener('click', () => {
	favDialog.close();
});

// create post
const container = document.querySelector(".container"),
	privacy = container.querySelector(".post .privacy"),
	arrowBack = container.querySelector(".audience .arrow-back");
let status = '<i class="fas fa-globe-asia"></i> <span> Công khai</span> <i class="fas fa-caret-down"></i>' +
	' <input type="text" value="true" name="radioPost" style="display: none;">';
$('#ststus_post').html(status);
privacy.addEventListener("click", () => {
	container.classList.add("active");
	close_createPost.style.display = 'none';
});

arrowBack.addEventListener("click", () => {
	//let radio =$("input[type='radio'][name='radio']:checked").val();
	let radio = document.querySelectorAll(".show_status")[0].checked;
	let status = "";
	$('#ststus_post').html('');
	if (radio == true) {
		status = '<i class="fas fa-globe-asia"></i> <span> Công khai</span> <i class="fas fa-caret-down"></i>'+
		' <input type="text" value="true" name="radioPost" style="display: none;">';

	} else {
		status = '<i class="fas fa-lock"></i> <span> Riêng tư</span> <i class="fas fa-caret-down"></i>'+
		' <input type="text" value="false" name="radioPost" style="display: none;">';
	}
	$('#ststus_post').html(status);
	container.classList.remove("active");
	close_createPost.style.display = 'block';
});

// Show-close dialog setting
let showButton_setting = document.getElementById('showButton_setting');
let favDialog_setting = document.getElementById('favDialog_setting');
let close_setting = document.getElementById('close_setting');

close_setting.addEventListener('click', () => {
	favDialog_setting.close();
});
showButton_setting.addEventListener('click', () => {
	favDialog_setting.showModal();
});

// Show-close dialog follow
/*const showButton_follow = document.getElementById('showButton_follow');
const favDialog_follow = document.getElementById('favDialog_follow');
const close_follow = document.getElementById('close_follow');

close_follow.addEventListener('click', () => {
	favDialog_follow.close();
});
showButton_follow.addEventListener('click', () => {
	favDialog_follow.showModal();
});*/


















/*	<dialog id="favDialog_follow" class="modal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="close_follow" data-dismiss="modal">
				<i class="fa-solid fa-xmark"></i>
			</div>
			<div class="follow">
				<p class="suggestion-text">Danh sách theo dõi</p>
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
							<a href="/deleteFollow/${fls.ID}" class="action-btn">Hủy</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	</dialog> */
























