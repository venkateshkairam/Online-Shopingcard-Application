<%@ page import="com.e_commerce.models.CartProduct" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet"     href="/source/css/bootstrap.min.css">
	<script src="/source/js/bootstrap.bundle.min.js"></script>
	<style>
	/* ---------- Global ---------- */
	* {
	    box-sizing: border-box;
	    font-family: sans-serif;
	}

	body {
	    background-color: #f4f6f9;
	}

	/* ---------- Main Grid ---------- */
	main {
	    margin: 30px auto;
	    max-width: 1200px;
	    display: grid;
	    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	    gap: 25px;
	}

	/* ---------- Cart Card ---------- */
	.chaild {
	    border-radius: 12px;
	    overflow: hidden;
	    box-shadow: 0 6px 12px rgba(0,0,0,0.1);
	    transition: transform 0.3s ease, box-shadow 0.3s ease;
	}

	.chaild:hover {
	    transform: translateY(-5px);
	    box-shadow: 0 30px 18px rgba(0,0,0,0.15);
	}

	/* ---------- Image ---------- */
	.chaild img {
	    height: 180px;
	    width: 100%;
	    object-fit: contain;
	    padding: 10px;
	    background-color: #fff;
	}

	/* ---------- Card Body ---------- */
	.card-body {
	    text-align: center;
	}

	.card-title {
	    font-size: 20px;
	    color: #dc3545;
	    font-weight: bold;
	}

	.card-text {
	    font-size: 18px;
	    font-weight: bold;
	    color: #2c3e50;
	}

	/* ---------- Total Section ---------- */
	center h2 {
	    color: #28a745;
	    font-weight: bold;
	}

	center label {
	    font-size: 18px;
	    font-weight: bold;
	    cursor: pointer;
	}

	center input[type="checkbox"] {
	    transform: scale(1.3);
	    margin-right: 8px;
	}

	/* ---------- Checkout Button ---------- */
	a > button {
	    margin: 25px;
	    width: 300px;
	    height: 60px;
	    background-color: #0d6efd;
	    color: white;
	    font-size: 26px;
	    font-weight: bold;
	    border: none;
	    border-radius: 30px;
	    cursor: pointer;
	    transition: all 0.3s ease;
	}

	a > button:hover {
	    background-color: #084298;
	}

	/* ---------- Empty Cart ---------- */
	h1 {
	    margin-top: 80px;
	    font-weight: bold;
	}

	/* ---------- Responsive ---------- */
	@media (max-width: 768px) {
	    a > button {
	        width: 90%;
	        font-size: 22px;
	    }

	    center h2 {
	        display: block;
	        margin-bottom: 15px;
	    }
	}
	</style>

</head>
<body>
	
	<% 
	double total=0; 
	List<CartProduct> product=(List<CartProduct>) request.getAttribute("products");
		if(product!=null){%>
			<main>
		<% for(CartProduct p:product){ 
			total+=p.getPrice();
			%>
			<div class="card chaild" style="border:solid;">
					        <img src="/admin/pimage/<%=p.getPid() %>" width='200px' height='200px' class="card-img-top" alt="...">
					        <div class="card-body">
					          <h5 class="card-title text-danger" style="font-size: 20px;">Quantity : <%= p.getQuantity() %></h5>
					          <p class="card-text" style="font-weight: bolder;">Price : <%=p.getPrice() %></p>
					        </div>
					      </div>
		<%}%>
		</main>
		<center style='margin:20px 0px'><h2 style='color:green; display:inline; margin-right:50px'>Total=<%=total %></h2><label style='color:red; display:inline;'><input id='cod' onchange='change()' style='margin:5px' type='checkbox' />Cash On Delevery</label></center>
		<center><a id='check' href='/payment/${cartId}/<%= total%>'><button>CHECK OUT</button></a></center>
		<%}
		else{%>
			<center><h1 align='center' style='color:red'>No Cart Is Available</h1></center>
			<%}%>
</body>
<script>
	function change(){
		var check=document.getElementById('check');
		if(check.href == 'http://localhost:8082/payment/${cartId}/<%= total%>')
		{	
			check.href='/buycart/${cartId}/<%= total%>';
		}
		else{
			check.href='/payment/${cartId}/<%= total%>';
		}
	}
	
</script>
</html>