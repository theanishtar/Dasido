<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Dashboard</title>

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

<!-- Custom fonts for this template-->
<link href="/views/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/152112956f.js"
	crossorigin="anonymous"></script>
<!-- Custom styles for this template-->
<link href="/views/css/sb-admin-2.min.css" rel="stylesheet">
<link href="/views/css/adminpage.css" rel="stylesheet">

</head>

<body id="page-top" style="zoom: 0 !important;">
	<style>
	.container {
		margin: 0 !important;
		max-width: 1560px !important;
	body #page-top #myElement{
		zoom: 0 !important;
	}
}
</style>
	<div class="container">
		<tiles:insertAttribute name="aside"></tiles:insertAttribute>
		<div class="wrapper">
			<tiles:insertAttribute name="header"></tiles:insertAttribute>
			<!-- main section -->
			<div id="content-wrapper" class="d-flex flex-column">
				<div id="content">
					<div class="container-fluid">
						<tiles:insertAttribute name="body" />
					</div>
				</div>
				<%-- <tiles:insertAttribute name="footer" /> --%>
			</div>
		</div>
	</div>

	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Bootstrap core JavaScript-->
	<script src="/views/vendor/jquery/jquery.min.js"></script>
	<script src="/views/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/views/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/views/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="/views/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/views/js/demo/chart-area-demo.js"></script>
	<script src="/views/js/demo/chart-pie-demo.js"></script>

</body>

</html>