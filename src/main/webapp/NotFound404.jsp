<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>404 - Not Found</title>
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css' />
	<script src="https://kit.fontawesome.com/fa8c3d741e.js" crossorigin="anonymous"></script>
</head>
<body>
<center><i style="font-size:80vh" class="w-full fa-solid fa-triangle-exclamation"></i><h2>Something Went Wrong!</h2><p><%=exception %></p><button onclick="history.back()" class="btn-primary btn">Go Back</button></center>
</body>
</html>