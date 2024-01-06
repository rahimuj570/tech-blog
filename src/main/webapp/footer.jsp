<%@page import="java.time.Year"%>

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

<script>
	//for register jsp page
	document.getElementById("reg_form").addEventListener(
			'submit',
			function(e) {
				e.preventDefault();

				document.getElementById("reg-loader").classList
						.remove('d-none');

				let ajx = new XMLHttpRequest();
				ajx.onreadystatechange = function() {
					if(this.readyState==4){
						document.getElementById("reg-loader").classList
						.add('d-none');
						if(this.status==200){
							if(this.responseText=="true"){								
							alert("Successfully Registered!");
							window.location="login.jsp";
							}else{
								alert("Must entry all data")
							}
						}else{
							alert("Something Went wrong!")
						}
					}
				}
				ajx.open("POST", "RegisterServlet", true);
				ajx.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
				ajx.send("name=" + this.name.value + "&about=" + this.about.value
						+ "&email=" + this.email.value + "&password=" + this.password.value
						+ "&check_box=" + this.check_box.checked + "&gender="
						+ this.gender.value);
			});
</script>


<script>
//for login jsp page
document.getElementById("login_form").addEventListener("submit",(e)=>{
	e.preventDefault();
	document.getElementById("reg-loader").classList
	.remove('d-none');
	const ajx=new XMLHttpRequest();
	ajx.onreadystatechange=function(){
		if(this.readyState==4){
			document.getElementById("reg-loader").classList
			.add('d-none');
			if(this.status==200 && this.responseText==="user found"){
				alert("Successfully Signin")
				location="/TechBlog";
			}else{
				alert(this.responseText)
			}
		}
	}
	ajx.open("POST","LoginServlet",true);
	ajx.setRequestHeader("Content-type",
	"application/x-www-form-urlencoded");
	ajx.send("email="+e.target.email.value+"&password="+e.target.password.value);
})

</script>
</html>