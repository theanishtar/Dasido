let repCommentId = null;
function comment(idPost) {
	let comment = document.getElementById('comment-input' + idPost).value;
/*	$.get("/PostComment/" + idPost,function(response){
		alert(response)
	}).fail(function(xhr,status,error){
		alert("Error")
	})*/
	$.ajax({
		url: "/PostComment/" + idPost,
		type: "get",
		data: {
			commentContent: comment,
			repCommentIdUser: repCommentId
		},
		success: function(data) {
			//alert(data);
			repCommentId = null;
			//window.location.href = "/main";
			

		},
		error: function(xhr) {
			alert("error")
		}

	});

}
function repComment(idComment, userName, idPost) {
	let comment = document.getElementById('comment-input' + idPost);
	comment.value = "@" + userName + " ";
	comment.focus();
	repCommentId = idComment;
}
function seenMore(idComment) {
	
	$.ajax({
		url: "/loadReplyComment",
		type: "get",
		data: {
			idComment: idComment
		},
		success: function(data) {
			/*alert(data)*/
			let row = document.getElementById('replyContentComment'+idComment);
			row.innerHTML = data;

		},
		error: function(xhr) {
			alert("error")
		}

	})
}
/*const showContainers = document.querySelectorAll(".show-replies");

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
);*/


