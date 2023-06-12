<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="views/css/home2.css">
<link rel="stylesheet" href="views/css/home.css">
<link rel="stylesheet" href="views/css/loadimages.css">  -->
<link rel="stylesheet" href="/views/css/dialog.css">
</head>
<body>
	<div class="main-header anim post-line" style="--delay: 0s">
		<img class="user-img" src="${user.avatar}" alt="">
		<button class="button-post" id="showDialog">
			Chào ${user.fullname.substring(user.fullname.lastIndexOf(" ")) }! Hôm
			nay bạn nghĩ gì nào?
			<!-- <div class="arrow">›</div> -->
		</button>
	</div>
	<div class="main-blogs">
		<div class="main-blog anim" style="--delay: .1s">
			<div class="main-blog__title">How to do Basic Jumping and how
				to landing safely</div>
			<div class="main-blog__author">
				<div class="author-img__wrapper">
					<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-check">
									<path d="M20 6L9 17l-5-5" />
								</svg>
					<img class="author-img"
						src="https://images.unsplash.com/photo-1560941001-d4b52ad00ecc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80" />
				</div>
				<div class="author-detail">
					<div class="author-name">Thomas Hope</div>
					<div class="author-info">
						53K views <span class="seperate"></span>2 weeks ago
					</div>
				</div>
			</div>
			<div class="main-blog__time">7 min</div>
		</div>
		<div class="main-blog anim" style="--delay: .2s">
			<div class="main-blog__title">Skateboard Tips You need to know</div>
			<div class="main-blog__author tips">
				<div class="main-blog__time">7 min</div>
				<div class="author-img__wrapper">
					<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-check">
									<path d="M20 6L9 17l-5-5" />
								</svg>
					<img class="author-img"
						src="https://images.unsplash.com/photo-1496345875659-11f7dd282d1d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mzl8fG1lbnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" />
				</div>
				<div class="author-detail">
					<div class="author-name">Tony Andrew</div>
					<div class="author-info">
						53K views <span></span>2 weeks ago
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="small-header anim" style="--delay: .3s">Bài đăng</div>
	<%-- <c:forEach items="${posts}" var="posts">
		
	</c:forEach> --%>
	<c:forEach items="${posts}" var="posts">
		<div class="post">
			<div class="video-detail">
				<div class="video-content">
					<div class="video-p-wrapper anim" style="--delay: .1s">
						<div class="author-img__wrapper video-author video-p">
							<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-check">
												<path d="M20 6L9 17l-5-5" />
											</svg>
							<a href="/profile/${ posts.post.user.ID}"><img
								class="author-img" src="${ posts.post.user.avatar }" /> <input
								type="text" value="${ posts.post.user.ID}" name="inputUserID"
								style="display: none;"> </a>

						</div>
						<div class="video-p-detail">
							<div class="video-p-name">@${ posts.post.user.fullname }</div>
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
															<c:if test="${posts.post.ID == comment.comment.post.ID}">
																<div class="comment__card">
																	<c:if test="${comment.comment.commentParent ==null}">
																		<div class="box-top">
																			<div class="Profile">
																				<div class="profile-image">
																					<img src="${ comment.comment.user.avatar}"
																						id="imgUserComment">
																				</div>
																				<div class="Name">
																					<strong>${comment.comment.user.fullname} </strong>
																					<span>${comment.comment.dateComment}</span>
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
				<%-- <button class="like cmt" data-toggle="modal"
					data-target="#favDialog_comment${ posts.post.ID }">
					<svg viewBox="0 0 24 24" fill="currentColor"
						xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd" clip-rule="evenodd"
							d="M15.85 2.5c.63 0 1.26.09 1.86.29 3.69 1.2 5.02 5.25 3.91 8.79a12.728 12.728 0 01-3.01 4.81 38.456 38.456 0 01-6.33 4.96l-.25.15-.26-.16a38.093 38.093 0 01-6.37-4.96 12.933 12.933 0 01-3.01-4.8c-1.13-3.54.2-7.59 3.93-8.81.29-.1.59-.17.89-.21h.12c.28-.04.56-.06.84-.06h.11c.63.02 1.24.13 1.83.33h.06c.04.02.07.04.09.06.22.07.43.15.63.26l.38.17c.092.05.195.125.284.19.056.04.107.077.146.1l.05.03c.085.05.175.102.25.16a6.263 6.263 0 013.85-1.3zm2.66 7.2c.41-.01.76-.34.79-.76v-.12a3.3 3.3 0 00-2.11-3.16.8.8 0 00-1.01.5c-.14.42.08.88.5 1.03.64.24 1.07.87 1.07 1.57v.03a.86.86 0 00.19.62c.14.17.35.27.57.29z" />
									</svg>
					Bình luận
				</button> --%>
			</div>
		</div>

	</c:forEach>


	<!-- <div class="videos"> -->
	<%-- <c:forEach items="${posts}" var="posts">
		<div class="video anim" style="--delay: .4s">
			<div class="video-time">${ posts.post.date_Post }</div>
			<div class="video-wrapper">
				<!-- <video muted="">
					<source
						src="https://player.vimeo.com/external/436572488.sd.mp4?s=eae5fb490e214deb9ff532dd98d101efe94e7a8b&profile_id=139&oauth2_token_id=57447761"
						type="video/mp4">
				</video> -->
				<c:forEach items="${ posts.images }" var="img" begin="0" end="0">
					<img src="${img }" alt="">
				</c:forEach>
				<div class="author-img__wrapper video-author">
					<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-check">
									<path d="M20 6L9 17l-5-5" />
								</svg>
					<img class="author-img"
						src="https://images.pexels.com/photos/1680172/pexels-photo-1680172.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500" />
				</div>
			</div>
			<div class="video-by">@${ posts.post.user.username }</div>
			<div class="video-name">${ posts.post.post }</div>
			<div class="video-view">
				 ${ posts.post.address_Product }<span class="seperate video-seperate"></span>${ posts.post.hashTag }
			</div>
		</div>
		</c:forEach> --%>
	<!-- 
		<div class="video anim" style="--delay: .5s">
			<div class="video-time">5 min</div>
			<div class="video-wrapper">
				<video muted="">
					<source
						src="https://player.vimeo.com/external/449972745.sd.mp4?s=9943177fe8a6147b7bc4598259401f06ec57878a&profile_id=139&oauth2_token_id=57447761"
						type="video/mp4">
				</video>
				<div class="author-img__wrapper video-author">
					<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-check">
									<path d="M20 6L9 17l-5-5" />
								</svg>
					<img class="author-img"
