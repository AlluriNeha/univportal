<%@page import="java.text.SimpleDateFormat"%>
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
				String course = request.getParameter("cid");
				Course c= new Utils().getCourse(course);
				String str2= "Enter details of section to add to course Dept:" + c.dname +  " Name:" + c.cname+ "<br>";				
				out.println(str2);
			%>
			</td>
		</tr>
		<tr>
			<td>
				    		 			
				<form method="post" action="addsection2.jsp">
						<table>
						<tr><td>Course Id</td><td> <input type="text" name="cid" value="<%=course%>" readonly/></td></tr>
						<tr><td>Section Num</td><td> <input type="text" name="snum"/></td></tr>
						<tr><td>Professor Id</td><td> <input type="text" name="pid"/></td></tr>
						<tr><td colspan="2"><button class = "button"  type="submit"> Submit </button> </td></tr>
						</table>
				</form>
			</td>
		</tr>
	</table>
	
	<%@include file="courseschedules.jsp" %>
</body>
</html>
