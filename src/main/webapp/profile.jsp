<%@page import="dao.UsersDao"%>
<%@page import="dao.LikesDao"%>
<%@page import="dao.CommentsDao"%>
<%@page import="dao.CategoriesDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="entities.Blogs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="dao.BlogsDao"%>
<%@page import="entities.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
Users u =new Users(); 
if(request.getParameter("user")==null){
u=(Users) session.getAttribute("current_user");
}else{
	u=new UsersDao(ConnectionProvider.main()).getUserPublicById(Integer.parseInt(request.getParameter("user")));
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
<script src="https://kit.fontawesome.com/fa8c3d741e.js"
	crossorigin="anonymous"></script>
</head>
<body>

	<%@include file="navbar.jsp"%>

	<section class="h-100 gradient-custom-2">
		<div class="container py-5 h-100">
			<%
			boolean authorized=false;
			if(u2.getUser_id()==u.getUser_id()){
				authorized=true;
			}
			
			if (session.getAttribute("update_fail") != null) {
			%>
			<div class="alert alert-danger" role="alert">Update Failed! <br/> <%=session.getAttribute("update_fail")%></div>
			<%
			}
			%>
			<%
			session.removeAttribute("update_fail");
			%>
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col col-lg-9 col-xl-7">
					<div class="card">
						<div class="rounded-top text-white d-flex flex-row"
							style="background-color: #000; height: 200px;">
							<div class="ms-4 mt-5 d-flex flex-column" style="width: 150px;">

								<%
								if (u.getUser_dp().isBlank()) {
								%>
								<img src="https://robohash.org/<%=u.getUser_name()%>>"
									alt="Generic placeholder image"
									class="img-fluid img-thumbnail mt-4 mb-2"
									style="width: 150px; z-index: 1">
								<%
								} else {
								%>
								<img src="<%out.print("/" + "TechBlog/" + u.getUser_dp());%>"
									alt="Generic placeholder image"
									class="img-fluid img-thumbnail mt-4 mb-2"
									style="width: 150px; z-index: 1">

								<%
								}
								if(authorized){
								%>
								<button data-bs-toggle="modal" data-bs-target="#exampleModal"
									data-bs-whatever="@mdo" type="button"
									class="btn btn-outline-dark" data-mdb-ripple-color="dark"
									style="z-index: 1;">Edit profile</button><%} %>
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
						
						<%
						BlogsDao dao = new BlogsDao(ConnectionProvider.main());
						LikesDao likeDao=new LikesDao(ConnectionProvider.main());
						%>
						
						<div class="p-4 text-black" style="background-color: #f8f9fa;">
							<div class="d-flex justify-content-end text-center py-1">
								<div>
									<p class="mb-1 h5"><%=dao.countPost(u.getUser_id())%></p>
									<p class="small text-muted mb-0">Posts</p>
								</div>
								<div class="px-3">
									<p class="mb-1 h5"><%=likeDao.countLikesOfUser(u.getUser_id()) %></p>
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
							</div>
							<div id="my_post_container" class="row g-2">

								<%
								
								CommentsDao commentsDao=new CommentsDao(ConnectionProvider.main());
								int start = 0;
								int amount = 3;
								ArrayList<Blogs> allBlogs = dao.getPostByUserId(u.getUser_id(), start, amount);
								CategoriesDao catDao = new CategoriesDao(ConnectionProvider.main());
								for (Blogs b : allBlogs) {
								%>

								<div class="col mb-2">
									<div class="card text-bg-light mb-3" style="max-width: 18rem;">
										<div class="card-header">
											<div
												class="d-flex justify-content-between align-items-center">
												<p class="mb-0 inline"><%=catDao.getCategoryById(b.getBlog_category())%></p>
												<i class=" fa fa-comment"> <%=commentsDao.countComment(b.getBlog_id())%></i>
											</div>
										</div>
										<div class="card-body">
											<h5 class="card-title fs-3"><%=b.getBlog_title()%></h5>
											<div class="d-flex justify-content-between">
												<p>
													<i class="fa-solid fa-calendar-days"></i> <span
														class="fs-6"> <%
 Timestamp ts = b.getBlog_date();
 SimpleDateFormat formatter = new SimpleDateFormat("EEE, d MMM yyyy hh:mm a");
 out.print(formatter.format(ts));
 %>
													</span>
												</p>
												<p>
													<i class="fa-regular fa-clock"></i> <span class="fs-6">
														<%
														int j = 0;
														for (int i = 0; i < b.getBlog_content().length(); i++) {
															if (b.getBlog_content().charAt(i) == ' ') {
																j++;
															}
														}
														out.print((float) j / 200 + "Min");
														%>

													</span>
												</p>
											</div>

										</div>
									</div>
								</div>
								<%
								}
								%>
							</div>
							<center>
								<button id="show_more_btn" onclick="showMore()"
									class="text-center btn btn-dark px-4">See More</button>
							</center>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- MODAL=============== -->







<%if(authorized){ %>

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
									Picture:</label> <input name="dp" type="file" class="form-control"
									id="recipient-name">
							</div>


							<div class="form-check form-switch mb-3">
								<input name="clear_dp"
									title="This will delete your current profile picture."
									class="form-check-input" type="checkbox" role="switch"
									id="flexSwitchCheckChecked"> <label
									title="This will delete your current profile picture."
									class="form-check-label" for="flexSwitchCheckChecked">Use
									Default Avatar</label>
							</div>


							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">Name:</label>
								<input name="name" type="text" class="form-control"
									id="recipient-name">
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">Email:</label>
								<input name="email" type="text" class="form-control"
									id="recipient-name">
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">Password:</label>
								<input name="password" type="password" class="form-control"
									id="recipient-name">
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
		</div><%} %>

	</section>
</body>


<!-- LOADER SPINNER STRAT  -->
<div id="loader"
	style="width: 200px; height: 200px; position: fixed; top: 50%; left: 50%;"
	class="spinner-border" role="status">
	<span class="visually-hidden">Loading...</span>
</div>
<!-- LOADER SPINNER END -->



<script>
	let start=3;
	let total=<%=dao.countPost(u.getUser_id())%>
	document.getElementById("loader").style.display="none";
const showMore=(amount)=>{
	document.getElementById("loader").style.display="block";
	if(document.getElementById("my_post_container").childElementCount===total){
		document.getElementById("show_more_btn").disabled=true ;
	}
	const ajx=new XMLHttpRequest();
	ajx.onreadystatechange=function(){
		if(this.readyState==4 && this.status==200){
			let i=document.getElementById("my_post_container").innerHTML;
			document.getElementById("my_post_container").innerHTML=i+this.responseText;
			start+=3;
			document.getElementById("loader").style.display="none";
		}
	}
	ajx.open('get','profile_post.jsp?start='+start+'&uid=<%=u.getUser_id()%>',true);
	ajx.setRequestHeader("Content-type",
	"text/html");
	ajx.send();
}
</script>

</html>