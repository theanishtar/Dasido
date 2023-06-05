<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Users</h1>
	<table border="1" style="width: 100%">
		<c:forEach items="${ users }" var="user">
			<tr>
				<td>${ user.username }</td>
				<td>${ user.password }</td>
				<td>${ user.fullname }</td>
				<td>${ user.email }</td>
			</tr>
		</c:forEach>
	</table>

	<br>
	<h1>Post</h1>
	<table border="1" style="width: 100%">
		<c:forEach items="${ posts }" var="post">
			<tr>
				<td>${ post.user.ID }</td>
				<td>${ post.post }</td>
				<td>${ post.address_Product }</td>
				<td>${ post.send_StatusID.name_Send_Status}</td>
				<td>${ post.product }</td>
			</tr>
		</c:forEach>
	</table>

	<h1>Follower</h1>
	<table border="1" style="width: 100%">
		<c:forEach items="${ fls }" var="fl">
			<tr>
				<td>${ fl.followerID }</td>
				<td>${ fl.user.ID }</td>
				<td>${ fl.user.username }</td>
			</tr>
		</c:forEach>
	</table>
	
	<h1>Comment</h1>
	<table border="1" style="width: 100%">
		<c:forEach items="${ cmts }" var="cmts">
			<tr>
				<td>${ cmts.ID }</td>
				<td>${ cmts.user.fullname }</td>
				<td>${ cmts.post.post }</td>
				<td>${ cmts.dateComment }</td>
				<td>${ cmts.content }</td>
			</tr>
		</c:forEach>
	</table>
	
	<h1>Interested</h1>
	<table border="1" style="width: 100%">
		<c:forEach items="${ inter }" var="inter">
			<tr>
				<td>${ inter.ID }</td>
				<td>${ inter.user.fullname }</td>
				<td>${ inter.post.post }</td>
				<td>${ inter.content }</td>
			</tr>
		</c:forEach>
	</table>
	
	<h1>History</h1>
	<table border="1" style="width: 100%">
		<c:forEach items="${ his }" var="his">
			<tr>
				<td>${ his.ID }</td>
				<td>${ his.user.fullname }</td>
				<td>${ his.post.post }</td>
			</tr>
		</c:forEach>
	</table>
	
	<h1>Share</h1>
	<table border="1" style="width: 100%">
		<c:forEach items="${ shr }" var="shr">
			<tr>
				<td>${ shr.ID }</td>
				<td>${ shr.user.fullname }</td>
				<td>${ shr.post.post }</td>
				<td>${ shr.date_Share }</td>
			</tr>
		</c:forEach>
	</table>
	
	<h1>Province</h1>
	<table border="1" style="width: 100%">
		<c:forEach items="${ pro }" var="pro">
			<tr>
				<td>${ pro.code }</td>
				<td>${ pro.name }</td>
				<td>${ pro.full_name }</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>