<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<nav class="navbar navbar-dark bg-dark navbar-expand-lg">
		<a class="navbar-brand" href="/home/index">J5Shop</a>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="/home/index"><s:message code="lo.mn.home"/>
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="/home/about"><s:message code="lo.mn.about"/></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><s:message code="lo.mn.contact"/></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><s:message code="lo.mn.feedback"/></a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <s:message code="lo.mn.account"/> </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Change password</a> 
						<a class="dropdown-item" href="#">Edit Profile</a>
						<a class="dropdown-item" href="#">Logout</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Login</a>
						<a class="dropdown-item" href="#">Register</a>
					</div>
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<a href="?lg=vi" class="btn btn-outline-success my-2 my-sm-0 lang" type="submit">Tiếng việt</a>
				<a href="?lg=en" class="btn btn-outline-success my-2 my-sm-0 lang" type="submit">Tiếng anh</a>
			</form>
		</div>
	</nav>
</body>
</html>