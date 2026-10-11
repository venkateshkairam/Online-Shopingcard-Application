
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<style>
	/* ---------- Global ---------- */
	* {
	    box-sizing: border-box;
	    margin: 0;
	    padding: 0;
	    font-family: Arial, Helvetica, sans-serif;
	}

	body {
	    background-color: #f5f5f5;
	}

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

	/* ---------- Main Section ---------- */
	.main {
	    max-width: 1000px;
	    margin: 40px auto;
	    background-color: white;
	    display: grid;
	    grid-template-columns: 1fr 1fr;
	    border-radius: 10px;
	    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
	    padding: 20px;
	}

	/* ---------- Image ---------- */
	.image {
	    display: flex;
	    justify-content: center;
	    align-items: center;
		width : 500px;
		height : 400px; 
	}

	.image img {
	    width: 100%;
		max-width: 100px;
	    height: auto;
	    border-radius: 10px;
	    border: 1px solid #ddd;
		background-color : black;
	}
	.image img:hover{
		width: 150px;
		max-width: 150px;
	}
	/* ---------- Details ---------- */
	.details p {
	    margin-bottom: 15px;
	    font-size: 22px;
	}

	.details textarea {
	    width: 100%;
	    min-height: 120px;
	    font-size: 18px;
	    border: 1px solid #ccc;
	    padding: 10px;
	    resize: none;
	    border-radius: 6px;
	    margin-bottom: 15px;
	}

	/* ---------- Button ---------- */
	a > button {
	    margin: 30px;
	    width: 280px;
	    height: 60px;
	    background-color: green;
	    color: white;
	    font-size: 28px;
	    font-weight: bold;
	    border: none;
	    border-radius: 30px;
	    cursor: pointer;
	    transition: all 0.3s ease;
	}

	a > button:hover {
	    background-color: white;
	    color: green;
	    border: 2px solid green;
	}

	a > button:disabled {
	    background-color: gray;
	    cursor: not-allowed;
	    border: none;
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
	
	<div class='main'>
		<div class="image">
			<img src="/admin/pimage/${product.getId()}" alt="...">
		</div>
		<div class="details">
			<p style='color:green;font-size:30px'>Name :  <span style="color:red">${product.getName()}</span></p>
			<p style='color:green;font-size:30px'>price  :  <span style="color:red">${product.getPrice()}</span></p>
			<p style='color:green;font-size:30px'>discription:</p>
			<textarea style="color:red" disabled>${product.getDescription()}</textarea>
			<p style='color:green;font-size:30px;'>discount  :  ${product.getDiscount()}%</p>	
		</div>
	</div>
	<center><a href='/cartadd/${product.getId()}' ><button <%if(session.getAttribute("userId")==null){%>disabled<%}%>  >ORDER</button></a></center>
</body>
</html>