src="https://images.pexels.com/photos/3370021/pexels-photo-3370021.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500" />
				</div>
			</div>
			<div class="video-by offline">Gerard Bind</div>
			<div class="video-name">Prepare for your first skateboard jump</div>
			<div class="video-view">
				42K views<span class="seperate video-seperate"></span>1 week ago
			</div>
		</div>
		<div class="video anim" style="--delay: .6s">
			<div class="video-time">7 min</div>
			<div class="video-wrapper">
				<video muted="">
					<source
						src="https://player.vimeo.com/external/436553499.sd.mp4?s=0e44527f269278743db448761e35c5e39cfaa52c&profile_id=139&oauth2_token_id=57447761"
						type="video/mp4">
				</video>
				<div class="author-img__wrapper video-author">
					<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-check">
									<path d="M20 6L9 17l-5-5" />
								</svg>
					<img class="author-img"
						src="https://images.pexels.com/photos/1870163/pexels-photo-1870163.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500" />
				</div>
			</div>
			<div class="video-by offline">John Wise</div>
			<div class="video-name">Basic equipment to play skateboard
				safely</div>
			<div class="video-view">
				64K views<span class="seperate video-seperate"></span>2 week ago
			</div>
		</div>
		<div class="video anim" style="--delay: .7s">
			<div class="video-time">6 min</div>
			<div class="video-wrapper">
				<video muted="">
					<source
						src="https://player.vimeo.com/external/361861493.sd.mp4?s=19d8275ca755d653042a87ef28b2f0b2eabf57d0&profile_id=139&oauth2_token_id=57447761"
						type="video/mp4">
				</video>
				<div class="author-img__wrapper video-author">
					<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-check">
									<path d="M20 6L9 17l-5-5" />
								</svg>
					<img class="author-img"
						src="https://images.pexels.com/photos/2889942/pexels-photo-2889942.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500" />
				</div>
			</div>
			<div class="video-by">Budi Hakim</div>
			<div class="video-name">Tips to playing skateboard on the ramp</div>
			<div class="video-view">
				50K views<span class="seperate video-seperate"></span>1 week ago
			</div>
		</div>
		 -->
	<!-- 	</div> -->
	<!-- 	<div class="videos">
		<div class="video anim" style="--delay: .4s">
			<div class="video-time">8 min</div>
			<div class="video-wrapper">
				<video muted="">
					<source
						src="https://player.vimeo.com/external/436572488.sd.mp4?s=eae5fb490e214deb9ff532dd98d101efe94e7a8b&profile_id=139&oauth2_token_id=57447761"
						type="video/mp4">
				</video>
				<div class="author-img__wrapper video-author">
					<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
