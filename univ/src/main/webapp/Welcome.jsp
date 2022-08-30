<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>University Administration Portal</title>
</head>
<body>
<table  class="table" >

	<tr>
		<th>Welcome To University Registration Portal </th>
	</tr>
	<tr>
	<%
		session.invalidate();
	%>
		<td  >Select Your Role proceed further</td>
		</tr>
		<tr>
		<td>
		<form method="post" action="redirect.jsp">
		  <input type="radio" name="command" value="adminlogin"/>Administrator
		  <br>
		  <input type="radio" name="command" value="proflogin"/> Professor
		  <br>
		  <input type="radio" name="command" value="studentlogin"/> Student	
		  <br>
		  <br>	    
		  <button class = "button"  type="submit"> Submit </button>
		</form>
		</td>
		</tr>
	</tbody>
</table>
</body>
</html>