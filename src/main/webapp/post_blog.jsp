<%@page import="java.util.ArrayList"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="dao.CategoriesDao"%>
<%@page import="entities.Users"%>
<%@page import="entities.Categories"%>
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
					<div class="card-header">Create Post</div>
					<div class="card_body">
						<form class="row g-3 p-5" id="post_form">
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Title</label> <input
									required name="title" type="text" class="form-control"
									id="inputEmail4">
							</div>
							<div class="col-md-6">
								<label for="about" class="form-label">Content</label>
								<textarea required name="content" type="text"
									class="form-control" id="inputAddress"></textarea>
							</div>
							<div class="col-md-6">
								<select name="category" class="form-select"
									aria-label="Default select example">
									<option value=0 selected>Select Category</option>

									<%
									CategoriesDao catsDao = new CategoriesDao(ConnectionProvider.main());
									ArrayList<Categories> cats = catsDao.getAllCategories();
									for (Categories i : cats) {
									%>
									<option value="<%=i.getCategory_id()%>">
										<%=i.getCategory_name()%></option>
									<%
									}
									%>
								</select>
							</div>

							<div class="form-check form-switch">
								<input name="check_box" class="form-check-input" value="yes"
									type="checkbox" id="check_box"> <label
									class="form-check-label" for="flexSwitchCheckDefault">Allow
									Comment.</label>
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

<script>

document.getElementById("post_form").addEventListener("submit",(e)=>{
	e.preventDefault();
	let title=e.target.title.value;
	let content=e.target.content.value;
	let category=e.target.category.value;
	let check_box=e.target.check_box.checked;
	const ajx=new XMLHttpRequest();
	ajx.onreadystatechange=function(){
		if(this.readyState===4){
			if(this.status===200){
				if(this.responseText==="Must Select A Category."){
					alert("Must Select A Category.");
				}else{
				if(this.responseText=="1"){
					alert("Successfully Post");
				}else{
					alert("Something Went Wrong!")
				}
				}
				console.log("yessssssss");
			}else{
				alert("Server Error!");
			}
		}else{
			console.log("noo from main gate");
		}
	}
	ajx.open("post","AddBlogServlet",true);
	ajx.setRequestHeader("Content-type",
	"application/x-www-form-urlencoded");
	ajx.send("title="+title+"&content="+content+"&category="+category+"&check_box="+check_box);
})
</script>
</html>