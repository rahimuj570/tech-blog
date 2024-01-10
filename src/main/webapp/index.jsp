<%@page import="helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TechBlog</title>
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css' />
<script src="https://kit.fontawesome.com/fa8c3d741e.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container">
		<div class="row">
		
		
			<div class="card text-bg-light mb-3" style="max-width: 18rem;">
				<div class="card-header">
					<div class="d-flex justify-content-between align-items-center">
						<p class="mb-0 inline">Header</p>
						<i class=" fa fa-comment"> 20</i>
					</div>
				</div>
				<div class="card-body">
					<h5 class="card-title fs-3">Light card title</h5>
					<div class="d-flex justify-content-between">
						<p>
							<i class="fa-solid fa-calendar-days"></i> <span class="fs-6">22-Dec,2022</span>
						</p>
						<p>
							<i class="fa-regular fa-clock"></i> <span class="fs-6">20min</span>
						</p>
					</div>
					<p class="card-text">
						Some quick example text to build on the card title and make up the
						bulk of the card's content ...
						<button class="btn btn-primary inline fs-6 p-1">Read More</button>
					</p>
				</div>
			</div>


		</div>
	</div>
	</div>

	<%@include file="footer.jsp"%>