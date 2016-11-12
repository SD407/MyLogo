<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Terms and Conditions</title>
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
					<li class=#><a href="${homeUrl}">Home</a></li>
				</ul>
				<ul class="nav navbar-nav">
					<c:url var="aboutUrl" value="/about" />
					<li class="#"><a href="${aboutUrl}">About</a></li>
				</ul>
				<ul class="nav navbar-nav">
					<sec:authorize access="isAuthenticated()">
						<c:url var="list" value="/list" />
						<li class="#"><a href="${list}">My Account</a></li>
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
	
	<!-- Content -->
	<div class="container" style="position:relative;">
		<div class="panel panel-default" style="margin-top: 55px; margin-bottom: 5px; height:700px;">
			<div class="panel-heading">
				<b> </b>
				<div class="panel-heading" style="padding-left: 0px;">
					<b>Terms and Conditions.</b> <span style="float: left; margin-right: 10px;"  aria-hidden="true" />
				</div>

				<div style="margin: 5px 10px 5px 10px; align: center;">
					<p><b>I.</b></p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu ligula libero. 
					Praesent posuere leo eu suscipit dignissim. Proin porttitor neque vitae augue malesuada
					, sed pharetra justo placerat. Donec vehicula metus eget aliquet luctus. 
					uisque consectetur blandit urna. Donec quam diam, consectetur in venenatis eget, aliquet 
					at massa. Nulla egestas nec tellus ut tristique. Nulla sit amet leo elementum, posuere 
					lorem vitae, vulputate nulla. Duis sed purus fermentum, ultrices risus ut, consectetur 
					quam. Proin eleifend porttitor libero quis mollis. Donec at luctus libero. Donec tortor 
					diam, efficitur nec ligula vitae, venenatis suscipit nunc. Fusce dignissim, leo at pharetra 
					consectetur, justo dui mattis tortor, sed tincidunt elit ante in nulla. </p>
					<p><b>II.</b></p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu ligula libero. 
					Praesent posuere leo eu suscipit dignissim. Proin porttitor neque vitae augue malesuada
					, sed pharetra justo placerat. Donec vehicula metus eget aliquet luctus. 
					uisque consectetur blandit urna. Donec quam diam, consectetur in venenatis eget, aliquet 
					at massa. Nulla egestas nec tellus ut tristique. Nulla sit amet leo elementum, posuere 
					lorem vitae, vulputate nulla. Duis sed purus fermentum, ultrices risus ut, consectetur 
					quam. Proin eleifend porttitor libero quis mollis. Donec at luctus libero. Donec tortor 
					diam, efficitur nec ligula vitae, venenatis suscipit nunc. Fusce dignissim, leo at pharetra 
					consectetur, justo dui mattis tortor, sed tincidunt elit ante in nulla. </p>
					<p><b>III.</b></p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu ligula libero. 
					Praesent posuere leo eu suscipit dignissim. Proin porttitor neque vitae augue malesuada
					, sed pharetra justo placerat. Donec vehicula metus eget aliquet luctus. 
					uisque consectetur blandit urna. Donec quam diam, consectetur in venenatis eget, aliquet 
					at massa. Nulla egestas nec tellus ut tristique. Nulla sit amet leo elementum, posuere 
					lorem vitae, vulputate nulla. Duis sed purus fermentum, ultrices risus ut, consectetur 
					quam. Proin eleifend porttitor libero quis mollis. Donec at luctus libero. Donec tortor 
					diam, efficitur nec ligula vitae, venenatis suscipit nunc. Fusce dignissim, leo at pharetra 
					consectetur, justo dui mattis tortor, sed tincidunt elit ante in nulla. </p>
					<p><b>IV.</b></p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu ligula libero. 
					Praesent posuere leo eu suscipit dignissim. Proin porttitor neque vitae augue malesuada
					, sed pharetra justo placerat. Donec vehicula metus eget aliquet luctus. 
					uisque consectetur blandit urna. Donec quam diam, consectetur in venenatis eget, aliquet 
					at massa. Nulla egestas nec tellus ut tristique. Nulla sit amet leo elementum, posuere 
					lorem vitae, vulputate nulla. Duis sed purus fermentum, ultrices risus ut, consectetur 
					quam. Proin eleifend porttitor libero quis mollis. Donec at luctus libero. Donec tortor 
					diam, efficitur nec ligula vitae, venenatis suscipit nunc. Fusce dignissim, leo at pharetra 
					consectetur, justo dui mattis tortor, sed tincidunt elit ante in nulla. </p>

				</div>
			</div>
			<!-- Content end -->
		
			<!----------- Footer ------------>
			<footer class="footer" style="position:absolute; bottom: 20px;">
				<div class="container">
						<div class="row">
							<div class="col-md-4 footer-brand animated fadeInLeft">
								<h2 style="margin-top: 10px;">
									<img src="<c:url value='/static/images/logo.png'/>" style="width: 80px; height: 80px;">
								</h2>
								<p>© 2016 MyLogo, All rights reserved</p>
							</div>
							<div class="col-md-4 footer-nav animated fadeInUp" style="width: 270px;">
								<h4>Menu</h4>
								<div class="col-md-10" style="padding-left: 0px;">
									<ul class="list">
										<li><a href="${aboutUrl}">About Me</a></li>
										<li>
											<c:url var="termsUrl" value="/termsandconditions" />
											<a href="${termsUrl}">Terms & Condition</a>
										</li>
										<li>
											<c:url var="privacyUrl" value="/privacy" />
											<a href="${privacyUrl}">Privacy Policy</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="col-md-3 footer-social animated fadeInDown">
								<h4>Follow Me</h4>
								<ul>
									<li><a href="#">Facebook</a></li>
									<li><a href="#">Twitter</a></li>
									<li><a href="#">Instagram</a></li>
								</ul>
							</div>
							<div class="col-md-2 footer-ns animated fadeInRight">
								<h4>
									Email Me
									<p>
									<div class="input-group">
										<a
											href="mailto:dragan.sorinvladut@gmail.com?Subject=Hello%20again"
											target="_top"><span class="glyphicon glyphicon-envelope"></span></a>
									</div>
									</p>
								</h4>
							</div>
						</div>
					</div>
			</footer>
		</div>
	</div>
</body>

</html>