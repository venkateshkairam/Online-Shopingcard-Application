<%@ page import='java.util.List' %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<style>
	main{
		background-image:url('/img/ecom3.jpg');
		background-size:cover;
		background-repeat:no-repeat;
		box-sizing:border-box;
		color:#f8f9fa; /* default text color */
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
		color:#ffffff; /* white */
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

	/* Footer */
	footer{
		background-color:#6c757d;
		color:#ffffff;
	}

	/* Form container */
	.form{
		margin:0 50%;
		transform:translatex(-300px);
		padding:50px;
		width:500px;
		background-color:rgba(200,250,200,0.5);
		border:2px solid #ffffff;
		color:#ffffff;
	}

	/* Labels */
	label{
		display:inline-block;
		font-size:30px;
		margin:5px 0px;
		color:red;
	}

	/* Inputs */
	input:not([type='submit']), select, textarea{
		background-color:transparent;
		border:1px solid blue;
		width:100%;
		height:40px;
		border-radius:5px;
		color:black;
		font-size:20px;
		font-weight:bold;
	}

	option{
		background-color:#495057;
		color:#ffffff;
	}

	/* Submit button */
	input[type='submit']{
		width:100%;
		height:40px;
		border-radius:20px;
		background-color:#0d6efd; /* blue */
		color:#ffffff;
		font-size:20px;
		border:none;
	}
	input[type='submit']:hover{
		background-color:#ffffff;
		color:#0d6efd;
	}

	/* Headings & messages */
	h1{
		color:#dc3545; /* red */
	}
	p{
		color:#28a745; /* green success text */
	}
</style>
<body onload="document.getElementById('description').innerText=''">
	<nav>
				<ul>
					<li><a href='/admin/'>Home</a></li>
					<li><a href='/admin/addproduct'>Add Product</a></li>
					<li><a href='/admin/addcatagory'>Add Category</a></li>
					<li><a href='/admin/viewcatagory'>View Category</a></li>
					<li><a href='/admin/viewproduct'>View Product</a></li>
					<div class="login">
						<li><h2 style='color:white'>Admin Id: <%= session.getAttribute("adminId") %></h2></li>
						<li><h2><a href="/admin/logout">LogOut</a></h2></li>
					</div>
				</ul>
			</nav>
		<main>
	<h1 align='center' style="color:red">Add Product</h1>
	<div class='form'>
		<p align='center' style='color:green'>${pmessage}</p>
	<form action='saveproduct' method='post' enctype='multipart/form-data' >
		<div class='in'><label for="name">Product Name</label>
		<input type="text" id='name' name='name'/></div>
		<div class='in'><label for="category">Catagory</label>
		<select id='category' name='category' >
			<option>Select Catagory</option>
			<% List<String> catname=(List<String>) request.getAttribute("catnames");
				for(String s: catname) { %>
					<option > <%= s %> </option>
			<%}%>
		</select>
		</div>
		<div class='email'><label for="description">Description Of Product</label>
		<textarea id='description' name='description' required>${product.getDescription()}</textarea></div>
		<div class='in'><label for="price">Price Of the Product</label>
		<input type="text" id='price' name='price' /></div>
		<div class='in'><label for="discount">Discount</label>
		<input type="text" id='discount' name='discount' /></div>
		<div class='in'><label for="discountPrice">Max Discount Price</label>
		<input type="text" id='discountPrice' name='discountPrice' /></div>
		<div class='in'><label for="stock">Stock Of The Product</label>
		<input type="text" id='stock' name='stock' /></div>
		<div class='email'><label for="image">Image Of Product</label>
		<input type="file" id='image' name='file' /></div>
		<input type='submit' value='Add Product'>
	</form>
	</div>
	</main>
</body>
<style>
</style>
</html>