class="feather feather-check">
									<path d="M20 6L9 17l-5-5" />
								</svg>
					<img class="author-img"
						src="https://images.pexels.com/photos/1680172/pexels-photo-1680172.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500" />
				</div>
			</div>
			<div class="video-by">Andy William</div>
			<div class="video-name">Basic how to ride your skateboard
				comfortly</div>
			<div class="video-view">
				54K views<span class="seperate video-seperate"></span>1 week ago
			</div>
		</div>
		<div class="video anim" style="--delay: .5s">
			<div class="video-time">5 min</div>
			<div class="video-wrapper">
				<video muted="">
					<source
						src="https://player.vimeo.com/external/449972745.sd.mp4?s=9943177fe8a6147b7bc4598259401f06ec57878a&profile_id=139&oauth2_token_id=57447761"
						type="video/mp4">
				</video>
				<div class="author-img__wrapper video-author">
					<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-check">
									<path d="M20 6L9 17l-5-5" />
								</svg>
					<img class="author-img"
						src="https://images.pexels.com/photos/3370021/pexels-photo-3370021.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500" />
				</div>
			</div>
			<div class="video-by offline">Gerard Bind</div>
			<div class="video-name">Prepare for your first skateboard jump</div>
			<div class="video-view">
				42K views<span class="seperate video-seperate"></span>1 week ago
			</div>
		</div>
		<div class="video anim" style="--delay: .6s">
			<div class="video-time">7 min</div>
			<div class="video-wrapper">
				<video muted="">
					<source
						src="https://player.vimeo.com/external/436553499.sd.mp4?s=0e44527f269278743db448761e35c5e39cfaa52c&profile_id=139&oauth2_token_id=57447761"
						type="video/mp4">
				</video>
				<div class="author-img__wrapper video-author">
					<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-check">
									<path d="M20 6L9 17l-5-5" />
								</svg>
					<img class="author-img"
						src="https://images.pexels.com/photos/1870163/pexels-photo-1870163.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500" />
				</div>
			</div>
			<div class="video-by offline">John Wise</div>
			<div class="video-name">Basic equipment to play skateboard
				safely</div>
			<div class="video-view">
				64K views<span class="seperate video-seperate"></span>2 week ago
			</div>
		</div>
		<div class="video anim" style="--delay: .7s">
			<div class="video-time">6 min</div>
			<div class="video-wrapper">
				<video muted="">
					<source
						src="https://player.vimeo.com/external/361861493.sd.mp4?s=19d8275ca755d653042a87ef28b2f0b2eabf57d0&profile_id=139&oauth2_token_id=57447761"
						type="video/mp4">
				</video>
				<div class="author-img__wrapper video-author">
					<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-check">
									<path d="M20 6L9 17l-5-5" />
								</svg>
					<img class="author-img"
						src="https://images.pexels.com/photos/2889942/pexels-photo-2889942.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500" />
				</div>
			</div>
			<div class="video-by">Budi Hakim</div>
			<div class="video-name">Tips to playing skateboard on the ramp</div>
			<div class="video-view">
				50K views<span class="seperate video-seperate"></span>1 week ago
			</div>
		</div>
	</div> -->
	<!-- <div class="stream-area">
		<div class="video-stream">
			<video id="my_video_1" class="video-js vjs-default-skin anim"
				width="640px" height="267px" controls preload="none"
				poster='https://images.unsplash.com/photo-1476801071117-fbc157ae3f01?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDh8fHxlbnwwfHx8&w=1000&q=80'
				data-setup='{ "aspectRatio":"940:620", "playbackRates": [1, 1.5, 2] }'>
				<source
					src="https://player.vimeo.com/external/390402719.sd.mp4?s=20cfdb066c4253047562b65bd4e411b86a004bc5&profile_id=139&oauth2_token_id=57447761"
					type='video/mp4' />
				<source
					src="https://player.vimeo.com/external/390402719.sd.mp4?s=20cfdb066c4253047562b65bd4e411b86a004bc5&profile_id=139&oauth2_token_id=57447761"
					type='video/webm' />
			</video>
			<div class="video-detail">
				<div class="video-content">
					<div class="video-p-wrapper anim" style="--delay: .1s">
						<div class="author-img__wrapper video-author video-p">
							<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-check">
											<path d="M20 6L9 17l-5-5" />
										</svg>
							<img class="author-img"
								src="https://images.pexels.com/photos/1680172/pexels-photo-1680172.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500" />
						</div>
						<div class="video-p-detail">
							<div class="video-p-name">Andy William</div>
							<div class="video-p-sub">1,980,893 subscribers</div>
						</div>
						<div class="button-wrapper">
							<button class="like">
								<svg viewBox="0 0 24 24" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
												<path
										d="M21.435 2.582a1.933 1.933 0 00-1.93-.503L3.408 6.759a1.92 1.92 0 00-1.384 1.522c-.142.75.355 1.704 1.003 2.102l5.033 3.094a1.304 1.304 0 001.61-.194l5.763-5.799a.734.734 0 011.06 0c.29.292.29.765 0 1.067l-5.773 5.8c-.428.43-.508 1.1-.193 1.62l3.075 5.083c.36.604.98.946 1.66.946.08 0 .17 0 .251-.01.78-.1 1.4-.634 1.63-1.39l4.773-16.075c.21-.685.02-1.43-.48-1.943z" />
											</svg>
								Share
							</button>
							<button class="like red">
								<svg viewBox="0 0 24 24" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
												<path fill-rule="evenodd" clip-rule="evenodd"
