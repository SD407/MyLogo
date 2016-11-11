<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>

	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Commission Creation Form</title>
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
		
		<div class="lead" align="center">Commission Creation Form</div>
		
	 	<form:form method="POST" modelAttribute="commission" class="form-horizontal">
			<form:input type="hidden" path="id" id="id"/>
			
			<div class="form-group">
			    <label for="orderName">Commission Name</label>
			    	<div>
						<c:choose>
							<c:when test="${edit}">
								<form:input type="text" path="orderName" id="orderName" class="form-control" disabled="true"/>
							</c:when>
							<c:otherwise>
								<form:input type="text" path="orderName" id="orderName" class="form-control" placeholder="Enter your commission name"/>
							    	<div class="has-error">
										<form:errors path="orderName" class="help-inline"/>
									</div>
							</c:otherwise>
						</c:choose>
					</div>
			</div>
			
			<div class="form-group">
			    <label for="orderDetails">Commission Details</label>
			    <form:textarea type="text" path="orderDetails" id="comment" class="form-control" rows="5" placeholder="Enter your commission details"/>
			    	<div class="has-error">
						<form:errors path="orderDetails" class="help-inline"/>
					</div>
			</div>
	
			<div class="form-group">
			    <label for="orderStatus">Commission Status</label>
					<form:select path="orderStatus" id="orderStatus" class="form-control input-sm">
						<option>Finished</option>
  						<option>In Progress</option>
   						<option>Not Started</option>
					</form:select>
					<div class="has-error">
						<form:errors path="orderStatus" class="help-inline"/>
					</div>
			</div>
			
			<div class="row">
				<div class="form-actions floatRight">
					<c:choose>
						<c:when test="${edit}">
							<input type="submit" value="Update" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/list' />">Cancel</a>
						</c:when>
						<c:otherwise>
							<input type="submit" value="Create" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/list' />">Cancel</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>