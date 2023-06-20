<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>


<link rel="stylesheet" href="/views/css/profile.css">
<script src="/views/js/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>

</head>
<body>
	<style>
#images-to-upload img {
	width: 450px;
	margin: 0;
}

.left-post {
	height: 565px;
	overflow: auto;
	overflow: -moz-scrollbars-none;
	-ms-overflow-style: none;
}

.left-post::-webkit-scrollbar {
	width: 0 !important;
	display: none;
}

.radios {
	display: flex;
}

.radio_include {
	display: flex;
	margin-right: 3rem;
}

.radio_include .radio_check {
	width: 15px;
	margin-left: 1rem;
}
</style>
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
					<p class="fling" data-toggle="modal" data-target="#myModal">${countFLing}
						<s:message code="profile.following" />
					</p>
					<p class="fler">${countFLer}
						<s:message code="profile.follower" />
					</p>
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
							<div class="video-p-subtitle anim" style="--delay: .3s">
								<s:message code="profile.position" />
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
								<%-- <div id="favDialog_comment${posts.post.ID }">
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
																<c:forEach items="${commentsProfile}" var="comment">
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
																						onclick="repComment('${comment.comment.ID}','${comment.comment.user.fullname}','${posts.post.ID}')">
																						<s:message code="profile.reply" />
																						${comment.countComment}
																					</div>
																					<c:if test="${comment.countComment >0}">
																						<div class="show-replies"
																							onclick="seenMore('${comment.comment.ID}')">
																							<s:message code="profile.seenmore" />
																						</div>
																					</c:if>

																				</div>
																			</c:if>
																		</div>
																		<c:forEach items="${comments}" var="comment">
																		<c:if test="${comment.comment.commentParent ==null}">
																			<div id="replyContentComment${comment.comment.ID}"></div>
																		</c:if>
																		</c:forEach>
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
																	name="postComment"
																	placeholder="<s:message code="profile.comment"/>">
																<button class="add-comment-btn"
																	onclick="comment('${posts.post.ID }')">
																	<i class="fa-regular fa-comment"></i>
																</button>
															</div>
														</form>
														<span class="comment-count">50 <s:message
																code="profile.comment" /></span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div> --%>
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
							<s:message code="profile.interested" />
						</button>
						<%-- <button class="like">
							<svg viewBox="0 0 24 24" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
										<path
									d="M21.435 2.582a1.933 1.933 0 00-1.93-.503L3.408 6.759a1.92 1.92 0 00-1.384 1.522c-.142.75.355 1.704 1.003 2.102l5.033 3.094a1.304 1.304 0 001.61-.194l5.763-5.799a.734.734 0 011.06 0c.29.292.29.765 0 1.067l-5.773 5.8c-.428.43-.508 1.1-.193 1.62l3.075 5.083c.36.604.98.946 1.66.946.08 0 .17 0 .251-.01.78-.1 1.4-.634 1.63-1.39l4.773-16.075c.21-.685.02-1.43-.48-1.943z" />
									</svg>
							<s:message code="profile.share" />
						</button> --%>
						<button class="like cmt" data-toggle="modal"
							data-target="#favDialog_comment${ posts.post.ID }">
							<svg viewBox="0 0 24 24" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd" clip-rule="evenodd"
									d="M15.85 2.5c.63 0 1.26.09 1.86.29 3.69 1.2 5.02 5.25 3.91 8.79a12.728 12.728 0 01-3.01 4.81 38.456 38.456 0 01-6.33 4.96l-.25.15-.26-.16a38.093 38.093 0 01-6.37-4.96 12.933 12.933 0 01-3.01-4.8c-1.13-3.54.2-7.59 3.93-8.81.29-.1.59-.17.89-.21h.12c.28-.04.56-.06.84-.06h.11c.63.02 1.24.13 1.83.33h.06c.04.02.07.04.09.06.22.07.43.15.63.26l.38.17c.092.05.195.125.284.19.056.04.107.077.146.1l.05.03c.085.05.175.102.25.16a6.263 6.263 0 013.85-1.3zm2.66 7.2c.41-.01.76-.34.79-.76v-.12a3.3 3.3 0 00-2.11-3.16.8.8 0 00-1.01.5c-.14.42.08.88.5 1.03.64.24 1.07.87 1.07 1.57v.03a.86.86 0 00.19.62c.14.17.35.27.57.29z" />
									</svg>
							Bình luận
						</button>
						<c:if test="${posts.post.user.ID == sessionScope.user.ID}">
							<button class="like cmt" onclick="loadImg('${posts.post.ID }')"
								data-target="#favDialog_updatePost${posts.post.ID }"
								data-toggle="modal">
								<i class="fa-solid fa-pen-to-square"></i>
								<s:message code="profile.edit" />
							</button>
						</c:if>
					</div>
				</div>


				<div id="favDialog_updatePost${posts.post.ID }"
					class="modal fade favDialog_updatePost" role="dialog">
					<!-- <div class="modal-dialog"> -->

					<!-- <div class="modal-content"> -->
					<!-- <div class="modal-body"> -->
					<form action="/updatePost/${posts.post.ID}" method="post"
						enctype="multipart/form-data">
						<div class="modal-header">
							<a id="close2" type="button" href="/profile/${user.ID}"><s:message
									code="profile.exit" /></a>
							<p class="title-update">
								<s:message code="profile.updatepost" />
							</p>
							<button id="updatePosst" onclick="updatePost('${posts.post.ID}')">
								<s:message code="profile.update" />
							</button>
						</div>
						<div class="post-container-update">

							<div class="post">
								<div class="left-post">
									<div class="post-feed">
										<div class="post-img-container-update">
											<label> <input id="ip_images${posts.post.ID}"
												type="file" accept="image/*" onchange="addImg(event)"
												name="image_file${posts.post.ID }" multiple="true"
												style="display: none">
												<div id="images-to-upload${posts.post.ID }">
													<div>
														<c:forEach items="${ posts.images}" var="img">
															<img src="${img }" alt="">
															<!-- <hr> -->
														</c:forEach>
													</div>
												</div>
											</label>
										</div>
									</div>
								</div>
								<div class="post-detail">
									<div class="info-update">
										<div class="post-header">
											<img src="${posts.post.user.avatar}" class="user-icon" alt="">
											<p class="username">${posts.post.user.fullname}</p>
										</div>
									</div>
									<textarea class="post-des-update"
										name="content${posts.post.ID}"
										id="contentPost${posts.post.ID}" cols="45" rows="10">${posts.post.post}
                    			</textarea>
									<p style="color: white;">Đối tượng xem bài</p>
									<div class="radios">
										<div class="radio_include">
											<label>Công khai</label> <input type="radio"
												class="radio_check" value="true"
												${posts.post.post_Status==true?"checked":""}
												name="radioPost${posts.post.ID}">
										</div>
										<div class="radio_include">
											<label>Riêng tư</label> <input type="radio"
												class="radio_check" value="false"
												${posts.post.post_Status==false?"checked":""}
												name="radioPost${posts.post.ID}">
										</div>
									</div>
									<div class="name-product">
										<input class="input" value="${posts.post.product}"
											name="product${posts.post.ID}"
											id="productPost${posts.post.ID}"
											placeholder="<s:message code="main.nameproduct"/>"
											required="required" type="text"> <span
											class="input-border"></span>
									</div>


									<div class="address">
										<!-- <input class="input" placeholder="Vị trí" required=""
										type="text"> <span class="input-border"></span> -->

										<div class="row">
											<div class="form-group col-md-4">
												<label for="inputState">Huyện</label> <select
													id="selectWards${posts.post.ID}"
													name="nameWards${posts.post.ID}" class="form-control">
													<c:forEach var="wards" items="${listWards}">
														<option value="${wards.code}">${ wards.full_name}</option>
													</c:forEach>

												</select>
											</div>
											<div class="form-group col-md-4">
												<label for="inputState">Tỉnh</label> <select
													id="selectDistrict${posts.post.ID}"
													name="nameDistrict${posts.post.ID}" class="form-control"
													value="${myBean =0}"
													onchange="getWardsUpdatePost(this,'${posts.post.ID}')">
													<c:forEach var="district" items="${listDistricts}">
														<option value="${ district.code}">${ district.full_name}</option>
													</c:forEach>
												</select>
											</div>
											<div class="form-group col-md-4">
												<label for="inputState">Thành phố</label> <select
													id="selectProvinces${posts.post.ID}"
													name="nameProvinces${posts.post.ID}" class="form-control"
													onchange="getDistrictsUpdatePost(this,'${posts.post.ID}')">
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
									</div>
									<div class="btn-sendStatus">
										<s:message code="profile.statuspost" />
										:
										<button>
											<svg xmlns="http://www.w3.org/2000/svg" fill="none"
												viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
												aria-hidden="true">
    							<path stroke-linecap="round" stroke-linejoin="round"
													d="M17.593 3.322c1.1.128 1.907 1.077 1.907 2.185V21L12 17.25 4.5 21V5.507c0-1.108.806-2.057 1.907-2.185a48.507 48.507 0 0111.186 0z"></path>
  						</svg>
											<s:message code="profile.alreadyreceive" />
										</button>
									</div>
								</div>
							</div>

						</div>
					</form>
				</div>

			</c:forEach>
		</div>
	</div>


	<c:forEach items="${listPost}" var="posts">
		<div id="favDialog_comment${posts.post.ID }" class="modal fade"
			role="dialog">
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
										<c:forEach items="${commentsProfile}" var="comment">
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
																	<strong>${comment.comment.user.fullname} </strong> <span>${comment.comment.dateComment}</span>
																</div>
															</div>
														</div>
														<p>${comment.comment.content}</p>
													</c:if>
													<c:if test="${comment.comment.commentParent ==null}">
														<div class="comment__card-footer">
															<div
																onclick="repComment('${comment.comment.ID}','${comment.comment.user.fullname}','${posts.post.ID}')"><s:message code="profile.reply" /> ${comment.countComment}</div>
															<c:if test="${comment.countComment >0}">
																<div class="show-replies"
																	onclick="seenMore('${comment.comment.ID}')"><s:message code="main.seenmore" /></div>
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
											name="postComment" placeholder="<s:message code="main.comment" />">
										<button class="add-comment-btn"
											onclick="comment('${posts.post.ID }')">
											<i class="fa-regular fa-comment"></i>
										</button>
									</div>
								</form>
						<%-- 		<span class="comment-count">50 bình luận</span>
 --%>							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

	<script src="/views/js/updatePost.js"></script>
	<script src="/views/js/profile.js"></script>
</body>
</html>