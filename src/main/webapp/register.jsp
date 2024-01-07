<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% if(session.getAttribute("current_user")!=null){
	response.sendRedirect("/TechBlog");
}; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css' />
	<script src="https://kit.fontawesome.com/fa8c3d741e.js" crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container my-5">
		<div class="row">
			<div class="col">

				<div class="card text-primary" data-bs-theme="dark">
					<div class="card-header">Registration</div>
					<div class="card_body">
						<form class="row g-3 p-5" action="RegisterServlet" method="post" id="reg_form">
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									name="email" type="email" class="form-control" id="inputEmail4">
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Password</label>
								<input required name="password" type="password" class="form-control"
									id="inputPassword4">
							</div>
							<div class="col-6">
								<label for="inputAddress" class="form-label">Name</label> <input
									name="name" type="text" class="form-control" id="inputAddress">
							</div>
							<div class="col-6">
								<label for="about" class="form-label">About Me</label>
								<textarea name="about" type="text" class="form-control"
									id="inputAddress"></textarea>
							</div>

							<div class="form-check">
								<input class="form-check-input" type="radio" name="gender"
									id="gender" value="male" checked> <label
									class="form-check-label" for="exampleRadios1"> Male </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gender"
									id="gender" value="female"> <label
									class="form-check-label" for="exampleRadios2"> Female </label>
							</div>
							<div class="form-check form-switch">
								<input name="check_box" class="form-check-input" value="yes" type="checkbox"
									id="check_box"> <label
									class="form-check-label" for="flexSwitchCheckDefault">Agree with all Terms ans Condition.</label>
							</div>
							<div class="col-12">
								<button type="submit" class="btn btn-primary">Sign in <i id="reg-loader" class="d-none fa-solid fa-arrows-rotate fa-spin"></i></button>
							</div>
						</form>
					</div>
				</div>
			</div>


		</div>
	</div>

	<%@include file="footer.jsp"%>