d="M15.85 2.5c.63 0 1.26.09 1.86.29 3.69 1.2 5.02 5.25 3.91 8.79a12.728 12.728 0 01-3.01 4.81 38.456 38.456 0 01-6.33 4.96l-.25.15-.26-.16a38.093 38.093 0 01-6.37-4.96 12.933 12.933 0 01-3.01-4.8c-1.13-3.54.2-7.59 3.93-8.81.29-.1.59-.17.89-.21h.12c.28-.04.56-.06.84-.06h.11c.63.02 1.24.13 1.83.33h.06c.04.02.07.04.09.06.22.07.43.15.63.26l.38.17c.092.05.195.125.284.19.056.04.107.077.146.1l.05.03c.085.05.175.102.25.16a6.263 6.263 0 013.85-1.3zm2.66 7.2c.41-.01.76-.34.79-.76v-.12a3.3 3.3 0 00-2.11-3.16.8.8 0 00-1.01.5c-.14.42.08.88.5 1.03.64.24 1.07.87 1.07 1.57v.03a.86.86 0 00.19.62c.14.17.35.27.57.29z" />
											</svg>
								Liked
							</button>
						</div>
					</div>
					<div class="video-p-title anim" style="--delay: .2s">Basic
						how to ride your Skateboard</div>
					<div class="video-p-subtitle anim" style="--delay: .3s">Lorem
						ipsum dolor sit amet consectetur adipisicing elit. Repellendus
						illum tempora consequuntur. Lorem ipsum dolor sit amet consectetur
						adipisicing elit. Debitis earum velit accusantium maiores qui sit
						quas, laborum voluptatibus vero quidem tempore facilis voluptate
						tempora deserunt!</div>
					<div class="video-p-subtitle anim" style="--delay: .4s">Lorem
						ipsum dolor sit amet consectetur adipisicing elit. Temporibus
						laborum qui dolorum fugiat eius accusantium repellendus illum
						tempora consequuntur. Lorem ipsum dolor, sit amet consectetur
						adipisicing elit.</div>
				</div>
			</div>
		</div>
		<div class="chat-stream">
			<div class="chat">
				<div class="chat-header anim">
					Live Chat<span><svg viewBox="0 0 24 24" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd" clip-rule="evenodd"
								d="M14.212 7.762c0 2.644-2.163 4.763-4.863 4.763-2.698 0-4.863-2.119-4.863-4.763C4.486 5.12 6.651 3 9.35 3c2.7 0 4.863 2.119 4.863 4.762zM2 17.917c0-2.447 3.386-3.06 7.35-3.06 3.985 0 7.349.634 7.349 3.083 0 2.448-3.386 3.06-7.35 3.06C5.364 21 2 20.367 2 17.917zM16.173 7.85a6.368 6.368 0 01-1.137 3.646c-.075.107-.008.252.123.275.182.03.369.048.56.052 1.898.048 3.601-1.148 4.072-2.95.697-2.675-1.35-5.077-3.957-5.077a4.16 4.16 0 00-.818.082c-.036.008-.075.025-.095.055-.025.04-.007.09.019.124a6.414 6.414 0 011.233 3.793zm3.144 5.853c1.276.245 2.115.742 2.462 1.467a2.107 2.107 0 010 1.878c-.531 1.123-2.245 1.485-2.912 1.578a.207.207 0 01-.234-.232c.34-3.113-2.367-4.588-3.067-4.927-.03-.017-.036-.04-.034-.055.002-.01.015-.025.038-.028 1.515-.028 3.145.176 3.747.32z" />
									</svg> 15,988 people </span>
				</div>
				<div class="message-container">
					<div class="message anim" style="--delay: .1s">
						<div class="author-img__wrapper video-author video-p">
							<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-check">
											<path d="M20 6L9 17l-5-5" />
										</svg>
