<%@page import="entities.Blogs"%>
<%@page import="dao.BlogsDao"%>
<%@page import="dao.CommentsDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%
int start = 0;
int pageNo = 0;
int amount=3;
if (request.getParameter("page") != null) {
	pageNo = Integer.parseInt(request.getParameter("page")) - 1;
}
start = pageNo * 3;
String search=request.getParameter("search");
int categoryId=0;
BlogsDao dao = new BlogsDao(ConnectionProvider.main());
CategoriesDao catDao = new CategoriesDao(ConnectionProvider.main());
ArrayList<Blogs> AllBlogs = dao.getPostBySearch(search,start,amount);
int count=dao.countPostOfSearch(search);

%>
<title><%=search %> - <%=count %></title>
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css' />
<script src="https://kit.fontawesome.com/fa8c3d741e.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="navbar.jsp"%>
	
	
	<div class="container">
	<h3 class="mt-2">Result for "<%=search %>" Found : <%=count %></h3>
		<div class="row gap-3 justify-content-center mt-4">



			<%
			CommentsDao commentsDao=new CommentsDao(ConnectionProvider.main());
			if(AllBlogs.size()==0)out.print("<h2>No Post Found</h2>");
			for (Blogs b : AllBlogs) {
			%>




			<div class="card text-bg-light mb-3" style="max-width: 18rem;">
				<div class="card-header">
					<div class="d-flex justify-content-between align-items-center">
						<p class="mb-0 inline"><%=catDao.getCategoryById(b.getBlog_category())%></p>
						<i class=" fa fa-comment"> <%=commentsDao.countComment(b.getBlog_id())%></i>
					</div>
				</div>
				<div class="card-body">
					<h5 class="card-title fs-3"><%=b.getBlog_title()%></h5>
					<div class="d-flex justify-content-between">
						<p>
							<i class="fa-solid fa-calendar-days"></i> <span class="fs-6">
								<%
								Timestamp ts = b.getBlog_date();
								SimpleDateFormat formatter = new SimpleDateFormat("EEE, d MMM yyyy hh:mm a");
								out.print(formatter.format(ts));
								%>
							</span>
						</p>
						<p>
							<i class="fa-regular fa-clock"></i> <span class="fs-6"> <%
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
					<p class="card-text">
						<%
						if (b.getBlog_content().length() > 300) {
							out.print(b.getBlog_content().substring(0, 300));
						} else
							out.print(b.getBlog_content());
						%>
						...
						<a href="single_post.jsp?post_id=<%=b.getBlog_id()%>"><button class="btn btn-primary inline fs-6 p-1">Read More</button></a>
					</p>
				</div>
			</div>


			<%
			}
			%>

		</div>

		<nav aria-label="...">
			<ul class="pagination">
				<li
					class="page-item <%if (pageNo == 0)
	out.print("active disabled");%>"><a
					class="page-link" href="?page=<%=pageNo%>&search=<%=search%>" tabindex="-1">Previous</a></li>
				<%
				for (int i = 1; i <= Math.ceil((float) count / amount); i++) {
				%>

				<li class="page-item"><a
					class="page-link <%if (pageNo == i - 1)
	out.print("active disabled");%>"
					href="?page=<%=i%>&search=<%=search%>"><%=i%></a></li>
				<%
				}
				%>
				<li
					class="page-item <%if (pageNo + 1 == (int) Math.ceil((float) count / amount))
	out.print("active disabled");%>"><a
					class="page-link" href="?page=<%=pageNo + 2%>&search=<%=search%>">Next</a></li>
			</ul>
		</nav>
	</div>
	
	
</body>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
	integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
	crossorigin="anonymous"></script>
</html>