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
		grid-template-columns: 1fr 1fr 1fr 1fr ;
		gap:20px;
	}
	.chaild>img{
		height: 100px;
		width:100px;
		margin:5px auto;
	}
	nav{
				background-color:green;
				font-size:20px;
				height:50px;
			}
			li{
				display:inline-block;
				margin:5px;
			}
		footer{
			background-color: gray;
			color:white;
		}
		.d-block{
		            width:100%;
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
			.login{
				float:right;
				display:flex;
				gap:30px;
				margin-right:20px;
			}		
			.login a{
				color:red;
			}
			a{
				color:red;
				text-decoration:none;
			}
			a:hover{
				color:white;
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
				<li><a href='/'>Home</a></li>
				<li><a href="/products">Products</a></li>
				<li><a href="">All Category</a></li>
				<div class="login">
				<% if(session.getAttribute("userName")!=null){%>
				<li style="color:white">Name: <%=session.getAttribute("userName")%></li>
				<li><a href="/logout">LogOut</a></li>
				<%}else{%>
				
					<li><a href="/login">Loigin</a></li>
					<li><a href="/register">REGISTER</a></li>	
			<%}%>
			</div>
			</ul>
		</nav>
		<main>
	<%if(((List<Product>) request.getAttribute("products")).size()!=0){ %>
	<div class='main'>
  <% 
  	List<Product> dataList = (List<Product>) request.getAttribute("products");
	for(Product item : dataList){
		 %>
		
		 <a href='product/<%=item.getId() %> '>
		 				<div class="card chaild" style="border:solid;">
		 				        <img src="admin/pimage/<%= item.getId() %>" class="card-img-top" alt="...">
		 				        <div class="card-body">
		 				          <h5 align='center' class="card-title text-danger" style="font-size: 20px;">Name : <%= item.getName() %></h5>
		 				        </div>
		 				      </div>
		 					  
		 			<%}%></div></a>
	<%}
	 else{%>
		<h1>No products  Available</h1>
<%}%>
<main>
</body>
</html>