<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<style>
	body{
		background-image:url('/img/ecom3.jpg');
		background-size:cover;
		background-repeat:no-repeat;
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
	input:not([type='submit']){
		background-color:transparent;
		border:1px solid white;
		width:100%;
		height:40px;
		border-radius:5px;
		color:white;
		font-size:20px;;
		font-weight:bold;
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
	.error{
		color: red;
	}
</style>
<body>
	<h1 align='center' style="color:red">Register</h1>
	<div class='form'>
	<form action='/user-register' onsubmit="return validation()">
		<p align='center' style='color:red'>${message}</p>
		<div class='in'><label for="fname">Name</label>
		<input type="text" id='fname' name='name'"/>
		<p id ="pname" class="error"></p>
		</div>

		<div class='in'><label for="phno"> Mobile Number</label>
		<input type="text" id='phno' name='phno' "/>
		<p id ="pno" class="error"></p>	
		</div>

		<div class='email'><label for="email">Email</label>
		<input type="email" id='email' name='email' "/>
		<p id ='pemail' class="error"></p>
		</div>

		<div class='in'><label for="address">Address</label>
		<input type="text" id='address' name='address' "/>
		<p id ='paddress' class="error"></p>	
		</div>

		<div class='in'><label for="city">City</label>
		<input type="text" id='city' name='city' "/>
	    <p id = 'pcity' class="error"></p>
	     </div>

		<div class='in'><label for="state">State</label>
		<input type="text" id='state' name='state' "/>
	    <p id ='pstate' class="error"></p>
	    </div>

		<div class='in'><label for="pincode">Pincode</label>
		<input type="text" id='pincode' name='pincode' "/>
	    <p id ='pcode' class="error"></p>
	    </div>

		<div class='in'><label for="pass">Password</label>
		<input type="password" id='pass' name='password' "  />
	    </div>

		<div class='in'><label for="cpass">Confirm Password</label>
		<input type="text" id='cpass' name='cpasword' "  />
	    <p id ='cpwd' class="error"></p>
	    </div>
		<input type='submit' value='Login'>
	</form>
	<p align='center'><a href="/login">Goto Login</a></p> 
	</div>
</body>
<script>

function validation(){
var name=document.getElementById('fname');
var phno=document.getElementById('phno');
var email=document.getElementById('email');
var address=document.getElementById('address');
var city=document.getElementById('city');
var state=document.getElementById('state');
var pincode=document.getElementById('pincode');
var pass=document.getElementById('pass');
var cpass=document.getElementById('cpass');

console.log("methoid start");
	if(name.value == ''){
		name.nextElementSibling.innerText='The phno is required';
		//document.getElementById("pname").innerText='The Name is required';
		return false;
	}
	if(phno.value == ''){
		phno.nextElementSibling.innerText='The phno is required';
		return false;
	}
	if(email.value == ''){
		email.nextElementSibling.innerText='The email is required';
		return false;
	}
	if(address.value == ''){
      address.nextElementSibling.innerText='The address is required';
      return false;       
	}
	if(city.value == ''){
		City.nextElementSibling.innerText='The city is required';
		return false;
	}
	if(state.value == ''){
		state.nextElementSibling.innerText='The state is required';
		return false;
	}
	if(pincode.value == ''){
		pincode.nextElementSibling.innerText='The pincode is required';
		return false;
	}
	if(pass.value != cpass.value){
		cpass.nextElementSibling.innerText = 'Password does not matched'
		return false;
	}
	return true;
}
</script>
</html>