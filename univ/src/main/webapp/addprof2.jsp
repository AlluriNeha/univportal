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

<table class="table" >
		<tr>
			<th style="text-align:center;font-size:30px">Department Administrator Portal</th>
		</tr>
		<tr>
		<td > 
		<%  
			String pid=request.getParameter("id");
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			String password=request.getParameter("pwd");
			String onum =request.getParameter("onum");			
			
			out.println ("Creating professor with following details: <br> <br> " + "Id    :" + pid +  "<br>Name   :" + name + "<br>Phone  " + phone + " <br> " + " Office Num:" + onum + "<br> <br><br>");			
			String status = new Utils().addProfessor(pid, name, phone, password, onum);			
			out.println (status);
						
		%>
		<br>
		Click  <a href="admin.jsp"> here </a>  to get back to admin page
		<br>
		Click  <a href="Welcome.jsp"> here </a>  to logout
		<br>
		</td>
	</tr>
	</tbody>
</table>
</body>
</html>