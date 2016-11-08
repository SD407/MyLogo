<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Management</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
	
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
					<a class="navbar-brand" style="padding-top: 0px;"
						href="${aboutUrl}"><img
						src="<c:url value='/static/images/logo.png'/>"
						style="width: 50px; height: 50px;"> </a>
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
	
	<!-- User List -->
	<div class="container">
		<div class="panel panel-default" style="margin-top: 70px;">
			
			<!-- Collapsable Buttons -->
			<sec:authorize access="hasRole('USER')" var="isUser"/>
			<c:choose>
				<c:when test="${isUser}">
					<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#userList" aria-controls="userList"
					style="margin-top: 5px; margin-left: 5px; margin-bottom: 5px; margin-right: 5px; width: 180px;">
					Show Account Info</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#userList" aria-controls="userList"
					style="margin-top: 5px; margin-left: 5px; margin-bottom: 5px; margin-right: 5px; width: 180px;">
					Show User List</button>
				</c:otherwise>
			</c:choose>
			<!-- End of Collapsable Buttons -->
			
			<div id="userList" class="collapse">
				<div class="panel-heading" style="padding-left: 5px;">
					<span style="float: left; margin-top: 5px;"> 
						<sec:authorize access="hasRole('ADMIN')">
							<div>
								<a href="<c:url value='/newuser' />" class="btn btn-success">Add New User</a>
							</div>
						</sec:authorize>
					</span>
				</div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Firstname</th>
							<th>Lastname</th>
							<th>Email</th>
							<th>Username</th>
							<sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
								<th width="100"></th>
							</sec:authorize>
							<sec:authorize access="hasRole('ADMIN')">
								<th width="100"></th>
							</sec:authorize>

						</tr>
					</thead>
						<tbody>
							<sec:authorize access="hasRole('USER')" var="isUser"/>
							<c:forEach items="${users}" var="user">
								<c:choose>
									<c:when test="${(user.username eq loggedinuser) && (isUser)}">
										<tr>
											<td>${user.firstName}</td>
											<td>${user.lastName}</td>
											<td>${user.email}</td>
											<td>${user.username}</td>
										</tr>
									</c:when>
									<c:otherwise>
										<sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
											<tr>
												<td>${user.firstName}</td>
												<td>${user.lastName}</td>
												<td>${user.email}</td>
												<td>${user.username}</td>
												<sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
													<td><a style="float:right;"
														href="<c:url value='/edit-user-${user.username}' />"
														class="btn btn-success custom-width">edit</a></td>
												</sec:authorize>
												<sec:authorize access="hasRole('ADMIN')">
													<td><a
														href="<c:url value='/delete-user-${user.username}' />"
														class="btn btn-danger custom-width">delete</a></td>
												</sec:authorize>
											</tr>
										</sec:authorize>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- User List End -->
	
	<!-- Commission List -->
	<div class="container">
		<div class="panel panel-default">
		
			<!-- Collapsable Buttons -->
			<sec:authorize access="hasRole('USER')" var="isUser"/>
			<c:choose>
				<c:when test="${isUser}">
					<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#commission" aria-controls="commission"
					style="margin-top: 5px; margin-left: 5px; margin-bottom: 5px; margin-right: 5px; width: 180px;">
					My Commissions</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#commission" aria-controls="commission"
				style="margin-top: 5px; margin-left: 5px; margin-bottom: 5px; margin-right: 5px; width: 180px;">
				Show Commission List</button>
				</c:otherwise>
			</c:choose>
			<!-- End of Collapsable Buttons -->
			
			<div id="commission" class="collapse">
				<div class="panel-heading" style="padding-left: 5px;">
					<span style="float: left; margin-top: 5px;"> 
						<sec:authorize access="hasRole('USER') or hasRole('ADMIN')">
							<a href="<c:url value='/newcommission' />" class="btn btn-success">Create Commission</a>
						</sec:authorize>
					</span>
				</div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Commission Name</th>
							<th>Commission Details</th>
							<th>Commission Status</th>
							<sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
								<th width="100"></th>
							</sec:authorize>
							<sec:authorize access="hasRole('ADMIN')">
								<th width="100"></th>
							</sec:authorize>

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${commissions}" var="commission">
							<tr>
								<td>${commission.orderName}</td>
								<td style="max-width:200px;word-wrap:break-word;">${commission.orderDetails}</td>
								<td>${commission.orderStatus}</td>
								<sec:authorize access="hasRole('ADMIN') or hasRole('DBA') or hasRole('USER')">
									<td><a style="float:right;"
										href="<c:url value='/edit-commission-${commission.orderName}' />"
										class="btn btn-success custom-width">edit</a></td>
								</sec:authorize>
								<sec:authorize access="hasRole('ADMIN')">
									<td><a
										href="<c:url value='/delete-commission-${commission.orderName}' />"
										class="btn btn-danger custom-width">delete</a></td>
								</sec:authorize>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- Commission List End -->
	
</body>
</html>