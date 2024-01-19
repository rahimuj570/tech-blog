
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="dao.CategoriesDao"%>
<%@page import="entities.Blogs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="dao.BlogsDao"%>
<%
int uid = 0;
int start = 0;
if (request.getParameter("start") != null) {
	start = Integer.parseInt(request.getParameter("start"));
}
if (request.getParameter("uid") != null) {
	uid = Integer.parseInt(request.getParameter("uid"));
}

BlogsDao dao = new BlogsDao(ConnectionProvider.main());
int amount = 3;
ArrayList<Blogs> allBlogs = dao.getPostByUserId(uid, start, amount);
CategoriesDao catDao = new CategoriesDao(ConnectionProvider.main());
for (Blogs b : allBlogs) {
%>
<div class="col mb-2">
	<div class="card text-bg-light mb-3" style="max-width: 18rem;">
		<div class="card-header">
			<div class="d-flex justify-content-between align-items-center">
				<p class="mb-0 inline"><%=catDao.getCategoryById(b.getBlog_category())%></p>
				<i class=" fa fa-comment"> 20</i>
			</div>
		</div>
		<div class="card-body">
			<h5 class="card-title fs-3">
				<a class="link text-decoration-none"
					href="single_post.jsp?post_id=<%=b.getBlog_id()%>"><%=b.getBlog_title()%></a>
			</h5>
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

		</div>
	</div>
</div>
<%
}
%>