<%@page import="entities.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="dao.CategoriesDao"%>
<%@page import="entities.Users"%>
<% Users u2= (Users)session.getAttribute("current_user"); %>
<nav class="navbar navbar-expand-lg bg-body-tertiary"
	data-bs-theme="dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="/TechBlog">TechBlog</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="/TechBlog">Home</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> Categories </a>
					<ul class="dropdown-menu">
					
					<%
					CategoriesDao dao2=new CategoriesDao(ConnectionProvider.main());
					ArrayList<Categories>allCategories=dao2.getAllCategories();
					for(Categories c:allCategories){
					%>
						<li><a class="dropdown-item" href="?category=<%=c.getCategory_id()%>"><%=c.getCategory_name() %></a></li>
						<%} %>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="/TechBlog">All Posts</a></li>
					</ul></li>
				<%if(u2==null){
					out.print("<li class=\"nav-item\"><a class=\"nav-link\" href=\"login.jsp\">Log in</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"register.jsp\">Register</a></li>");
					
				}else{
					out.print("<li class=\"nav-item\"><a class=\"nav-link \" href=\"profile.jsp\">Profile</a></li><li class=\"nav-item\"><a class=\"nav-link \" href=\"LogoutServlet\">Log Out</a></li>");
				} %>
				
				<%if(u2!=null){ %>
				<li class="nav-item"><a class="nav-link"
					aria-current="page" href="post_blog.jsp">Create Post</a></li>
				<%} %>
				
			</ul>
			<form action="search.jsp" class="d-flex" role="search">
				<input name="search" class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
		</div>
	</div>
</nav>