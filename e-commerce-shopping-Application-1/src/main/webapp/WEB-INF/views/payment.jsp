<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Payments</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/source/css/bootstrap.min.css">
<script src="/source/js/bootstrap.min.js"></script>
<style>
	*{
		color:red;
	}
	.row{
		margin-top:10px;
	}
</style>
</head>
<body style="background-color: #E6F9E6;">
	<div class="container">
		<div  style="box-sizing: content-box; margin-top: 30px; margin-left: 200px; width:1200px; margin-right: 2px;">
			<form name="form1" action='' methd='post'class="col-md-6 col-md-offset-3" style="border: 2px solid black; border-radius: 10px; background-color: #33ec9c; padding: 10px;">
				<div style="font-weight: bold;" class="text-center">
					<div class="form-group">
						<img src="/img/images.jpeg" alt="Payment Proceed" height="200px" width='500px' style='border-radius:20px;border:1px solid red' />
						<button onclick="generateQR()">Click for UPI</button><button onclick="generateCard()">Card Payment</button>
					</div>
				</div>
				<div id='content'>
				<div class="row">
					<div class="col-md-12 form-group">
						<label for="last_name">Name of Card Holder</label> <input
							type="text" placeholder="Enter Card Holder Name"
							name="cardholder" class="form-control" id="last_name" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 form-group">
						<label for="last_name">Credit Card Number</label> <input
							type="number" placeholder="4242-4242-4242-4242" name="cardnumber"
							class="form-control" id="last_name" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Expiry Month</label> <input type="number"
							placeholder="MM" name="expmonth" class="form-control" size="2"
							max="12" min="00" id="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Expiry Year</label> <input type="number"
							placeholder="YYYY" class="form-control" size="4" id="last_name"
							name="expyear" required>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-6 form-group">
						<label for="last_name">Enter CVV</label> <input type="number" placeholder="123" class="form-control" size="3" id="last_name" name="expyear" required> <input type="hidden"
							name="amount" value="">

					</div>
					<div class="col-md-6 form-group">
						<label>&nbsp;</label>
						<a href='/buycart/${id}/${price}'><input type="button"  value='pay${price}' class="form-control btn btn-success"></a>
					</div>
				</div>
				</div>
			</form>
		</div>
	 </div>

	<!-- ENd of Product Items List -->
	<script src="/source/js/qr.js"></script>

	<script>
		
		function handlesubmit(event){
			event.preventDefault();
		}
	        function generateQR() {
	            // Paytm generates QR codes for merchant payments, you can replace with your actual Paytm merchant ID or payment link
	            var paytmURL = "paytmqr://paytm.com/pay?amount=2000&receiver=6301743694";  // For Paytm App on mobile
	            // Clear any previous QR code
	            document.getElementById("content").innerText = "";
				document.getElementById("content").style.margin='20px';
				document.form1.action='';
				document.form1.onsubmit=handlesubmit;
	            // Generate the QR code for the Paytm payment URL
	            new QRCode(document.getElementById("content"), paytmURL);
	        }
			
			function generateCard(){
				
				document.form1.onsubmit='';
				
				document.getElementById("content").innerHTML=`<div class="row">
					<div class="col-md-12 form-group">
						<label for="last_name">Name of Card Holder</label> <input
							type="text" placeholder="Enter Card Holder Name"
							name="cardholder" class="form-control" id="last_name" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 form-group">
						<label for="last_name">Credit Card Number</label> <input
							type="number" placeholder="4242-4242-4242-4242" name="cardnumber"
							class="form-control" id="last_name" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Expiry Month</label> <input type="number"
							placeholder="MM" name="expmonth" class="form-control" size="2"
							max="12" min="00" id="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Expiry Year</label> <input type="number"
							placeholder="YYYY" class="form-control" size="4" id="last_name"
							name="expyear" required>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-6 form-group">
						<label for="last_name">Enter CVV</label> <input type="number" placeholder="123" class="form-control" size="3" id="last_name" name="expyear" required> <input type="hidden"
							name="amount" value="">

					</div>
					<div class="col-md-6 form-group">
						<label>&nbsp;</label>
						<a href='/buycart/${id}/${price}'><input type="button"  value='pay${price}' class="form-control btn btn-success"></a>
							
					</div>
				</div>`;
			}
	    </script>

</body>
</html>