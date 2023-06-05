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

// Show-close dialog notifications
const showButton_notifications = document.getElementById('showDialog_Notifications');
const favDialog_notifications = document.getElementById('favDialog_notifications');
const close_notifications = document.getElementById('close_notifications');

close_notifications.addEventListener('click', () => {
	favDialog_notifications.close();
});
showButton_notifications.addEventListener('click', () => {
	favDialog_notifications.showModal();
});

// Show-close dialog follow
const showButton_follow = document.getElementById('showButton_follow');
const favDialog_follow = document.getElementById('favDialog_follow');
const close_follow = document.getElementById('close_follow');

close_follow.addEventListener('click', () => {
	favDialog_follow.close();
});
showButton_follow.addEventListener('click', () => {
	favDialog_follow.showModal();
});

// Show-close dialog setting
const showButton_setting = document.getElementById('showButton_setting');
const favDialog_setting = document.getElementById('favDialog_setting');
const close_setting = document.getElementById('close_setting');

close_setting.addEventListener('click', () => {
	favDialog_setting.close();
});
showButton_setting.addEventListener('click', () => {
	favDialog_setting.showModal();
});

// Show-close dialog share
const showButton_share = document.querySelectorAll(".post i.showButton_share");
const favDialog_share = document.getElementById('favDialog_share');
const close_share = document.getElementById('close_share');

close_share.addEventListener('click', () => {
	favDialog_share.close();
});

showButton_share.forEach((btn) =>
	btn.addEventListener("click", (e) => {
		favDialog_share.showModal();
	})
);

// Show-close dialog comment
const showCmt = document.querySelectorAll(".post i.showCmt");
const favDialog_comment = document.getElementById('favDialog_comment');
const close_cmt = document.getElementById('close_cmt');
showCmt.forEach((btn) =>
	btn.addEventListener("click", (e) => {
		favDialog_comment.showModal();
	})
);
close_cmt.addEventListener('click', () => {
	favDialog_comment.close();
});
// show-hide rep-comment
const showContainers = document.querySelectorAll(".show-replies");

showContainers.forEach((btn) =>
	btn.addEventListener("click", (e) => {
		let parentContainer = e.target.closest(".comment__container");
		let _id = parentContainer.id;
		if (_id) {
			let childrenContainer = parentContainer.querySelectorAll(
				`[dataset=${_id}]`
			);
			childrenContainer.forEach((child) => child.classList.toggle("opened"));
		}
	})
);