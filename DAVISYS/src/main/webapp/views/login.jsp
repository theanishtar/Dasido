<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="google-signin-client_id"
	content="829042615252-9cgbgmdc55famceanr15b20dq3kns76m.apps.googleusercontent.com">

<title>Login With Google Account Using JavaScript</title>
</head>
<body>
	﻿

	<h2 class="alert alert-primary">Sign In With Google Using
		JaavaScript</h2>
	<!-- <div class="g-signin2" data-onsuccess="onSignIn"></div> -->

	<script src="https://accounts.google.com/gsi/client" async defer></script>
	<div id="g_id_onload"
		data-client_id="829042615252-9cgbgmdc55famceanr15b20dq3kns76m"
		data-ux_mode="redirect" data-callback="handleCredentialResponse"
		data-login_uri="/home"></div>
	<script>
		function handleCredentialResponse(response) {
			// decodeJwtResponse() is a custom function defined by you
			// to decode the credential response.
			const responsePayload = decodeJwtResponse(response.credential);

			console.log("ID: " + responsePayload.sub);
			console.log('Full Name: ' + responsePayload.name);
			console.log('Given Name: ' + responsePayload.given_name);
			console.log('Family Name: ' + responsePayload.family_name);
			console.log("Image URL: " + responsePayload.picture);
			console.log("Email: " + responsePayload.email);
		}
	</script>
	<div class="g_id_signin" data-type="standard"></div>
	<!-- <div class="data">
		<p>Name</p>
		<p id="name" class="alert alert-success"></p>
		<p>Profile Pic</p>
		<img id="image" class="rounded-circle" width="100" height="100" />
		<p>Email</p>
		<p id="email"></p>
		<button type="button" class="btn btn-danger" onclick="signOut();">Sign
			Out</button>
	</div> -->

	<a href="/logout" onclick="signOut();">Sign out</a>
	<script>
		function signOut() {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function() {
				console.log('User signed out.');
			});
		}
	</script>
	<script>
		﻿

		function onSignIn(googleUser) {
			var profile = googleUser.getBasicProfile();
			console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			console.log('Name: ' + profile.getName());
			console.log('Image URL: ' + profile.getImageUrl());
			console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		}

		function signOut() {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function() {
				alert("You have been signed out successfully");
				$(".g-signin2").css("display", "block");
				$(".data").css("display", "none");
			});
		}
	</script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>