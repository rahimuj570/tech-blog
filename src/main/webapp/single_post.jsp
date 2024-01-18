<%@page import="dao.LikesDao"%>
<%@page import="entities.Comments"%>
<%@page import="dao.CommentsDao"%>
<%@page import="dao.UsersDao"%>
<%@page import="entities.Blogs"%>
<%@page import="dao.BlogsDao"%>
<%@page import="java.time.Year"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="NotFound404.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%
LikesDao likesDao=new LikesDao(ConnectionProvider.main());
int post_id = Integer.parseInt(request.getParameter("post_id"));
BlogsDao singleBlogDao = new BlogsDao(ConnectionProvider.main());
Blogs single_blog = singleBlogDao.getSinglePost(post_id);
%>
<title><%=single_blog.getBlog_title()%></title>
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css' />
<script src="https://kit.fontawesome.com/fa8c3d741e.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="navbar.jsp"%>




	<div style="background: url(cool-bg.png); background-size: cover;"
		class="card text-bg-dark">
		<div class="px-5 py-3">
			<h5 class="card-title"><%=single_blog.getBlog_title()%></h5>
			<p class="card-text"><%=single_blog.getBlog_content()%></p>
			<p class="card-text">
				<small>Posted on <%=single_blog.getBlog_date()%><br />Posted
					by <%
				CommentsDao dao = new CommentsDao(ConnectionProvider.main());
				UsersDao udao = new UsersDao(ConnectionProvider.main());
				Users u = udao.getUserPublicById(single_blog.getBlog_author());
				out.print(u.getUser_name());
				%></small>
			</p>
			<div class="d-flex gap-3">
				<p>

					<%
				int isLiked=0;
				int likeCount=likesDao.countLikesOfBlog(single_blog.getBlog_id());
				if(u2!=null)isLiked=likesDao.myLikeStatus(u2.getUser_id(), single_blog.getBlog_id());
				%>
					<i id="like_btn"
						class="fa-regular <%=isLiked==0?"fa-thumbs-up":"fa-thumbs-down" %>"></i>
					<span id="like_count"><%=likeCount %></span>
				</p>
				<p>
					<i class="fa-regular fa-comment"></i>
					<%=dao.countComment(single_blog.getBlog_id())%>
				</p>
			</div>



			<!-- COMMENT START -->
			<div class="container mt-2 py-5">
				<div class="row d-flex justify-content-center">
					<div class="col-md-12 col-lg-10 col-xl-8">
						<div class="card">


							<%
							ArrayList<Comments> allComments = dao.getAllCommentsOfBlog(single_blog.getBlog_id());
							for (Comments c : allComments) {
								Users user = udao.getUserPublicById(c.getUser_id());
							%>

							<div class="card-body">
								<div class="d-flex flex-start align-items-center">

									<%
									if (user.getUser_dp().isBlank()) {
									%>
									<img src="https://robohash.org/<%=user.getUser_name()%>>"
										alt="avatar" width="60" height="60"
										class="rounded-circle shadow-1-strong me-3">
									<%
									} else {
									%>
									<img
										src="<%out.print("/" + "TechBlog/" + user.getUser_dp());%>"
										alt="avatar" width="60" height="60"
										class="rounded-circle shadow-1-strong me-3">

									<%
									}
									%>

									<div>
										<h6 class="fw-bold text-primary mb-1"><%=user.getUser_name()%></h6>
										<p class="text-muted small mb-0">
											Shared publicly -
											<%=c.getComment_date()%>
										</p>
									</div>
								</div>

								<p class="mt-3 mb-4 pb-2"><%=c.getContent()%>
								</p>

							</div>

							<%
							}

							if (u2 == null)
							out.print("<center><h3>Login Required For Comment</h3></center>");
							else {
							%>
							<div class="card-footer py-3 border-0"
								style="background-color: #f8f9fa;">
								<div class="d-flex flex-start w-100">

									<%
									if (u2.getUser_dp().isBlank()) {
									%>
									<img src="https://robohash.org/<%=u2.getUser_name()%>>"
										alt="avatar" width="40" height="40"
										class="rounded-circle shadow-1-strong me-3">
									<%
									} else {
									%>
									<img src="<%out.print("/" + "TechBlog/" + u2.getUser_dp());%>"
										alt="avatar" width="40" height="40"
										class="rounded-circle shadow-1-strong me-3">

									<%
									}
									if(single_blog.getBlog_comment_status().equals("true")){
									%>
									<form action="CommentsServlet" method="post"
										class="form-outline w-100">
										<textarea name="comment" required class="form-control"
											id="comment" rows="4" style="background: #fff;"></textarea>
										<input type="hidden" value="<%=single_blog.getBlog_id()%>"
											name="blog_id"></input>
										<div class="float-end mt-2 pt-1">
											<button type="submit" class="btn btn-primary btn-sm">Post
												comment</button>
											<button onclick=document.getElementById('comment').value=''
												type="button" class="btn btn-outline-primary btn-sm">Clear</button>
										</div>
									</form>
									<%}else out.print("<h3>Comment is not allowed for this post</h3>"); %>
								</div>
							</div>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>





	<p class="w-full bg-primary text-center text-white">
		&copy;<%
		out.print(Year.now());
		%>
	</p>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
	integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
	crossorigin="anonymous"></script>

<script type="text/javascript">
	let like_btn=document.getElementById('like_btn');
	like_btn.addEventListener('click',()=>{
		let blogId=<%=single_blog.getBlog_id()%>
		const ajx=new XMLHttpRequest();
		ajx.onreadystatechange=function(){
			if(this.readyState==4 && this.status==200){
				if(this.responseText==="unauthorized")alert("Need Login First!")
				else{
						let prevLikeCount=document.getElementById("like_count").innerText-'0';
					if(like_btn.classList.replace('fa-thumbs-up','fa-thumbs-down')){
						document.getElementById("like_count").innerText=prevLikeCount+1;
					}else{
						document.getElementById('like_btn').classList.replace('fa-thumbs-down','fa-thumbs-up') 
						document.getElementById("like_count").innerText=prevLikeCount-1;
					}
				}
			}
		}
		ajx.open('POST','AddLikesServlet',true);
		ajx.setRequestHeader("Content-type","application/x-www-form-urlencoded")
		ajx.send("blog_id="+blogId);
	})
	
	
	</script>
</html>