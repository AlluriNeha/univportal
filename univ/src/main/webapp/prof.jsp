<%@page import="org.apache.catalina.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="org.rutgers.neha.univ.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<title> Administrations Portal</title>
</head>
<body>

<%
	Object utype=session.getAttribute("utype");
	if (utype == null || !utype.toString().equals("prof")) {
		response.sendRedirect("proflogin.jsp");
	}

%>

<table class="table" >
		<tr><th>Professors Portal</th> </tr>
		<tr>
		<td > 
		<%  
			String str = "Hello Professor: " + session.getAttribute ("user") + " <br> Please select a function";
			out.println(str);
		%>
			  <form method="post" action="redirect.jsp">
				  <br> <input type="radio" name="command" value="mycourses"/> Review & Grade Students
				  <br><button class = "button"  type="submit"> Submit </button>
			   </form>
					<br>

		Click  <a href="Welcome.jsp"> here </a>  to logout
		<br>
		</td>
	</tr>
</table>
</body>
</html>
