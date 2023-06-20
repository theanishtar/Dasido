<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="views/css/style.css">

</head>
<body>
	<header>
		<div class="section__container header__container">
			<div class="header__image">
				<img src="views/images/hd-1.png" /> <img
					src="views/images/hd-2.jpg" />
			</div>
			<div class="header__content">
				<div>
					<div>
						<div class="animated-word">
							<div class="letter">E</div>
							<div class="letter">U</div>
							<div class="letter">P</div>
							<div class="letter">H</div>
							<div class="letter">O</div>
							<div class="letter">R</div>
							<div class="letter">I</div>
							<div class="letter">A</div>
						</div>
						<%-- <h1><s:message code="index.about" /></h1> --%>
					</div>
					<p class="section__subtitle">
						<br> <s:message code="index.logintouse" /> !!!
					</p>
					<div class="action__btns">
						<a class="btn" href="login"><s:message code="forgotPW.login" /></a>
					</div>
				</div>
			</div>
		</div>
	</header>
	<section class="introduce">
		<div class="section__container introduce__container">
			<h2 class="section__title"><s:message code="index.title" /></h2>
			<p class="section__subtitle">
				<s:message code="index.content" />
			</p>
			<div class="destination__grid">
				<div class="destination__card">
					<img src="views/images/product/clothes.jpg" alt="destination" />
					<div class="destination__details">
						<p class="destination__subtitle"><s:message code="index.clothe" /></p>
					</div>
				</div>
				<div class="destination__card">
					<img src="views/images/product/tech.jpg" alt="destination" />
					<div class="destination__details">
						<p class="destination__subtitle"><s:message code="index.tech" /></p>
					</div>
				</div>
				<div class="destination__card">
					<img src="views/images/product/book.jpg" alt="destination" />
					<div class="destination__details">
						<p class="destination__subtitle"><s:message code="index.book" /></p>
					</div>
				</div>
				<div class="destination__card">
					<img src="views/images/product/houseware.jpg" alt="destination" />
					<div class="destination__details">
						<p class="destination__subtitle"><s:message code="index.house" /></p>
					</div>
				</div>
			</div>
	</section>
	<section class="reason">
		<div class="section__container reason__container">
			<div class="image__reason">
				<div class="reason__col">
					<img src="views/images/hd-1.png" alt="reason" />
				</div>
				<div class="reason__col">
					<img src="views/images/gallery-2.jpg" alt="reason" /> <img
						src="views/images/hd-2.jpg" alt="reason" />
				</div>
			</div>
			<div class="reason__content">
				<div>
					<h2 class="section__title"><s:message code="index.reason" />?
					</h2>
					<p class="section__subtitle" style="margin-bottom: 10px;"><s:message code="index.why" />:
					<li><s:message code="index.discrease" /></li>
					<li><s:message code="index.tietkiem" /></li>
					<li><s:message code="index.inviroment" /></li>
					<li><s:message code="index.recycle" /></li>
					</p>
				</div>
			</div>
		</div>
	</section>

	<footer class="footer">
		<div class="section__container footer__container">
			<div class="footer__col">
				<h3>
					EUPHORIA<span>.</span>
				</h3>
				<p><s:message code="index.titlefooter" /></p>
			</div>
			<div class="footer__col">
				<h4><s:message code="index.tools" /></h4>
				<p><s:message code="index.account" /></p>
				<p><s:message code="index.post" /></p>
				<p><s:message code="index.history" /></p>
				<p><s:message code="index.history" /></p>
			</div>
			<div class="footer__col">
				<h4><s:message code="updateprofile.province" /></h4>
				<p>
					<span><s:message code="updateprofile.province" />:</span> FPT POLYTECHNIC CẦN THƠ
				</p>
				<p>
					<span>Email:</span> dasido.2hand.davisy@gmail.com
				</p>
				<p>
					<span><s:message code="index.phone" />:</span> +0123456789
				</p>
			</div>
		</div>
		<div class="footer__bar">DAVISY TEAM</div>
	</footer>
</body>
</html>