<img class="author-img"
								src="https://images.unsplash.com/photo-1560941001-d4b52ad00ecc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80" />
						</div>
						<div class="msg-wrapper">
							<div class="msg__name video-p-name">Wijaya Adabi</div>
							<div class="msg__content video-p-sub">Lorem ipsum clor sit,
								ame conse quae debitis</div>
						</div>
					</div>
					<div class="message anim" style="--delay: .2s">
						<div class="author-img__wrapper video-author video-p">
							<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-check">
											<path d="M20 6L9 17l-5-5" />
										</svg>
							<img class="author-img"
								src="https://images.pexels.com/photos/2889942/pexels-photo-2889942.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500" />
						</div>
						<div class="msg-wrapper">
							<div class="msg__name video-p-name offline">Johny Wise</div>
							<div class="msg__content video-p-sub">Suscipit eos atque
								voluptates labore</div>
						</div>
					</div>
					<div class="message anim" style="--delay: .3s">
						<div class="author-img__wrapper video-author video-p">
							<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-check">
											<path d="M20 6L9 17l-5-5" />
										</svg>
							<img class="author-img"
								src="https://images.unsplash.com/photo-1496345875659-11f7dd282d1d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mzl8fG1lbnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" />
						</div>
						<div class="msg-wrapper">
							<div class="msg__name video-p-name offline">Budi Hakim</div>
							<div class="msg__content video-p-sub">Dicta quidem sunt
								adipisci</div>
						</div>
					</div>
					<div class="message anim" style="--delay: .4s">
						<div class="author-img__wrapper video-author video-p">
							<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-check">
											<path d="M20 6L9 17l-5-5" />
										</svg>
							<img class="author-img"
								src="https://images.pexels.com/photos/1870163/pexels-photo-1870163.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500" />
						</div>
						<div class="msg-wrapper">
							<div class="msg__name video-p-name">Thomas Hope</div>
							<div class="msg__content video-p-sub">recusandae doloremque
								aperiam alias molestias</div>
						</div>
					</div>
					<div class="message anim" style="--delay: .5s">
						<div class="author-img__wrapper video-author video-p">
							<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
