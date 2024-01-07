<%@page import="entities.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="NotFound404.jsp"%>
<%
Users u = (Users) session.getAttribute("current_user");
if (u == null) {
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>
	<%
	out.print(u.getUser_name() + " - Profile");
	%>
</title>
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css' />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

</head>
<body>

	<%@include file="navbar.jsp"%>

	<section class="h-100 gradient-custom-2">
		<div class="container py-5 h-100">
		<% if(session.getAttribute("update_fail")!=null){ %>
			<div class="alert alert-danger" role="alert">A simple danger
				alert check it out!</div>
		<%}%>
		<%  session.removeAttribute("update_fail"); %>
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col col-lg-9 col-xl-7">
					<div class="card">
						<div class="rounded-top text-white d-flex flex-row"
							style="background-color: #000; height: 200px;">
							<div class="ms-4 mt-5 d-flex flex-column" style="width: 150px;">
								<img
									src="<%out.print("/"+"TechBlog/"+u.getUser_dp()); %>"
									alt="Generic placeholder image"
									class="img-fluid img-thumbnail mt-4 mb-2"
									style="width: 150px; z-index: 1">
								<button data-bs-toggle="modal" data-bs-target="#exampleModal"
									data-bs-whatever="@mdo" type="button"
									class="btn btn-outline-dark" data-mdb-ripple-color="dark"
									style="z-index: 1;">Edit profile</button>
							</div>
							<div class="ms-3" style="margin-top: 50px;">
								<h5>
									<%
									out.print(u.getUser_name());
									%>
								</h5>
								<p>
									Email:
									<%
								out.print(u.getUser_email());
								%>
								</p>
								<p>
									Gender:
									<%
								out.print(u.getUser_gender());
								%>
								</p>
								<p>
									Registration Date:
									<%
								out.print(u.getRegistration_date());
								%>
								</p>
							</div>
						</div>
						<div class="p-4 text-black" style="background-color: #f8f9fa;">
							<div class="d-flex justify-content-end text-center py-1">
								<div>
									<p class="mb-1 h5">253</p>
									<p class="small text-muted mb-0">Posts</p>
								</div>
								<div class="px-3">
									<p class="mb-1 h5">1026</p>
									<p class="small text-muted mb-0">Likes</p>
								</div>
							</div>
						</div>
						<div class="card-body p-4 text-black">
							<div class="mb-5">
								<p class="lead fw-normal mb-1">About</p>
								<div class="p-4" style="background-color: #f8f9fa;">
									<p class="font-italic mb-1">
										<%
										out.print(u.getUser_about());
										%>
									</p>
								</div>
							</div>
							<div
								class="d-flex justify-content-between align-items-center mb-4">
								<p class="lead fw-normal mb-0">Recent posts</p>
								<p class="mb-0">
									<a href="#!" class="text-muted">Show all</a>
								</p>
							</div>
							<div class="row g-2">
								<div class="col mb-2">
									<img
										src="https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(112).webp"
										alt="image 1" class="w-100 rounded-3">
								</div>
								<div class="col mb-2">
									<img
										src="https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(107).webp"
										alt="image 1" class="w-100 rounded-3">
								</div>
							</div>
							<div class="row g-2">
								<div class="col">
									<img
										src="https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(108).webp"
										alt="image 1" class="w-100 rounded-3">
								</div>
								<div class="col">
									<img
										src="https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(114).webp"
										alt="image 1" class="w-100 rounded-3">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- MODAL=============== -->









		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Edit
							Profile</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="EditUserServlet" method="post"
							enctype="multipart/form-data">
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">Profile
									Pic:</label> <input name="dp" required type="file" class="form-control"
									id="recipient-name">
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">Name:</label>
								<input name="name" required type="text" class="form-control"
									id="recipient-name">
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">Email:</label>
								<input name="email" required type="text" class="form-control"
									id="recipient-name">
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">Password:</label>
								<input name="password" required type="password"
									class="form-control" id="recipient-name">
							</div>
							<div class="mb-3">
								<label for="message-text" class="col-form-label">About:</label>
								<textarea name="about" class="form-control" id="message-text"></textarea>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Cancel</button>
								<button type="submit" class="btn btn-primary">Edit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>






	</section>
</body>

</html>