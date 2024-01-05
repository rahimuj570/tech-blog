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
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
	Connection con = ConnectionProvider.main();
	%>
	<h1><%=con%></h1>


	<div class="container">
		<div class="row">
			<div class="col-md-3">

				<div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Read</a>
						<a href="#" class="btn btn-primary">Like</a>
						<a href="#" class="btn btn-primary">Comment</a>
					</div>
				</div>

			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>