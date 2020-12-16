<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login System</title>

<script>
	//input validation using javascript
	function validate() {
		if (document.getElementById('id').value == '') {
			alert('Student ID is compulsory.');
		} else if (document.getElementById('password').value == '') {
			alert('Password is compulsory.');
		} else {
			//submit the form
			//document.forms[0].submit();
			document.getElementById('loginForm').submit();
		}
	}
	
	</script>

<link rel="stylesheet" type="text/css" href="css/original.css"/>

</head>
<center>
	<body>

		<h1>Welcome to Student Information System</h1>
		<br>
		<h2>Login System</h2>


		<form action="HelloForm" method='GET' id='loginForm'>
			<p>
				Student ID: <input type='text' name='id' id='id' />
			</p>
			<p>
				Password: <input type='password' name='password' id='password' />
			</p>
			<p>
				<button type='button' onclick="validate()">Login</button>
				<button type='reset'>Reset</button>
			</p>
		</form>
		
	</body>
</center>
</html>