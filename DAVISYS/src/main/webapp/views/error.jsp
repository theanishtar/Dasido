<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="views/css/error.css">
</head>
<body>
	<div id="notfound">
		<div class="notfound">
			<div class="notfound-404">
				<h1>ERROR</h1>
			</div>
			<h2><s:message code="error.notlogin" />!</h2>
			<p><s:message code="error.pleaselogin" />!</p>
			<!-- <p>DASIDO rất xin lỗi về sự bất tiện này.</p> -->
			<a href="index"><s:message code="aside.home" /></a>
		</div>
	</div>
</body>
</html>