<%@ page import="java.util.List" %>
<%@ page import="com.e_commerce.models.Product" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet"     href="/source/css/bootstrap.min.css">
  <script src="/source/js/bootstrap.bundle.min.js"></script>
  <style>
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
	/* Navbar */
		nav{
			background-color:#0dcaf0; /* cyan */
			font-size:20px;
			height:50px;
		}

		li{
			display:inline-block;
			margin:5px;
		}

		/* Navigation links */
		a{
			color:blue;
			text-decoration:none;
			font-size:30px;
		}
		a:hover{
			color:#ffc107; /* yellow hover */
		}

		/* Login section */
		.login{
			float:right;
			gap:30px;
			margin-right:20px;
		}
		.login h2{
			display:inline;
			color:#ffffff;
		}
		.login a{
			color:#ffdddd; /* light red */
		}
		.login a:hover{
			color:#ffffff;
		}

		footer{
			background-color: gray;
			color:white;
		}
		.d-block{
		            width:800px;
		            height:200px;
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
			main{
				padding:10%;
					
			}
			
			h1{
				text-align:center;
				color:red;
			}
	
  </style>
</head>
<body>
	<nav>
				<ul>
					<li><a href='/admin/'>Home</a></li>
					<li><a href='/admin/addproduct'>Add Product</a></li>
					<li><a href='/admin/addcatagory'>Add Category</a></li>
					<li><a href='/admin/viewcatagory'>View Category</a></li>
					<li><a href='/admin/viewproduct'>View Product</a></li>
					<div class="login">
						<h2 style='color:white'>Admin Id: <%= session.getAttribute("adminId") %></h2>
						<h2><a href="/admin/logout">LogOut</a></h2>
					</div>
				</ul>
			</nav>
		<section>
			<div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
			        <div class="carousel-indicators">
			            <button type="button" id="bt"  data-bs-target="#carouselExample" data-bs-slide-to="0" class="active" aria-label="Slide 1"></>
			            <button type="button" id="bt" data-bs-target="#carouselExample" data-bs-slide-to="1" aria-label="Slide 2"></button>
			            <button type="button" id="bt" data-bs-target="#carouselExample" data-bs-slide-to="2" aria-label="Slide 3"></button>
			          </div>
			        <div class="carousel-inner">
			          <div class="carousel-item active">
			            <img src="/img/ecom.png" class="d-block" alt="..." style=" ">
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
		</div>
		</section>
	<%if(((List<Product>) request.getAttribute("products")).size()!=0){ %>
	<div class='main'>
  <% 
  	List<Product> dataList = (List<Product>) request.getAttribute("products");
	for(Product item : dataList){
		 %>
		
		<div class="card chaild" style="border:solid;">
		        <img src="pimage/<%= item.getId() %>" class="card-img-top" alt="...">
		        <div class="card-body">
		          <h5 class="card-title text-danger" style="font-size: 20px;">Id : <%=item.getId() %></h5>
		          <p class="card-text" style="font-weight: bolder;">Product Name : <%= item.getName() %></p>
				  <p class="card-text" style="font-weight: bolder;">Price : <%=item.getPrice() %></p>
				  <p class="card-text" style="font-weight: bolder;">Discount : <%=item.getDiscount() %></p>
				  <p class="card-text" style="font-weight: bolder;">Available  Quantity : <%=item.getStock()%></p>
				  <a href='pdelete/<%= item.getId() %>'>delete</a>&nbsp <a href='pupdate/<%= item.getId() %>'>Update</a>
		        </div>
		      </div>
			  
	<%}%></div>
	<%}
	 else{%>
		<h1>No products  Available</h1>
<%}%>
</body>
</html>