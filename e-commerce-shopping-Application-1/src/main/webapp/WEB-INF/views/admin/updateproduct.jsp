<%@ page import='java.util.List' %>
<%@ page import='com.e_commerce.models.Product' %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
<style>
	body{
		background-image:url('/img/ecom3.jpg');
		background-size:cover;
		width:100vw;
		height:100vh;
		box-sizing:border-box;
	}
	.form{
		margin:0 50%;
		transform:translatex(-300px);
		padding:50px;
		width:500px;
		background-color:rgba(0,0,0,0.7);
		border:white solid;
	}
	.in{
		display:inline-block;
		padding:5px;
		width:45%;
		margin-bottom:10px;
	}
	input:not([type='submit']),select,textarea{
		background-color:transparent;
		border:1px solid white;
		width:100%;
		height:40px;
		border-radius:5px;
		color:white;
		font-size:20px;;
		font-weight:bold;
	}
	option{
		background-color:gray;
	}
	.email{
		display:block;
		margin-bottom:10px;
		width:95%;
	}
	
	label{
		display:inline-block;
		font-size:22px;
		margin-bottom:5px;
		color:white;
	}
	
	input[type='submit']{
			width:100%;
			height:40px;
			border-radius:20px;
			background-color:blue;
			color:white;
			font-size:20px;
		}
	input[type='submit']:hover{
		background-color:white;
				color:blue;
	}
</style>
</head>
<body>
	<h1 align='center' style="color:red">Add Product</h1>
	<div class='form'>
		<p align='center' style='color:green'>${pmessage}</p>
	<form action='/admin/updateproduct' method='post' enctype='multipart/form-data' >
		<div class='email'><label for="id">ID Of Product</label>
		<input type="text" id='id' name='id' value=${product.getId()} readonly/></div>
		<div class='in'><label for="name">Product Name</label>
		<input type="text" id='name' name='name' value=${product.getName()} required/></div>
		<div class='in'><label for="category">Catagory</label>
		<select id='category' name='category' required >
			<option></option>
			<% List<String> catname=(List<String>) request.getAttribute("catnames");
				for(String s: catname) { %>
					<option > <%= s %> </option>
			<%}%>
		</select>
		</div>
		<div class='email'><label for="description">Description Of Product</label>
		<textarea id='description' name='description' required>${product.getDescription()}</textarea></div>
		<div class='in'><label for="price">Price Of the Product</label>
		<input type="text" id='price' name='price' value=${product.getPrice()} required /></div>
		<div class='in'><label for="discount">Discount</label>
		<input type="text" id='discount' name='discount' value=${product.getDiscount()} required/></div>
		<div class='in'><label for="discountPrice">Max Discount Price</label>
		<input type="text" id='discountPrice' name='discountPrice' value=${product.getDiscountPrice()} required/></div>
		<div class='in'><label for="stock">Stock Of The Product</label>
		<input type="text" id='stock' name='stock' value=${product.getStock()} required/></div>
		<div class='email'><label for="image">Image Of Product</label>
		<input type="file" id='image' name='file' /></div>
		<input type='submit' value='update Product'>
	</form>
	</div>
</body>
</html>