<%@page import="org.apache.catalina.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="org.rutgers.neha.univ.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<title>Administrations Portal</title>
</head>
<body>

<%
	Object utype=session.getAttribute("utype");
	if (utype != null && utype.toString().equals("admin")) {
		response.sendRedirect("admin.jsp");
	}
	String uid=request.getParameter("uid");
    String pwd=request.getParameter("pwd");
    
    if (uid != null & pwd != null) {
   		User u =  new Utils().checkAdminUser(uid, pwd);
   		if (u != null) {
   			session.setAttribute("user", u.name);
   			session.setAttribute("dept", u.dept);
   			session.setAttribute("utype", "admin");
   			response.sendRedirect("admin.jsp");
   		}
    }   	

%>

	<table class="table">
		<tr>
			<th>Department Administrator Portal</th>
		</tr>
		<tr>
			<td>Please enter user id and password to login</td>
		</tr>
		<tr>
			<td>
				<form method="post" action="adminlogin.jsp">
					<br> <br> User Id: <input type="text" name="uid">
					<br> Password: <input type="password" name="pwd"> <br>
					<br>
					<button class="button" type="submit">Login</button>
				</form>
			</td>
		</tr>
		</tbody>
	</table>
</body>
</html>

