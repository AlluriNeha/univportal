<%@page import="org.apache.catalina.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="org.rutgers.neha.univ.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<title> Add Professor</title>
</head>
<body>
	<%
	
		Object utype=session.getAttribute("utype");
		if (utype == null || !utype.toString().equals("admin")) {
			response.sendRedirect("adminlogin.jsp");
		}
	
	
	%>	
	<table  class="table" >
		<tr>
			<th>Department Administrator Portal</th>
		</tr>
		<tr>
			<td > 
			<%  
				String str = "Hello " + session.getAttribute ("user") + " from " + session.getAttribute ("dept") + " Department ";
				out.println(str);
				out.println("<br>");
				String str2= "Enter details of course to add to " + session.getAttribute ("dept") + " Department ";		
				out.println(str2);
			%>
			</td>
		</tr>
		<tr>
			<td>
				    		 			
				<form method="post" action="addcourse2.jsp">
						<table>
						<tr><td>Id</td><td> <input type="text" name="cid"/></td></tr>
						<tr><td>Name</td><td> <input type="text" name="name"/></td></tr>
						<tr><td>Credits</td><td> <input type="text" name="credits"/></td></tr>
						<tr><td colspan="2"><button class = "button"  type="submit"> Submit </button> </td></tr>
						</table>
				</form>
			</td>
		</tr>
	</table>

</body>
</html>
