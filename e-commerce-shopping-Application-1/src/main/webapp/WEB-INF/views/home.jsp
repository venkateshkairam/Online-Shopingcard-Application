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
		nav{
			background-color:rgb(0, 200, 255);
			font-size:20px;
			height:50px;
		}
		li{
			display:inline-block;
			margin:5px;
		}
		nav a{
			color:red;
			text-decoration:none;
		}
		nav a:hover{
			color:white;
		}
		
	.login{
		float:right;
		margin-right: 30px;
	}
	footer{
		background-color: gray;
		color:white;
	}
	.d-block{
	            width:100%;
	            height:300px;
	            margin:auto;
	            border-radius: 20px;

	        }
			#bt{
			            width: 10px;
			            height: 10px;
			            border-radius: 50%;
			            background-color: black;
			        }
			        #bt.active{
			            background-color: black;
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
		.banner{
			margin-top:20px;
		}
		.catagory{
			width:100%;
			display:flex;
			gap:20px;
			overflow-x:scroll;
		}
		.catagory::-webkit-scrollbar {
		  display: none;
		}
		.catagory>a>div{
			width:300px;
		}
		.catagory img{
			width: 100px;
			height:100px;
			border-radius:50%;
		}
		.catagory a{
			text-decoration:none;
		}
		#profile{
			float:right;
		}
		.visible{
			display:none;
			float:right;
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
			<li onclick="fun()">Welcome: <%=session.getAttribute("userName")%></li>
			<li><a href="/logout">LogOut</a></li>
			<li><a href='/showcart/<%=session.getAttribute("userId")%>' >cart [${cartSize}]</a></li>
			<%}else{%>
			
				<li><a href="/login">LOGIN</a></li>
				<li><a href="/register">REGISTER</a></li>	
		<%}%>
		</div>
		</ul>
	</nav>
	<main>
		<section class='benner'>
		<div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
		        <div class="carousel-indicators">
		            <button type="button" id="bt"  data-bs-target="#carouselExample" data-bs-slide-to="0" class="active" aria-label="Slide 1"></>
		            <button type="button" id="bt" data-bs-target="#carouselExample" data-bs-slide-to="1" aria-label="Slide 2"></button>
		            <button type="button" id="bt" data-bs-target="#carouselExample" data-bs-slide-to="2" aria-label="Slide 3"></button>
		          </div>
		        <div class="carousel-inner">
		          <div class="carousel-item active">
		           <div class="img" ><img src="/img/ecom.png" class="d-block" alt="..." style=" "></div>
		          </div>
		          <div class="carousel-item">
		            <img src="/img/ecom1.png" class="d-block" alt="...">
		          </div>
		          <div class="carousel-item">
		            <img src="/img/ecom2.jpg" class="d-block" alt="">
		          </div>
		        </div>
		        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
		          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		          <span class="visually-hidden">Previous</span>
		        </button>
		        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
		          <span class="carousel-control-next-icon" aria-hidden="true"></span>
		          <span class="visually-hidden">Next</span>
		        </button>
		      </div>
	<div>
		</section>
		<h1 align='center'>Catagories</h1>
		
		<%if(((List<Catagory>) request.getAttribute("catagories")).size()!=0){ %>
					<div class='catagory'>
				  <% 
				  	List<Catagory> list = (List<Catagory>) request.getAttribute("catagories");
					for(Catagory item : list){
						 %>
						<a href='/catagorypage/<%=item.getId() %> '>
						<div style="border:none;">
						        <center><img src="/admin/image/<%= item.getId() %>" alt="..."></img></center>
						        <div>
						          <p align="center" style="font-size: 20px; color:red"><%= item.getName() %></p>
						        </div>
						      </div>
							  </a>
					<%}%></div>
					<%}
					 else{%>
						<h1>No Catagories</h1>
				<%}%>
		<h1 align='center'>Products</h1>
		<%if(((List<Product>) request.getAttribute("products")).size()!=0){ %>
			<div class='main'>
		  <% 
		  	List<Product> dataList = (List<Product>) request.getAttribute("products");
			for(Product item : dataList){
				 %>
				<a href='product/<%=item.getId() %> '>
				<div class="card chaild" style="border:sol">
				        <img src="/admin/pimage/<%= item.getId() %>" class="card-img-top" alt="...">
				        <div class="card-body">
				          <h5 align='center' class="card-title text-danger" style="font-size: 20px;">Name : <%= item.getName() %></h5>
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
<script>
</script>
</html>