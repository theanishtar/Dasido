<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/views/css/forgotpassword.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="/views/js/jquery.min.js"></script>

<script src="https://kit.fontawesome.com/152112956f.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
</head>
<body>
	<main class="main">
		<div class="container">
			<section class="wrapper">
				<div class="heading">
					<h1 class="text text-large"><s:message code="forgotPW.forgot" />?</h1>
					<p class="text text-normal"><s:message code="forgotPW.typeEmail" /></p>
				</div>
				<form name="signin" class="form">
					<div class="input-control">
						<label for="email" class="input-label" hidden>Email</label> <input
							type="email" name="emailForgot" id="email" class="input-field"
							placeholder="<s:message code="forgotPW.email" />" required> 
					</div>
					<span id="messageForgot1"></span>
					<div class="input-control">
						<input type="button" name="submit" class="input-submit"
							value="<s:message code="forgotPW.getcode" />" required>
					</div>
				</form>
				<div class="striped">
					<span class="striped-line"></span> <span class="striped-text">Or</span>
					<span class="striped-line"></span>
				</div>
				<div class="method">
					<div class="method-control">
						<a href="login" class="method-action"> <i
							class="fa-solid fa-right-to-bracket"></i> <span> <s:message code="forgotPW.login" /></span>
						</a>
					</div>
				</div>
			</section>

			<section class="wrapper_validator">
				<div class="container_validator">

					<h2><s:message code="forgotPW.code" /></h2>
					<p>
						<s:message code="forgotPW.sendmail" /> <br /> <s:message code="forgotPW.typeyourcode" />
					</p>

					<div class="code-container">
						<input type="text" class="code" id="mxn" maxlength="6"
							placeholder="<s:message code="forgotPW.typecode" />"> <span id="messageForgot2"></span>
					</div>

					<div>
						<button type="submit" class="btn-confirm"><s:message code="forgotPW.confirm" /></button>
					</div>
					<small class="info"> <s:message code="forgotPW.turnback" /> </small>

				</div>
			</section>

			<section class="wrapper_changepass">
				<div class="container_changepass">
					<h2><s:message code="changePW.changepw" /></h2>

					<div class="code-container">
						<input type="text" id="newpass" class="change-pass"
							placeholder="<s:message code="changePW.new" />">
					</div>
					<div class="code-container">
						<input type="text" id="confirmpass" class="change-pass"
							placeholder="<s:message code="changePW.confirm" />">
					</div>
					<span id="messageForgot3"></span>
					<div>
						<button type="submit" id="btn_submit" onclick="btn_submit()"
							class="btn-change"><s:message code="forgotPW.confirm" /></button>
					</div>
					<span class="back-validator"> <a href="login"> <i
							class="fa-solid fa-right-to-bracket"></i> <s:message code="forgotPW.login" />
					</a>
					</span>
				</div>
			</section>
		</div>
	</main>

	<script src="/views/js/forgotpassword.js"></script>
</body>
</html>