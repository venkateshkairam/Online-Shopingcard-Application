<html>
	<head>
		<style>
			#main{
			            width:100%;
			            height:99%;
			            display: flex;
			            flex-direction: row;
			            background-color: rgb(201, 198, 198);
			            background-color: rgb(240,242,245);

			        }
			#form{
				margin:auto;	
			}
			#form{
			            width:360px;
			            height:320px;
			            padding:20px;
			            background-color: white;
			            border-radius: 8px;
			            box-shadow: 1px 1px 10px gray;
			        }
			        input{
			            width:100%;
			            height: 50px;
			            margin-bottom: 20px;
			            border-radius: 5px;
						font-size: 1.10rem;
						padding-left:12px ;
			            background-color: transparent;
			            
			        }
			        input::placeholder{
			            color:gray;
			            font-size: 1.10rem;
			            font-weight: 500;
			            padding-left:10px ;
			        }
			        input[type="button"],input[type="submit"]{
			            font-size: 25px;
			            background-color: rgb(8,102,255);
			            border: none;
			            color: white;
			            font-weight: bold;
			        }
			        a{
			            text-decoration-line: none;
			            color:rgb(74,126,255);
			            margin:20px;
			        }
			        hr{
			            margin:20px;
			        }
			        button{
						display:block;
			            background-color: green;
			            color: white;
			            width:200px;
			            height:40px;
			            border: none;
			            border-radius: 5px;
			            font-weight: bolder;
			            font-size: 15px;
			        }
			        p{
			        	margin-top:0px;
			        	
			        }
		</style>
	</head>
	
	<body>
		<div id="main">
			<div id="form">
				<p>${error}</p>
				<form name='form1' action="login" method='post'>
			        <input id='name' type="text" placeholder="User Name" name='name' required>
			        <p style="color:red"></p>
			        <input id='password' type="password" placeholder="Password" name='password' required>
			        <p style="color:red"></p>
			        <input type="submit" value="Log In" onclick='check()'>
			        <hr>
				</form>
			</div>
		</div>
	</body>
<html>