class="feather feather-check">
											<path d="M20 6L9 17l-5-5" />
										</svg>
							<img class="author-img"
								src="https://images.pexels.com/photos/1680172/pexels-photo-1680172.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500" />
						</div>
						<div class="msg-wrapper">
							<div class="msg__name video-p-name">Gerard Will</div>
							<div class="msg__content video-p-sub">Dicta quidem sunt
								adipisci</div>
						</div>
					</div>
					<div class="message anim" style="--delay: .6s">
						<div class="author-img__wrapper video-author video-p">
							<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-check">
											<path d="M20 6L9 17l-5-5" />
										</svg>
							<img class="author-img"
								src="https://images.pexels.com/photos/2889942/pexels-photo-2889942.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500" />
						</div>
						<div class="msg-wrapper">
							<div class="msg__name video-p-name offline">Johny Wise</div>
							<div class="msg__content video-p-sub">recusandae doloremque
								aperiam alias molestias</div>
						</div>
					</div>
				</div>
				<div class="chat-footer anim" style="--delay: .1s">
					<input type="text" placeholder="Write your message">
				</div>
			</div>
			<div class="chat-vid__container">
				<div class="chat-vid__title anim" style="--delay: .3s">Related
					Videos</div>
				<div class="chat-vid anim" style="--delay: .4s">
					<div class="chat-vid__wrapper">
						<img class="chat-vid__img"
							src="https://cdn.nohat.cc/thumb/f/720/3b55eddcfffa4e87897d.jpg" />
						<div class="chat-vid__content">
							<div class="chat-vid__name">Prepare for your first
								skateboard jump</div>
							<div class="chat-vid__by">Jordan Wise</div>
							<div class="chat-vid__info">
								125.908 views <span class="seperate"></span>2 days ago
							</div>
						</div>
					</div>
				</div>
				<div class="chat-vid anim" style="--delay: .5s">
					<div class="chat-vid__wrapper">
						<img class="chat-vid__img"
							src="https://iamaround.it/wp-content/uploads/2015/02/pexels-photo-4663818.jpeg" />
						<div class="chat-vid__content">
							<div class="chat-vid__name">Prepare for your first
								skateboard jump</div>
							<div class="chat-vid__by">Jordan Wise</div>
							<div class="chat-vid__info">
								125.908 views <span class="seperate"></span>2 days ago
							</div>
						</div>
					</div>
				</div>
				<div class="chat-vid__button anim" style="--delay: .6s">See
					All related videos (32)</div>
			</div>
		</div>
	</div> -->

	<!-- Dialog create post -->
	<dialog id="favDialog">
	<div id="close_createPost">
		<i class="fa-solid fa-xmark"></i>
	</div>
	<div class="main_create_post">
		<div class="container">
			<div class="wrapper_createPost">
				<section class="post">
					<header> Đăng bài </header>
					<form action="/uploadImg" method="post"
						enctype="multipart/form-data">
						<div class="content">
							<img src="${sessionScope.user.avatar}" alt="logo">
							<div class="details">
								<p>${sessionScope.user.fullname}</p>
								<div class="privacy" id="ststus_post"></div>
							</div>
						</div>
						<div class="content-post">
							<input type="text" placeholder="Tên sản phẩm?" name="product"
								required>
							<textarea placeholder="Nội dung?" spellcheck="false"
								name="content" required></textarea>
							<div id="images-to-upload"></div>
						</div>

						<div class="options">
							<p>Thêm vào bài viết của bạn</p>
							<ul class="list">
								<li><label> <img
										src="views/images/icons/gallery.svg" alt="gallery"> <input
										id="ip_images" type="file" accept="image/*" name="image_file"
										multiple="true">
								</label></li>
							</ul>
						</div>
						<button>Post</button>
					</form>
				</section>
				<section class="audience">
					<header>
						<div class="arrow-back">
							<i class="fas fa-arrow-left"></i>
						</div>
						<p>Đối tượng của bài viết</p>
					</header>
					<div class="content">
						<p>Ai có thể xem bài đăng?</p>
					</div>
					<ul class="list">
						<li>
							<div class="column">
								<div class="icon">
									<i class="fas fa-globe-asia"></i>
								</div>
								<div class="details">
									<p>Công khai</p>
									<span>Tất cả mọi người đều có thể xem</span>
								</div>
							</div> <input type="radio" class="radio show_status" value="true"
							name="radio" checked="checked">
						</li>
						<li>
							<div class="column">
								<div class="icon">
									<i class="fas fa-lock"></i>
								</div>
								<div class="details">
									<p>Riêng tư</p>
									<span>Chỉ bạn có thê thấy</span>
								</div>
							</div> <input type="radio" class="radio show_status" value="false"
							name="radio">
						</li>
					</ul>
				</section>
			</div>
		</div>
	</div>
	</dialog>

	<%-- <c:forEach items="${posts}" var="posts">
		<div id="favDialog_comment${ posts.post.ID }" class="modal fade"
			role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="close_cmt" data-dismiss="modal">
						<i class="fa-solid fa-xmark"></i>
					</div>
					<div class="cmt-container">
						<div class="post">
							<div class="post-detail">
								<div class="full-boxer">
									<div class="comment__container opened" id="first-comment">
										<div class="comment__card">
											<div class="box-top">
												<div class="Profile">
													<div class="profile-image">
														<img src="views/images/user/user.jpg">
													</div>
													<div class="Name">
														<strong>${ posts.post.user.fullname }</strong> <span>${ posts.post.user.username }</span>
													</div>
												</div>
											</div>
