<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="views/css/home.css">
<link rel="stylesheet" href="views/css/profile.css">-->




<!-- Link new layout -->
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css'>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<link rel="stylesheet" href="/views/css/home2.css">

<!-- <link rel="stylesheet" href="/views/css/message.css"> -->
<link rel="stylesheet" href="/views/css/loadimages.css">
<!--  <link rel="stylesheet" href="views/css/dialog.css">  -->

<link rel="stylesheet" href="/views/css/home.css">


<link rel="stylesheet"
	href="https://vjs.zencdn.net/5-unsafe/video-js.css">
<link rel="stylesheet" href="/views/css/home2.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://vjs.zencdn.net/5-unsafe/video.js"></script>

<!-- Link new layout -->


<!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://kit.fontawesome.com/152112956f.js"
	crossorigin="anonymous"></script>

<script src="/views/js/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.0/handlebars.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<body>
	<div class="container">
		<tiles:insertAttribute name="aside"></tiles:insertAttribute>
		<div class="wrapper">
			<tiles:insertAttribute name="menu"></tiles:insertAttribute>
			<!-- main section -->
			<div class="main-container">
				<tiles:insertAttribute name="main"></tiles:insertAttribute>
			</div>
		</div>
	</div>
	<!-- <script src="views/js/home.js"></script> -->
	<script src="/views/js/dialog.js"></script>
	<script src="/views/js/loadimages.js"></script>
	<script src="/views/js/custom.js"></script>
	<script src="/views/js/chat.js"></script>
	<script>
		registration('${sessionScope.user.username}');
	</script>

</body>


</html>