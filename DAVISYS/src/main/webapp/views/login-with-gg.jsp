<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div class="data"></div>
		<p>Name : <h3>${currentUserGG.name}</h3> </p>
		<p id="name" class="alert alert-success"></p>
		<p>Profile Pic</p>
		<img id="image" class="rounded-circle" width="100" height="100" src="${currentUserGG.picture}"/>
		<p>Email: <h3>${currentUserGG.email}</h3> </p>
		<p id="email"></p>
		<button type="button" class="btn btn-danger" onclick="signOut();">Sign
			Out</button>
</body>
</html>