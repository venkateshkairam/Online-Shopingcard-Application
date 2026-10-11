<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<style>
	body{
		background-image:url('/img/ecom.png');
		background-size:cover;
		background-repeat:no-repeat;
		width:100vw;
		height:100vh;
		box-sizing:border-box;
		padding:30px;
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

	.form{
		margin:0 50%;
		transform:translatex(-300px);
		padding:50px;
		width:500px;
		background-color:rgba(0,0,0,0.3);
		border:white solid 2px;
		box-shadow: 0px 0px 50px green;
	}
	.in{
		display:inline-block;
		padding:5px;
		width:100%;
		margin-bottom:10px;
	}
	input:not([type='submit']){
		background:transparent;
		border:2px solid black;
		width:100%;
		height:40px;
		border-radius:5px;
		color:white;
		font-size:20px;;
		font-weight:bold;
		padding-left:10px;
	}
	label{
		display:inline-block;
		font-size:22px;
		margin-bottom:5px;
		color:white;
	}
	
	input[type='submit']{
		margin-top:30px;
			width:100%;
			height:40px;
			border-radius:20px;
			background-color:blue;
			color:white;
			font-size:20px;
			font-weight:bolder;
		}
	input[type='submit']:hover{
		background-color:white;
		color:blue;
	}
</style>
<body>
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
	<h1 align='center' style="color:black">Add Catagory</h1>
	<div class='form'>
	<h1>${message}</h1>
	<form action='saveCatagory' method='post' enctype="multipart/form-data">
		<div class='in'><label for="fname">Catagory Name</label>
		<input type="text" id='fname' name='name'"/></div>
		<div class='in'><label for="file">Catagory Image</label>
		<input type="file" id='file' name='file'"/></div>
		<input type='submit' value='Add Catagory'>
	</form>
	</div>
</body>
</html>