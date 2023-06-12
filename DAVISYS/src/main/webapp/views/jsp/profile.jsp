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

<!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://kit.fontawesome.com/152112956f.js"
	crossorigin="anonymous"></script> -->

<link rel="stylesheet" href="/views/css/profile.css">
<script src="/views/js/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>

</head>
<body>
	<div class="video-detail">
		<div class="video-content">
			<div class="video-p-wrapper anim prof" style="--delay: .1s">
				<img
					src="https://angurvad-5559e.web.app/img/in-post/2020-10-07/header.jpg"
					alt="" class="background-prof">
				<div class="bc-p"></div>
				<div class="prof-item">
					<div
						class="author-img__wrapper video-author video-p video-author-prof">
						<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-check">
										<path d="M20 6L9 17l-5-5" />
									</svg>
						<img class="author-img author-img_prof"
							src="${ usersProfile.avatar }" />
					</div>
				</div>
			</div>
			<div class="details-prof anim">
				<div class="nam profile-p-detail">
					<div class="profile-p-name">${ usersProfile.fullname }</div>
				</div>
				<div class="fl">
					<p>4567 Người theo dõi</p>
					<!-- <p>4567 Đang theo dõi</p> -->
				</div>
			</div>

			<c:forEach items="${listPost}" var="posts">
				<div class="post">
					<div class="video-detail">
						<div class="video-content">
							<div class="video-p-wrapper anim" style="--delay: .1s">
								<div class="author-img__wrapper video-author video-p">
									<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="3" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-check">
												<path d="M20 6L9 17l-5-5" />
											</svg>
									<a href="/profile/${posts.post.user.ID}"><img
										class="author-img" src="${ posts.post.user.avatar }" /> <input
										type="text" value="${ posts.post.user.ID}" name="inputUserID"
										style="display: none;"> </a>

								</div>
								<div class="video-p-detail">
									<div class="video-p-name">${ posts.post.user.fullname }</div>
									<div class="video-p-sub">${ posts.post.date_Post }</div>
								</div>

							</div>
							<div class="video-p-title anim" style="--delay: .2s">${ posts.post.post }
							</div>
							<div class="video-p-subtitle anim" style="--delay: .3s">Vị
								trí: ${ posts.post.address_Product }</div>
							<div class="video-p-subtitle anim" style="--delay: .4s">${ posts.post.hashTag }</div>
							<div class="div" style="z-index: 2;">
								<div class="list-img-post">
									<c:forEach items="${ posts.images }" var="img">
										<img src="${img }" alt="">
										<hr>
									</c:forEach>
								</div>
								<div id="favDialog_comment${posts.post.ID }">
									<div class="modal-dialog">
										<div class="modal-content">
											<!-- <div id="close_cmt" data-dismiss="modal">
										<i class="fa-solid fa-xmark"></i>
									</div> -->
											<div class="cmt-container">
												<div class="post">
													<div class="post-detail">
														<div class="full-boxer">
															<div class="comment__container opened" id="first-comment">
																<c:forEach items="${comments}" var="comment">
																	<c:if
																		test="${posts.post.ID == comment.comment.post.ID}">
																		<div class="comment__card">
																			<c:if test="${comment.comment.commentParent ==null}">
																				<div class="box-top">
																					<div class="Profile">
																						<div class="profile-image">
																							<img src="${ comment.comment.user.avatar}"
																								id="imgUserComment">
																						</div>
																						<div class="Name">
																							<strong>${comment.comment.user.fullname}
																							</strong> <span>${comment.comment.dateComment}</span>
																						</div>
																					</div>
																				</div>
																				<p>${comment.comment.content}</p>
																			</c:if>
																			<c:if test="${comment.comment.commentParent ==null}">
																				<div class="comment__card-footer">
																					<div
																						onclick="repComment('${comment.comment.ID}','${comment.comment.user.fullname}','${posts.post.ID}')">Trả
																						lời ${comment.countComment}</div>
																					<c:if test="${comment.countComment >0}">
																						<div class="show-replies"
																							onclick="seenMore('${comment.comment.ID}')">Xem
																							thêm</div>
																					</c:if>

																				</div>
																			</c:if>
																		</div>
																		<%-- <c:forEach items="${comments}" var="comment"> --%>
																		<c:if test="${comment.comment.commentParent ==null}">
																			<div id="replyContentComment${comment.comment.ID}"></div>
																		</c:if>
																		<%-- </c:forEach> --%>
																	</c:if>

																</c:forEach>
															</div>

														</div>

														<!-- <div class="detail-intracables" style="margin-top: 1rem;">
													<i class="fa-regular fa-paper-plane"></i> <i
														class="fa-solid fa-share"></i>
												</div>
												<span class="interest">10 Lượt quan tâm</span> -->
														<form>
															<div class="comment-box">
																<input type="text" id="comment-input${posts.post.ID}"
																	name="postComment" placeholder="Bình luận">
																<button class="add-comment-btn"
																	onclick="comment('${posts.post.ID }')">
																	<i class="fa-regular fa-comment"></i>
																</button>
															</div>
														</form>
														<span class="comment-count">50 bình luận</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="button-wrapper">
						<button class="like red">
							<svg viewBox="0 0 24 24" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd" clip-rule="evenodd"
									d="M15.85 2.5c.63 0 1.26.09 1.86.29 3.69 1.2 5.02 5.25 3.91 8.79a12.728 12.728 0 01-3.01 4.81 38.456 38.456 0 01-6.33 4.96l-.25.15-.26-.16a38.093 38.093 0 01-6.37-4.96 12.933 12.933 0 01-3.01-4.8c-1.13-3.54.2-7.59 3.93-8.81.29-.1.59-.17.89-.21h.12c.28-.04.56-.06.84-.06h.11c.63.02 1.24.13 1.83.33h.06c.04.02.07.04.09.06.22.07.43.15.63.26l.38.17c.092.05.195.125.284.19.056.04.107.077.146.1l.05.03c.085.05.175.102.25.16a6.263 6.263 0 013.85-1.3zm2.66 7.2c.41-.01.76-.34.79-.76v-.12a3.3 3.3 0 00-2.11-3.16.8.8 0 00-1.01.5c-.14.42.08.88.5 1.03.64.24 1.07.87 1.07 1.57v.03a.86.86 0 00.19.62c.14.17.35.27.57.29z" />
									</svg>
							Quan tâm
						</button>
						<button class="like">
							<svg viewBox="0 0 24 24" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
										<path
									d="M21.435 2.582a1.933 1.933 0 00-1.93-.503L3.408 6.759a1.92 1.92 0 00-1.384 1.522c-.142.75.355 1.704 1.003 2.102l5.033 3.094a1.304 1.304 0 001.61-.194l5.763-5.799a.734.734 0 011.06 0c.29.292.29.765 0 1.067l-5.773 5.8c-.428.43-.508 1.1-.193 1.62l3.075 5.083c.36.604.98.946 1.66.946.08 0 .17 0 .251-.01.78-.1 1.4-.634 1.63-1.39l4.773-16.075c.21-.685.02-1.43-.48-1.943z" />
									</svg>
							Chia sẻ
						</button>
						<button class="like cmt" formaction="/updatepost/${posts.post.ID}" data-target="#favDialog_updatePost"
							data-toggle="modal">
							<svg viewBox="0 0 24 24" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd" clip-rule="evenodd"
									d="M15.85 2.5c.63 0 1.26.09 1.86.29 3.69 1.2 5.02 5.25 3.91 8.79a12.728 12.728 0 01-3.01 4.81 38.456 38.456 0 01-6.33 4.96l-.25.15-.26-.16a38.093 38.093 0 01-6.37-4.96 12.933 12.933 0 01-3.01-4.8c-1.13-3.54.2-7.59 3.93-8.81.29-.1.59-.17.89-.21h.12c.28-.04.56-.06.84-.06h.11c.63.02 1.24.13 1.83.33h.06c.04.02.07.04.09.06.22.07.43.15.63.26l.38.17c.092.05.195.125.284.19.056.04.107.077.146.1l.05.03c.085.05.175.102.25.16a6.263 6.263 0 013.85-1.3zm2.66 7.2c.41-.01.76-.34.79-.76v-.12a3.3 3.3 0 00-2.11-3.16.8.8 0 00-1.01.5c-.14.42.08.88.5 1.03.64.24 1.07.87 1.07 1.57v.03a.86.86 0 00.19.62c.14.17.35.27.57.29z" />
									</svg>
							Bình luận
						</button>
					</div>
				</div>

			</c:forEach>
		</div>
	</div>

	<!-- <div class="modal fade" id="favDialog_updatePost1" role="dialog">
		<div class="modal-dialog">
			Modal content
			<div class="modal-content-update">
				<div class="modal-header">
					<button id="close2" type="button" data-dismiss="modal">Thoát</button>
					<p class="title-update">Cập nhật bài đăng</p>
					<button id="updatePosst" type="button">Cập nhật</button>
				</div>
				<div class="modal-body">
					<div class="post-container-update">
						<div class="post">
							<div class="left-post">
								<div class="post-feed">
									<div class="post-img-container-update">
										<img src="/views/images/posts/post1.jpg" alt="">
									</div>
								</div>
							</div>
							<div class="post-detail">
								<div class="info-update">
									<div class="post-header">
										<img src="views/images/user/user.jpg" class="user-icon" alt="">
										<p class="username">@dannk</p>
									</div>
								</div>
								<textarea class="post-des-update" name="" id="" cols="45"
									rows="10">Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit, in provident aliquam suscipit, perspiciatis eligendi blanditiis reprehenderit nisi quis, sunt ea odit excepturi incidunt assumenda sapiente voluptatem dicta nam et.
                    			</textarea>
								<div class="name-product">
									<input class="input" placeholder="Tên sản phẩm" required=""
										type="text"> <span class="input-border"></span>
								</div>
								<div class="hashtag">
									<input class="input" placeholder="Hashtag" required=""
										type="text"> <span class="input-border"></span>
								</div>
								<div class="address">
									<input class="input" placeholder="Vị trí" required=""
										type="text"> <span class="input-border"></span>
								</div>
								<div class="btn-sendStatus">
									Trạng thái bài đăng:
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" fill="none"
											viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
											aria-hidden="true">
    							<path stroke-linecap="round" stroke-linejoin="round"
												d="M17.593 3.322c1.1.128 1.907 1.077 1.907 2.185V21L12 17.25 4.5 21V5.507c0-1.108.806-2.057 1.907-2.185a48.507 48.507 0 0111.186 0z"></path>
  						</svg>
										Đã có người nhận
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>-->



	<div id="favDialog_updatePost" class="modal fade" role="dialog">
		<!-- <div class="modal-dialog"> -->

			<!-- <div class="modal-content"> -->
				<!-- <div class="modal-body"> -->
					<div class="modal-header">
						<a id="close2" type="button" href="/profile/${ user.ID }">Thoát</a>
						<p class="title-update">Cập nhật bài đăng</p>
						<button id="updatePosst" type="button">Cập nhật</button>
					</div>
					<div class="post-container-update">
						<div class="post">
							<div class="left-post">
								<div class="post-feed">
									<div class="post-img-container-update">
										<img src="/views/images/posts/post1.jpg" alt="">
									</div>
								</div>
							</div>
							<div class="post-detail">
								<div class="info-update">
									<div class="post-header">
										<img src="views/images/user/user.jpg" class="user-icon" alt="">
										<p class="username">@dannk</p>
									</div>
								</div>
								<textarea class="post-des-update" name="" id="" cols="45"
									rows="10">${updatepost.post}
                    			</textarea>
								<div class="name-product">
									<input class="input" value="${updatepost.product}" placeholder="Tên sản phẩm" required=""
										type="text"> <span class="input-border"></span>
								</div>
								<div class="hashtag">
									<input class="input" value="${updatepost.hashTag}" placeholder="Hashtag" required=""
										type="text"> <span class="input-border"></span>
								</div>
								<div class="address">
									<!-- <input class="input" placeholder="Vị trí" required=""
										type="text"> <span class="input-border"></span> -->
										
									<select class="input" name="address" id="address">
											<option value="${updatepost.address_Product}">${updatepost.address_Product}</option>
											
										</select>
								</div>
								<div class="btn-sendStatus">
									Trạng thái bài đăng:
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" fill="none"
											viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
											aria-hidden="true">
    							<path stroke-linecap="round" stroke-linejoin="round"
												d="M17.593 3.322c1.1.128 1.907 1.077 1.907 2.185V21L12 17.25 4.5 21V5.507c0-1.108.806-2.057 1.907-2.185a48.507 48.507 0 0111.186 0z"></path>
  						</svg>
										Đã có người nhận
									</button>
								</div>
							</div>
						</div>
					</div>
				<!-- </div> -->
			<!-- </div> -->
<!-- 		</div> -->
	</div>



	<script src="/views/js/profile.js"></script>
</body>
</html>