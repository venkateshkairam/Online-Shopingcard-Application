<%@ page import="java.util.List" %>
<%@ page import="com.e_commerce.models.Product" %>
<%@ page import="com.e_commerce.models.Catagory" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet"     href="/source/css/bootstrap.min.css">
	<script src="/source/js/bootstrap.bundle.min.js"></script>
	<style>
		/* ---------- Navbar ---------- */
		nav {
		    background-color: rgb(0, 200, 255);
		    height: 60px;
		    display: flex;
		    align-items: center;
		    padding: 0 20px;
		}

		nav ul {
		    list-style: none;
		    width: 100%;
		}

		nav li {
		    display: inline-block;
		    margin-right: 20px;
		}

		nav a {
		    color: #b30000;
		    text-decoration: none;
		    font-size: 18px;
		    font-weight: bold;
		}

		nav a:hover {
		    color: white;
		}

		.login {
		    float: right;
		}

					.main{
							margin:20px;
							display:grid;
							grid-template-columns: 1fr 1fr 1fr 1fr;
							gap:20px;
						}
						.chaild>img{
							height: 100px;
							width:100px;
							margin:5px auto;
						}
			.main>a{
				text-decoration:none;
			}
			a{
				color:white;
				text-decoration:none;
			}
		section{
			margin-top:20px;
		}
		/* ---------- Responsive ---------- */
		@media (max-width: 768px) {
		    .main {
		        grid-template-columns: 1fr;
		    }

		    a > button {
		        width: 90%;
		        font-size: 24px;
		    }
		}
	</style>
</head>
<body>
	<nav>
				<ul>
					<li><a href='/'>Home</a></li>
					<li><a href="/products">Products</a></li>
					<li><a href="">All Category</a></li>
					<div class="login">
					<% if(session.getAttribute("userName")!=null){%>
					<li>Name: <%=session.getAttribute("userName")%></li>
					<li><a href="/logout">LogOut</a></li>
					<%}else{%>
					
						<li><a href="/login">LOGIN</a></li>
						<li><a href="/register">REGISTER</a></li>	
				<%}%>
				</div>
				</ul>
			</nav>
	<main>
		<h1 align='center'>${catagoryName}</h1>
		<%if(((List<Product>) request.getAttribute("products")).size()!=0){ %>
			<div class='main'>
		  <% 
		  	List<Product> dataList = (List<Product>) request.getAttribute("products");
			for(Product item : dataList){
				 %>
				<a href='/product/<%=item.getId() %> '>
				<div class="card chaild" style="border:solid;">
				        <img src="/admin/pimage/<%= item.getId() %>" class="card-img-top" alt="...">
				        <div class="card-body">
				          <h5 class="card-title text-danger" style="font-size: 20px;">Name : <%= item.getName() %></h5>
						  <p class="card-text" style="font-weight: bolder;">Price : <%=item.getPrice() %></p>
						  <p class="card-text" style="font-weight: bolder;">Discount : <%=item.getDiscount() %>%</p>
						  <p class="card-text" style="font-weight: bolder;">Available  Quantity : <%=item.getStock()%></p>
				        </div>
				      </div>
					  
			<%}%></div></a>
			<%}
			 else{%>
				<h1>No products  Available</h1>
		<%}%>
	</div>
	</main>
	<center><footer>E-Com Apllication</footer></center>
</body>
</html>