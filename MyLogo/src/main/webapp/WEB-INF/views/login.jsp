<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login</title>
		<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
		<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
		<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" />
		<link href="<c:url value='/static/js/bootstrap.min.js' />">
	    
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
	</head>

<body>
	<!-- Menu -->
	<div class="container">
		<!-- Fixed navbar -->
		<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" style="padding-top: 0px;" href="${aboutUrl}"><img
					src="<c:url value='/static/images/logo.png'/>"
					style="width: 50px; height: 50px;">
				</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<c:url var="homeUrl" value="/home" />
					<li class="#"><a href="${homeUrl}">Home</a></li>
				</ul>
				<ul class="nav navbar-nav">
					<c:url var="aboutUrl" value="/about" />
					<li class="#"><a href="${aboutUrl}">About</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<sec:authorize var="loggedIn" access="isAuthenticated()"> 
						<c:choose>
							<c:when test="${loggedIn}">
								<c:url var="logoutUrl" value="/logout" />
								<li class="#"><a href="${logoutUrl}">Logout</a></li>
							</c:when>
						</c:choose>
					</sec:authorize>
					<sec:authorize var="anonymous" access="!isAuthenticated()"> 
						<c:choose>
							<c:when test="${anonymous}">
								<c:url var="loginUrl" value="/login" />
								<li class="#"><a href="${loginUrl}">Login</a></li>
							</c:when>
						</c:choose>
					</sec:authorize>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
		</nav>
	</div>
	<!-- Menu end -->

	<div class="panel panel-default main-login main-login-center" style="margin-top: 100px;">
		<div class="login-card">
			<div class="login-form">
				<c:url var="loginUrl" value="/login" />
				<form action="${loginUrl}" method="post" class="form-horizontal">
					<c:if test="${param.error != null}">
						<div class="alert alert-danger">
							<p>Invalid username and password.</p>
						</div>
					</c:if>
					<c:if test="${param.logout != null}">
						<div class="alert alert-success">
							<p>You have been logged out successfully.</p>
						</div>
					</c:if>
					<div class="input-group">
						<label class="input-group-addon" for="username">
						<i class="fa fa-user"></i></label> 
						<input type="text" class="form-control" id="username" name="username" 
						placeholder="Enter Username" required>
					</div>
					<div class="input-group" style="margin-top:10px;">
						<label class="input-group-addon" for="password">
						<i class="fa fa-lock"></i></label> 
						<input type="password" class="form-control" id="password" name="password"
						placeholder="Enter Password" required>
					</div>
					<div class="input-group">
						<div class="checkbox">
							<label><input type="checkbox" id="rememberme"
								name="remember-me"> Remember Me</label>
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

					<div class="form-actions">
						<input type="submit"
							class="btn btn-block btn-primary btn-default" value="Log in">
					</div>


					<!-- Register in loging form -->
					<div align="center" class="form-actions" style="margin-top: 10px;">
						<c:url var="registerUrl" value="/register" />
						<a href="${registerUrl}">Register</a>
					</div>


				</form>
			</div>
		</div>
	</div>

</body>
</html>