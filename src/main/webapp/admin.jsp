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
	if (utype == null || !utype.toString().equals("admin")) {
		response.sendRedirect("adminlogin.jsp");
	}

%>

<table class="table" >
		<tr><th style="text-align:center;font-size:30px">Department Administrator Portal</th> </tr>
		<tr>
		<td > 
		<%  
			String str = "Hello " + session.getAttribute ("user") + " from " + session.getAttribute ("dept") + " Department ";
			out.println(str);
		%>
		</td>
		</tr>
		<tr>
		<td>	
			  <form method="post" action="adminfuncs.jsp">
				  <table>
				  <tr>
				  <td> <input type="radio" name="command" value="addadmin"/> Add Admin </td>
				  <td> <input type="radio" name="command" value="addprof"/> Add Professor </td> 
				  <td> <input type="radio" name="command" value="addstudent"/> Add Student	</td> 
				  </tr>
				   <tr>		  
				  <td> <input type="radio" name="command" value="showadmin"/> Show Admins </td>
				  <td> <input type="radio" name="command" value="showprof"/> Show Professors</td>
				  <td> <input type="radio" name="command" value="showstudents"/> Show Students	</td>		  
				  </tr>
				  <tr>
				  <td> <input type="radio" name="command" value="addcourse"/> Add Course</td>
				  <td> <input type="radio" name="command" value="showcourse"/> Show Courses</td>
				  </tr>
				  </table>
				  <br>
			  	  <button class = "button"  type="submit"> Submit </button>
			   </form>
		</td>
	</tr>
			<tr>	
		<td colspan=3>
		<br>

		Click  <a href="Welcome.jsp"> here </a>  to logout
		<br>
		</td>
		</tr>
</table>
</body>
</html>
