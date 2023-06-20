<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
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
	<style>
.main-header.anim.post-line {
	position: fixed;
	top: 5.9rem;
	left: 15rem;
	padding-top: 1rem;
	width: -webkit-fill-available;
}

.content_main {
	margin-top: 5rem;
}

.main-blog__title {
	white-space: nowrap;
	text-overflow: ellipsis;
	width: 7000px;
	max-width: 500px;
	overflow: hidden;
}

@media ( max-width : 1100px) {
	.post-line .user-img {
		display: block;
	}
	.main-header.anim.post-line {
		left: 7rem;
		top: 5rem;
	}
	.main-blog__title {
		width: 400px;
	}
	.main-blog {
		width: 100% !important;
	}
}
</style>
	<div class="main-header anim post-line" style="--delay: 0s">
		<img class="user-img" src="${user.avatar}" alt="">
		<button class="button-post" id="showDialog">
			<s:message code="main.hi" />
			${user.fullname.substring(user.fullname.lastIndexOf(" ")) }!
			<s:message code="main.whatdoyouthing" />

			<!-- <div class="arrow">›</div> -->
		</button>
	</div>
	<div class="content_main">
		<div class="main-blogs">
			<div class="main-blog anim" style="--delay: .1s">
				<c:forEach items="${listTop2}" var="top1" begin="0" end="0">
					<a href="/post/${top1[4]}" style="text-decoration: none">
						<div class="main-blog__title" style="">${top1[0]}</div>
						<div class="main-blog__author">
							<div class="author-img__wrapper">
								<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-check">
									<path d="M20 6L9 17l-5-5" />
								</svg>
								<img class="author-img" src="${top1[2]}" />
							</div>
							<div class="author-detail">
								<div class="author-name">${top1[3]}</div>
								<div class="author-info">${top1[1]}</div>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
			<div class="main-blog anim" style="--delay: .2s">
				<c:forEach items="${listTop2}" var="top2" begin="1" end="1">
					<a href="/post/${top2[4]}" style="text-decoration: none">
						<div class="main-blog__title"
							style="white-space: nowrap; text-overflow: ellipsis; width: 1000px; max-width: 350px; overflow: hidden;">${top2[0]}</div>
						<div class="main-blog__author tips">
							<div class="author-img__wrapper">
								<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-check">
									<path d="M20 6L9 17l-5-5" />
								</svg>
								<img class="author-img" src="${top2[2]}" />
							</div>
							<div class="author-detail">
								<div class="author-name">${top2[3]}</div>
								<div class="author-info">${top2[1]}</div>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
		<div class="small-header anim" style="--delay: .3s">
			<s:message code="main.post" />
		</div>
		<%-- <c:forEach items="${posts}" var="posts">
		
	</c:forEach> --%>
		<c:forEach items="${posts}" var="posts">
			<c:if
				test="${posts.post.send_StatusID==false && posts.post.post_Status==true}">
				<div class="post" id="post${posts.post.ID}">
					<div class="video-detail">
						<div class="video-content">
							<div class="video-p-wrapper anim" style="--delay: .1s">
								<div class="author-img__wrapper video-author video-p">
									<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="3" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-check">
												<path d="M20 6L9 17l-5-5" />
											</svg>
									<a href="/profile/${ posts.post.user.ID}"><img
										class="author-img" src="${ posts.post.user.avatar }" /> <input
										type="text" value="${ posts.post.user.ID}" name="inputUserID"
										style="display: none;"> </a>

								</div>
								<div class="video-p-detail">
									<div class="post-title dropdown">
										<div class="video-p-name">${ posts.post.user.fullname }</div>
										<div class="report-menu" data-toggle="dropdown">
											<i class="fa-solid fa-ellipsis"></i>
										</div>
										<div class="reprot-menu-content dropdown-menu ">
											<a class="link-report" href="/report/${ posts.post.ID }"><s:message
													code="main.report" /></a>
											<%-- <form action="/report/${ posts.post.ID }" method="post">
													<button type="submit">Báo cáo</button>
												</form> --%>
										</div>
									</div>
									<div class="video-p-detail-content">
										<div class="video-p-sub">${ posts.post.date_Post }</div>
										<c:if test="${posts.post.user.ID != sessionScope.user.ID}">
											<a href="/addFollow/${posts.post.user.ID}" class="btn-follow"><s:message
													code="main.follow" /></a>
										</c:if>
									</div>
								</div>

							</div>
							<div class="video-p-title anim" style="--delay: .2s">${ posts.post.post }
							</div>
							<div class="video-p-subtitle anim" style="--delay: .3s">
								<s:message code="main.position" />
								: ${ posts.post.address_Product }
							</div>
							<div class="video-p-subtitle anim" style="--delay: .4s">${ posts.post.hashTag }</div>
							<div class="div" style="z-index: 2;">
								<div class="list-img-post">
									<c:forEach items="${ posts.images }" var="img">
										<img src="${img }" alt="">
										<hr>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<div class="button-wrapper">
						<button
							onclick="sendMessageInterested('${sessionScope.user.username}','${posts.post.user.avatar}','${posts.post.user.username}','${ posts.post.ID }')"
							class="like red">
							<svg viewBox="0 0 24 24" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd" clip-rule="evenodd"
									d="M15.85 2.5c.63 0 1.26.09 1.86.29 3.69 1.2 5.02 5.25 3.91 8.79a12.728 12.728 0 01-3.01 4.81 38.456 38.456 0 01-6.33 4.96l-.25.15-.26-.16a38.093 38.093 0 01-6.37-4.96 12.933 12.933 0 01-3.01-4.8c-1.13-3.54.2-7.59 3.93-8.81.29-.1.59-.17.89-.21h.12c.28-.04.56-.06.84-.06h.11c.63.02 1.24.13 1.83.33h.06c.04.02.07.04.09.06.22.07.43.15.63.26l.38.17c.092.05.195.125.284.19.056.04.107.077.146.1l.05.03c.085.05.175.102.25.16a6.263 6.263 0 013.85-1.3zm2.66 7.2c.41-.01.76-.34.79-.76v-.12a3.3 3.3 0 00-2.11-3.16.8.8 0 00-1.01.5c-.14.42.08.88.5 1.03.64.24 1.07.87 1.07 1.57v.03a.86.86 0 00.19.62c.14.17.35.27.57.29z" />
									</svg>
							<s:message code="main.interested" />
						</button>
						<button class="like" data-toggle="modal"
							data-target="#favDialog_share${ posts.post.ID}">
							<svg viewBox="0 0 24 24" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
										<path
									d="M21.435 2.582a1.933 1.933 0 00-1.93-.503L3.408 6.759a1.92 1.92 0 00-1.384 1.522c-.142.75.355 1.704 1.003 2.102l5.033 3.094a1.304 1.304 0 001.61-.194l5.763-5.799a.734.734 0 011.06 0c.29.292.29.765 0 1.067l-5.773 5.8c-.428.43-.508 1.1-.193 1.62l3.075 5.083c.36.604.98.946 1.66.946.08 0 .17 0 .251-.01.78-.1 1.4-.634 1.63-1.39l4.773-16.075c.21-.685.02-1.43-.48-1.943z" />
									</svg>
							<s:message code="main.share" />
						</button>
						<button class="like cmt" data-toggle="modal"
							data-target="#favDialog_comment${ posts.post.ID }">
							<svg viewBox="0 0 24 24" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd" clip-rule="evenodd"
									d="M15.85 2.5c.63 0 1.26.09 1.86.29 3.69 1.2 5.02 5.25 3.91 8.79a12.728 12.728 0 01-3.01 4.81 38.456 38.456 0 01-6.33 4.96l-.25.15-.26-.16a38.093 38.093 0 01-6.37-4.96 12.933 12.933 0 01-3.01-4.8c-1.13-3.54.2-7.59 3.93-8.81.29-.1.59-.17.89-.21h.12c.28-.04.56-.06.84-.06h.11c.63.02 1.24.13 1.83.33h.06c.04.02.07.04.09.06.22.07.43.15.63.26l.38.17c.092.05.195.125.284.19.056.04.107.077.146.1l.05.03c.085.05.175.102.25.16a6.263 6.263 0 013.85-1.3zm2.66 7.2c.41-.01.76-.34.79-.76v-.12a3.3 3.3 0 00-2.11-3.16.8.8 0 00-1.01.5c-.14.42.08.88.5 1.03.64.24 1.07.87 1.07 1.57v.03a.86.86 0 00.19.62c.14.17.35.27.57.29z" />
									</svg>
							<s:message code="main.comment" />
						</button>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>


	<!-- Dialog create post -->
	<dialog id="favDialog">
	<div id="close_createPost">
		<i class="fa-solid fa-xmark"></i>
	</div>
	<div class="main_create_post">
		<div class="container">
			<div class="wrapper_createPost">
				<section class="post">
					<header>
						<s:message code="main.uppost" />
					</header>
					<form action="/uploadImg" method="post"
						enctype="multipart/form-data">
						<div class="content">
							<img src="${sessionScope.user.avatar}" alt="logo">
							<div class="details">
								<p>${sessionScope.user.fullname}</p>
								<div class="privacy" id="ststus_post"></div>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md-4">
								<label for="inputState"><s:message code="main.district" /></label>
								<select id="selectWards" name="nameWards" class="form-control">
									<c:forEach var="wards" items="${listWards}">
										<option value="${ wards.code}">${ wards.full_name}</option>
									</c:forEach>

								</select>
							</div>
							<div class="form-group col-md-4">
								<label for="inputState"><s:message code="main.province" /></label>
								<select id="selectDistrict" name="nameDistrict"
									class="form-control" value="${myBean =0}"
									onchange="getWards(this)">
									<c:forEach var="district" items="${listDistricts}">
										<option value="${ district.code}">${ district.full_name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label for="inputState"><s:message code="main.city" /></label>
								<select id="selectProvinces" name="nameProvinces"
									class="form-control" onchange="getDistricts(this)">
									<c:forEach var="provinces" items="${listProvinces}">
										<c:choose>
											<c:when
												test="${provinces.code == sessionScope.user.province.code}">
												<option value="${provinces.code}" selected>${provinces.full_name}</option>
											</c:when>
											<c:otherwise>
												<option value="${provinces.code}">${provinces.full_name}</option>
											</c:otherwise>
										</c:choose>


									</c:forEach>

								</select>
							</div>
						</div>
						<div class="content-post">
							<input type="text"
								placeholder="<s:message code="main.nameproduct"/>"
								name="product" required>
							<textarea placeholder="<s:message code="contact.content"/>"
								spellcheck="false" name="content" required></textarea>
							<div id="images-to-upload"></div>
						</div>

						<div class="options">
							<p>
								<s:message code="main.addtoyourpost" />
							</p>
							<ul class="list">
								<li><label> <img
										src="views/images/icons/gallery.svg" alt="gallery"> <input
										id="ip_images" type="file" accept="image/*" name="image_file"
										multiple="true">
								</label></li>
							</ul>
						</div>
						<button>
							<s:message code="main.uppost" />
						</button>
					</form>
				</section>
				<section class="audience">
					<header>
						<div class="arrow-back">
							<i class="fas fa-arrow-left"></i>
						</div>
						<p>
							<s:message code="main.userwantpost" />
						</p>
					</header>
					<div class="content">
						<p>
							<s:message code="main.whocansee" />
							?
						</p>
					</div>
					<ul class="list">
						<li>
							<div class="column">
								<div class="icon">
									<i class="fas fa-globe-asia"></i>
								</div>
								<div class="details">
									<p>
										<s:message code="main.public" />
									</p>
									<span><s:message code="main.everybody" /></span>
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
									<p>
										<s:message code="main.private" />
									</p>
									<span><s:message code="main.only" /></span>
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







	<c:forEach items="${posts}" var="posts">
		<div id="favDialog_comment${posts.post.ID }"
			class="modal fade favDialog_comment" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="close_cmt" onclick="closeDialog_setting()">
						<i class="fa-solid fa-xmark"></i>
					</div>
					<div class="cmt-container">
						<div class="post">
							<div class="post-detail">
								<div class="full-boxer">
									<div class="comment__container opened" id="first-comment">
										<c:forEach items="${comments}" var="comment">
											<c:if test="${posts.post.ID == comment.comment.post.ID}">
												<div class="comment__card" id="cmt${comment.comment.ID}">
													<c:if test="${comment.comment.commentParent ==null}">
														<div class="box-top">
															<div class="Profile">
																<div class="profile-image">
																	<img src="${ comment.comment.user.avatar}"
																		id="imgUserComment">
																</div>
																<div class="Name">
																	<strong>${comment.comment.user.fullname} </strong> <span>${comment.comment.dateComment}</span>
																</div>
															</div>
														</div>
														<p>${comment.comment.content}</p>
													</c:if>
													<c:if test="${comment.comment.commentParent ==null}">
														<div class="comment__card-footer">
															<div
																onclick="repComment('${comment.comment.ID}','${comment.comment.user.fullname}','${posts.post.ID}')">
																<s:message code="profile.reply" />
																${comment.countComment}
															</div>
															<c:if test="${comment.countComment >0}">
																<div class="show-replies"
																	onclick="seenMore('${comment.comment.ID}')">
																	<s:message code="main.seenmore" />
																</div>
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

								<form>
									<div class="comment-box">
										<input type="text" id="comment-input${posts.post.ID}"
											name="postComment"
											placeholder="<s:message code="main.comment" />">
										<button class="add-comment-btn"
											onclick="comment('${posts.post.ID }')">
											<i class="fa-regular fa-comment"></i>
										</button>
									</div>
								</form>
								<%-- 	<span class="comment-count">50 <s:message code="main.comment" /> </span> --%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<script src="views/js/post.js"></script>
	<script src="views/js/comment.js"></script>
	<script src="views/js/home.js"></script>
</body>
</html>