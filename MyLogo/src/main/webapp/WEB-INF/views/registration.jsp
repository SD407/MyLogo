<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>

	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>User Registration Form</title>
		<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
		<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
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
				<ul class="nav navbar-nav">
					<sec:authorize access="isAuthenticated()">
						<c:url var="list" value="/list" />
						<li class="active"><a href="${list}">My Account</a></li>
					</sec:authorize>
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

 	<div class="panel panel-default main-login main-center" style="margin-top: 100px;">
		
		<sec:authorize access="hasRole('DBA') or hasRole('ADMIN')" var="isManaging"/>
		<c:choose>
			<c:when test="${isManaging}">
				<div class="lead" align="center">User Creation Form</div>
			</c:when>
			<c:otherwise>
				<div class="lead" align="center">User Registration Form</div>
			</c:otherwise>
		</c:choose>
		
	 	<form:form method="POST" modelAttribute="user" class="form-horizontal">
			<form:input type="hidden" path="id" id="id"/>
			
			<div class="form-group">
			    <label for="firstName">First Name</label>
			    <form:input type="text" path="firstName" id="firstName" class="form-control" placeholder="Enter your first name"/>
			    	<div class="has-error">
						<form:errors path="firstName" class="help-inline"/>
					</div>
			</div>
	
			<div class="form-group">
			    <label for="lastName">Last Name</label>
			    <form:input type="text" path="lastName" id="lastName" class="form-control" placeholder="Enter your last name"/>
			    	<div class="has-error">
						<form:errors path="lastName" class="help-inline"/>
					</div>
			</div>
	
			<div class="form-group">
			    <label for="username">Username</label>
			    	<div>
						<c:choose>
							<c:when test="${edit}">
								<form:input type="text" path="username" id="username" class="form-control" disabled="true"/>
							</c:when>
							<c:otherwise>
								<form:input type="text" path="username" id="username" class="form-control" placeholder="Enter your username"/>
							    	<div class="has-error">
										<form:errors path="username" class="help-inline"/>
									</div>
							</c:otherwise>
						</c:choose>
					</div>
			</div>
	
			<div class="form-group">
			    <label for="password">Password</label>
			    <form:input type="password" path="password" id="password" class="form-control" placeholder="Enter your password"/>
			    	<div class="has-error">
						<form:errors path="password" class="help-inline"/>
					</div>
			</div>
	
			<div class="form-group">
			    <label for="firstName">Email</label>
			    <form:input type="text" path="email" id="email" class="form-control" placeholder="Enter your email"/>
			    	<div class="has-error">
						<form:errors path="email" class="help-inline"/>
					</div>
			</div>
			
			
			<div class="form-group">
			    <label for="userRoles">Roles</label>
					<form:select path="userRoles" items="${roles}" multiple="true" itemValue="id" itemLabel="role" class="form-control input-sm" />
					<div class="has-error">
						<form:errors path="userRoles" class="help-inline"/>
					</div>
			</div>
	
			<div class="row">
				<div class="form-actions floatRight">
					<c:choose>
						<c:when test="${edit}">
							<input type="submit" value="Update" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/list' />">Cancel</a>
						</c:when>
						<c:otherwise>
							<input type="submit" value="Register" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/list' />">Cancel</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>