<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Home</title>
		<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
		<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
		<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" />
		
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
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" style="padding-top: 0px;" href="${aboutUrl}"><img
					src="<c:url value='/static/images/logo.png'/>"
					style="width: 50px; height: 50px;">
				</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<c:url var="homeUrl" value="/home" />
					<li class="active"><a href="${homeUrl}">Home</a></li>
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
					<b>Welcome to MyLogo. Help me, help you, in designing the perfect logo for you company.</b> <span style="float: left; margin-right: 10px;"  aria-hidden="true" />
				</div>

				<div style="position: relative; height: 400px;" id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						<li data-target="#carousel-example-generic" data-slide-to="3"></li>
						<li data-target="#carousel-example-generic" data-slide-to="4"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div style="height: 400px;" class="item active">
							<img src="<c:url value='/static/images/franklin_plaza.jpg'/>" alt="franklin plaza hotel logo">
							<div class="carousel-caption">
								 <h3>Franklin Plaza Hotel Logo</h3>
       							 <p>Beatiful logo design for a special hotel.</p>
							</div>
						</div>
						<div style="height: 400px;" class="item">
							<img src="<c:url value='/static/images/bahamasolar.jpg'/>" alt="bahama solar logo">
							<div class="carousel-caption">
								 <h3>Bahama Solar Logo</h3>
       							 <p>A clean and simple design of a logo for solar power company.</p>
							</div>
						</div>
						<div style="height: 400px;" class="item">
							<img src="<c:url value='/static/images/kinetic_lawns.jpg'/>" alt="kinetic lawns logo">
							<div class="carousel-caption">
								 <h3>Kinetic Lawns Logo</h3>
       							 <p>Clean design for a gardening company.</p>
							</div>
						</div>
						<div style="height: 400px;" class="item">
							<img src="<c:url value='/static/images/t2dvls_comp.jpg'/>" alt="the two devils logo">
							<div class="carousel-caption">
								 <h3>The Two Devils Ltd.</h3>
       							 <p>Big companies also want a nice logo to go with their name.</p>
							</div>
						</div>
						<div style="height: 400px;" class="item">
							<img src="<c:url value='/static/images/vira_presentation.jpg'/>" alt="vira software business card">
							<div class="carousel-caption">
								 <h3>Vira Software</h3>
       							 <p>No matter how good you're at programming, you still need a nice logo.</p>
							</div>
						</div>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>

				<div style="margin: 5px 10px 5px 10px; align: center;">

					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu ligula libero. 
					Praesent posuere leo eu suscipit dignissim. Proin porttitor neque vitae augue malesuada
					, sed pharetra justo placerat. Donec vehicula metus eget aliquet luctus. 
					uisque consectetur blandit urna. Donec quam diam, consectetur in venenatis eget, aliquet 
					at massa. Nulla egestas nec tellus ut tristique. Nulla sit amet leo elementum, posuere 
					lorem vitae, vulputate nulla. Duis sed purus fermentum, ultrices risus ut, consectetur 
					quam. Proin eleifend porttitor libero quis mollis. Donec at luctus libero. Donec tortor 
					diam, efficitur nec ligula vitae, venenatis suscipit nunc. Fusce dignissim, leo at pharetra 
					consectetur, justo dui mattis tortor, sed tincidunt elit ante in nulla. 

				</div>
			</div>
			<!----------- Footer ------------>
			<footer class="footer" style="position:absolute; bottom: 20px;">
				<div class="container" style="margin-left: 20px;">
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
	<!-- Content end -->
</body>
</html>