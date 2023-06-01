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

	<div class="g_id_signin" data-type="standard"></div>

	<a href="/logout" onclick="signOut();">Sign out</a>

</body>
</html>