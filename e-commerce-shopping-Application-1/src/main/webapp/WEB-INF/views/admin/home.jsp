<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" href="/source/css/bootstrap.min.css">
	<script src="/source/js/bootstrap.bundle.min.js"></script>

	<style>
		/* Navbar */
		nav{
			background-color: #0d6efd; /* blue */
			font-size:20px;
			height:50px;
		}

		/* Navigation list */
		li{
			display:inline-block;
			margin:5px;
		}

		/* Anchor links */
		a{
			color:#ffffff; /* white text */
			text-decoration:none;
		}
		a:hover{
			color:#ffc107; /* yellow on hover */
		}

		/* Login links */
		.login a{
			color:#ffdddd; /* light red */
			font-weight:bold;
		}
		.login a:hover{
			color:#ffffff;
		}

		/* Footer */
		footer{
			background-color:#6c757d;
			color:#ffffff;
		}

		/* Carousel images */
		.d-block{
	        width:800px;
	        height:300px;
	        margin:auto;
	        border-radius:20px;
	    }

	    /* Carousel indicators (buttons) */
		#bt{
	        width:10px;
	        height:10px;
	        border-radius:50%;
	        background-color:#adb5bd; /* gray */
	    }
	    #bt.active{
	        background-color:#0d6efd; /* blue */
	    }

		/* Main section */
		main{
			padding:10%;
			color:#212529; /* dark text */
		}

		/* Login section */
		.login{
			float:right;
			display:flex;
			gap:30px;
			margin-right:20px;
			color:#ffffff;
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
				<h2 style="color:#ffffff">
					Admin Id: <%= session.getAttribute("adminId") %>
				</h2>
				<h2><a href="/admin/logout">LogOut</a></h2>
			</div>
		</ul>
	</nav>

	<section>
		<div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" id="bt" data-bs-target="#carouselExample" data-bs-slide-to="0" class="active"></button>
				<button type="button" id="bt" data-bs-target="#carouselExample" data-bs-slide-to="1"></button>
				<button type="button" id="bt" data-bs-target="#carouselExample" data-bs-slide-to="2"></button>
			</div>

			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/img/ecom.png" class="d-block" alt="">
				</div>
				<div class="carousel-item">
					<img src="/img/ecom1.png" class="d-block" alt="">
				</div>
				<div class="carousel-item">
					<img src="/img/ecom2.jpg" class="d-block" alt="">
				</div>
			</div>
		</div>
	</section>

	<main>
		<h1 align="center" style="color:#dc3545;">Admin Dashboard</h1>
	</main>

	<center>
		<footer>E-Com Application</footer>
	</center>
</body>
</html>
