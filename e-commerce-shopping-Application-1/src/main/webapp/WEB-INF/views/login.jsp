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
		background-repeat:no-repeat;
		background-size:cover;
		width:100vw;
		height:100vh;
		box-sizing:border-box;
	}
	.form{
		float:right;
		margin:10% 5%;
		padding:20px;
		width:20rem;
		background-color:rgba(0,0,0,0.8);
		border:none;
	}
	form>*{
		display:block;
		width:100%;
	}
	label{
		font-size:20px;
		margin:10px 0;
		color:white;
	}
	input[type='email'],input[type='password']{
		height:30px;
		border-radius:5px;
		margin:20px 0;
		border:none;	
	}
	input[type='submit']{
		height:40px;
		border-radius:20px;
		background-color:blue;
		color:white;
		font-size:20px;
	}
	input[type='button']:hover{
		background-color:white;
				color:blue;
	}
</style>
<body>
	<div class='form'>
		<h1 align='center' style="color:white;font-size:40px">Login</h1>
	<form action='/signIn'>
		<p align='center' style='color:red'>${message}</p>
		<label for="email">Email</label>
		<input type="email" id='email' name='email' onfocus="this.style.boxShadow='0px 0px 20px blue'"/>
		<label for="pass">Password</label>
		<input type="password" id='pass' name='password' onfocus="this.style.boxShadow='0px 0px 20px blue'"  />
		
		<input type='submit' value='Login'>
	</form>
	</div>
</body>
</html>