<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<style>
	/* ---------- Reset ---------- */
	* {
	    box-sizing: border-box;
	    margin: 0;
	    padding: 0;
	    font-family: Arial, Helvetica, sans-serif;
	    color: #333;
	}

	/* ---------- Main Container ---------- */
	main {
	    margin: 60px auto;
	    max-width: 800px;
	    background-color: #ffe4e8;
	    padding: 30px;
	    border-radius: 12px;
	    box-shadow: 0 6px 15px rgba(0,0,0,0.1);
	}

	/* ---------- Product Name ---------- */
	main > p {
	    text-align: center;
	    color: #c0392b;
	    font-size: 26px;
	    font-weight: bold;
	    margin-bottom: 25px;
	}

	/* ---------- Image ---------- */
	.img {
	    width: 300px;
	    height: 300px;
	    margin: 0 auto 30px auto;
	    border-radius: 10px;
	    overflow: hidden;
	    border: 1px solid #ddd;
	}

	/* ---------- Details Section ---------- */
	.details {
	    display: grid;
	    grid-template-columns: repeat(3, 1fr);
	    gap: 20px;
	    align-items: center;
	    margin: 0 auto;
	    max-width: 600px;
	    font-size: 18px;
	}

	/* ---------- Text Colors ---------- */
	.details p {
	    color: #2c3e50;
	    font-weight: 600;
	}

	.details label {
	    color: #16a085;
	    font-weight: bold;
	}

	/* ---------- Inputs & Select ---------- */
	select {
	    color: #2980b9;
	    font-weight: bold;
	}

	input[type="number"] {
	    color: #27ae60;
	    font-weight: bold;
	}

	input[readonly] {
	    background-color: #f3f3f3;
	}

	/* ---------- Button ---------- */
	button {
	    grid-column: span 3;
	    padding: 12px;
	    background-color: #27ae60;
	    border: none;
	    border-radius: 25px;
	    cursor: pointer;
	    transition: all 0.3s ease;
	}

	button:hover {
	    background-color: #1e8449;
	}

	/* ---------- Link ---------- */
	button a {
	    color: white;
	    text-decoration: none;
	    font-size: 18px;
	    font-weight: bold;
	    display: block;
	}

	/* ---------- Responsive ---------- */
	@media (max-width: 600px) {
	    .details {
	        grid-template-columns: 1fr;
	        text-align: center;
	    }

	    button {
	        grid-column: span 1;
	    }

	    .img {
	        width: 220px;
	        height: 220px;
	    }
	}
	</style>

</head>
<body>
	<main>
		<p align='center' style='color:red;font-size:20px'>Name :${product.getName()}</p>
	<div class='img'><img style='width:100%;height:100%' src="/admin/pimage/${product.getId()}" alt="..."></div>
	<div class="details">
				
				<p>Price : ${product.getPrice()} RS</p>
				<p>Quantity:<select id='quantity' onchange='fun()'>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
								</select></p>
				<p>discount : ${product.getDiscount()}%</p>
				<label>totalprice:<input id='total' type='number' value='' disabled /></label>
				<button><a href='/cart/${product.getId()}/1/' id='a'>ADD TO CART</a></button>	
			</div>
			
	</main>
	<script>
		var a=document.getElementById('a');
		var q=document.getElementById('quantity').value;
		var total;
		var discountprice= ${product.getPrice()}*${product.getDiscount()}/100;
					total=${product.getPrice()}*q-discountprice
					document.getElementById('total').value=total;
					a.href="/cart?pid=${product.getId()}&quantity="+q+"&price="+total;
		function fun(){
			q=document.getElementById('quantity').value;
			var disprice=discountprice*q;
			total=${product.getPrice()}*q-disprice;
			document.getElementById('total').value=total;
			a.href="/cart?pid=${product.getId()}&quantity="+q+"&price="+total;
		}
	</script>
</body>
</html>