<%@page import="helper.ConnectionProvider"%>
<%@page import="dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css' />
<script src="https://kit.fontawesome.com/fa8c3d741e.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container my-5" data-bs-theme="dark">
		<div class="row ">
			<div class="col-md-4 offset-md-4">
				<div class="card border-primary mb-3" style="max-width: 18rem;">
					<div class="card-header">Login</div>
					<div class="card-body text-primary">
						<form id="login_form">
							<div class="row mb-3">
								<label for="inputEmail3" class=" col-form-label">Email</label>
								<div class="col-sm-10">
									<input type="email" name="email" required class="form-control"
										id="inputEmail3">
								</div>
							</div>
							<div class="row mb-3">
								<label for="inputPassword3" class="col-form-label">Password</label>
								<div class="col-sm-10">
									<input name="password" required type="password"
										class="form-control" id="inputPassword3">
								</div>
							</div>
							<button type="submit" class="btn btn-primary">
								Sign in <i id="reg-loader"
									class="d-none fa-solid fa-arrows-rotate fa-spin"></i>
							</button>
						</form>
					</div>
				</div>

			</div>
		</div>

	</div>

	<%@include file="footer.jsp"%>