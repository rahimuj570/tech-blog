<%@page import="dao.UsersDao"%>
<%@page import="entities.Blogs"%>
<%@page import="dao.BlogsDao"%>
<%@page import="java.time.Year"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="NotFound404.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%
int post_id=Integer.parseInt(request.getParameter("post_id"));
BlogsDao singleBlogDao=new BlogsDao(ConnectionProvider.main());
Blogs single_blog=singleBlogDao.getSinglePost(post_id);
%>
<title><%=single_blog.getBlog_title() %></title>
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css' />
<script src="https://kit.fontawesome.com/fa8c3d741e.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="navbar.jsp"%>
	
	
	
	
	<div class="card text-bg-dark">
  <img src="cool-bg.png" class="card-img" alt="...">
  <div class="card-img-overlay">
    <h5 class="card-title"><%=single_blog.getBlog_title() %></h5>
    <p class="card-text"><%=single_blog.getBlog_content() %></p>
    <p class="card-text"><small>Posted on <%=single_blog.getBlog_date() %><br/>Posted by <%
    
    UsersDao udao=new UsersDao(ConnectionProvider.main());
    Users u=udao.getUserPublicById(single_blog.getBlog_author());
    out.print(u.getUser_name());
    
    %></small></p>
  </div>
</div>
	
	
	
	
	
	<p "
		class="w-full bg-primary text-center text-white">
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
</html>