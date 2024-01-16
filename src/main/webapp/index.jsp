
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.CategoriesDao"%>
<%@page import="entities.Blogs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BlogsDao"%>
<%@page import="helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.time.Year"%>
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
		<div class="row gap-3 justify-content-center mt-4">


			<%
			BlogsDao dao = new BlogsDao(ConnectionProvider.main());
			ArrayList<Blogs> AllBlogs = dao.getAllPost();
			CategoriesDao catDao = new CategoriesDao(ConnectionProvider.main());
			for (Blogs b : AllBlogs) {
			%>




			<div class="card text-bg-light mb-3" style="max-width: 18rem;">
				<div class="card-header">
					<div class="d-flex justify-content-between align-items-center">
						<p class="mb-0 inline"><%=catDao.getCategoryById(b.getBlog_category())%></p>
						<i class=" fa fa-comment"> 20</i>
					</div>
				</div>
				<div class="card-body">
					<h5 class="card-title fs-3"><%=b.getBlog_title()%></h5>
					<div class="d-flex justify-content-between">
						<p>
							<i class="fa-solid fa-calendar-days"></i> <span class="fs-6">
								<%
								Timestamp ts = b.getBlog_date();
								SimpleDateFormat formatter = new SimpleDateFormat("EEE, d MMM yyyy hh:mm:ss a");
								out.print( formatter.format(ts));
								%>
							</span>
						</p>
						<p>
							<i class="fa-regular fa-clock"></i> <span class="fs-6">
							
							
							<%
							int j=0;
							for(int i=0;i<b.getBlog_content().length(); i++){
								if(b.getBlog_content().charAt(i)==' '){
									j++;
								}
							}
							out.print((float)j/200+"Min");
							%>
							
							</span>
						</p>
					</div>
					<p class="card-text">
						<%
						if(b.getBlog_content().length()>300){
							out.print(b.getBlog_content().substring(0, 300));
						}else out.print(b.getBlog_content());
						
						%> ...
						<button class="btn btn-primary inline fs-6 p-1">Read More</button>
					</p>
				</div>
			</div>


			<%
			}
			%>

		</div>
	</div>

	<p class="w-full bg-primary text-center text-white">
		&copy;<%
		out.print(Year.now());
		%>
	</p>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
	integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
	crossorigin="anonymous"></script>

<!-- 	<script type="text/javascript">
	
	let ajx=new XMLHttpRequest();
	ajx.onreadystatechange = function() {
		console.log(this.status)
	console.log(this.responseText)
	}
	ajx.open('get','GetAllBlogsServlet',true);
	ajx.setRequestHeader("Content-type",
	"application/x-www-form-urlencoded");
	ajx.send();
	</script> -->
</html>