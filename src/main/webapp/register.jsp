<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css' />
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container my-5">
		<div class="row">
			<div class="col">

				<div class="card text-primary" data-bs-theme="dark">
					<div class="card-header">Registration</div>
					<div class="card_body">
						<form class="row g-3 p-5">
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									type="email" class="form-control" id="inputEmail4">
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Password</label>
								<input type="password" class="form-control" id="inputPassword4">
							</div>
							<div class="col-6">
								<label for="inputAddress" class="form-label">Name</label> <input
									type="text" class="form-control" id="inputAddress">
							</div>
							<div class="col-6">
								<label for="about" class="form-label">About Me</label> <textarea
									type="text" class="form-control" id="inputAddress"></textarea>
							</div>

							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="exampleRadios" id="gender" value="male"
									checked> <label class="form-check-label"
									for="exampleRadios1"> Male </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="exampleRadios" id="gender" value="female">
								<label class="form-check-label" for="exampleRadios2">
									Female </label>
							</div>

							<div class="col-12">
								<button type="submit" class="btn btn-primary">Sign in</button>
							</div>
						</form>
					</div>
				</div>
			</div>


		</div>
	</div>

	<%@include file="footer.jsp"%>