<p>${ posts.post.user.fullname }</p>
											<div class="comment__card-footer">
												<div class="show-replies">Trả lời 2</div>
											</div>
										</div>
										<div class="comment__container" dataset="first-comment"
											id="first-reply">
											<div class="comment__card">
												<div class="box-top">
													<div class="Profile">
														<div class="profile-image">
															<img src="views/images/user/user.jpg">
														</div>
														<div class="Name">
															<strong>Nguyễn Khánh Đan</strong> <span>@dannk</span>
														</div>
													</div>
												</div>
												<p>Lorem ipsum dolor, sit amet consectetur adipisicing
													elit. Voluptatum eaque itaque sit tempora officiis,
													quisquam atque? Impedit dignissimos error laudantium!</p>
											</div>
										</div>
										<div class="comment__container" dataset="first-comment">
											<div class="comment__card">
												<div class="box-top">
													<div class="Profile">
														<div class="profile-image">
															<img src="views/images/user/user.jpg">
														</div>
														<div class="Name">
															<strong>Nguyễn Khánh Đan</strong> <span>@dannk</span>
														</div>
													</div>
												</div>
												<p>Lorem ipsum dolor, sit amet consectetur adipisicing
													elit. Voluptatum eaque itaque sit tempora officiis,
													quisquam atque? Impedit dignissimos error laudantium!</p>
											</div>
										</div>
									</div>
								</div>

								<div class="detail-intracables" style="margin-top: 1rem;">
									<i class="fa-regular fa-paper-plane"></i> <i
										class="fa-solid fa-share"></i>
								</div>
								<span class="interest">10 Lượt quan tâm</span>
								<div class="comment-box">
									<input type="text" id="comment-input" placeholder="Bình luận">
									<button class="add-comment-btn">
										<i class="fa-regular fa-comment"></i>
									</button>
								</div>
								<span class="comment-count">50 bình luận</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<!-- <script src="views/js/post.js"></script> 
	<script src="views/js/comment.js"></script> --%>
</body>
</html>