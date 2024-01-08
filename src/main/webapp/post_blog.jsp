<%@page import="entities.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
Users u = (Users) request.getAttribute("current_user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Post Blogs</title>
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css' />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="navbar.jsp"%>



	<div class="container my-5">
		<div class="row">
			<div class="col">

				<div class="card text-primary" data-bs-theme="dark">
					<div class="card-header">Registration</div>
					<div class="card_body">
						<form class="row g-3 p-5" action="RegisterServlet" method="post"
							id="reg_form">
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Title</label> <input
									name="title" type="text" class="form-control" id="inputEmail4">
							</div>
							<div class="col-md-6">
								<label for="about" class="form-label">Content</label>
								<textarea name="content" type="text" class="form-control"
									id="inputAddress"></textarea>
							</div>
							<div class="col-md-6">
								<select name="category" class="form-select" aria-label="Default select example">
									<option selected>Select Category</option>
									<option value="1">One</option>
									<option value="2">Two</option>
									<option value="3">Three</option>
								</select>
							</div>

							<div class="form-check form-switch">
								<input name="check_box" class="form-check-input" value="yes"
									type="checkbox" id="check_box"> <label
									class="form-check-label" for="flexSwitchCheckDefault">Allow Comment.</label>
							</div>

							<div class="col-12">
								<button type="submit" class="btn btn-primary">
									Post <i id="reg-loader"
										class="d-none fa-solid fa-arrows-rotate fa-spin"></i>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>


		</div>
	</div>

</body>
</html>