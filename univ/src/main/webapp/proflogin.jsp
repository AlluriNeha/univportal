
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
	if (utype != null && utype.toString().equals("prof")) {
		response.sendRedirect("prof.jsp");
	}
	String pid=request.getParameter("pid");
    String pwd=request.getParameter("pwd");
    
    if (pid != null & pwd != null) {
   		String name =  new Utils().checkProfessor(pid, pwd);
   		
   		if (name != null) {
   			session.setAttribute("user", name);
   			session.setAttribute("pid", pid);
   			
   			session.setAttribute("utype", "prof");
   			response.sendRedirect("prof.jsp");
   		}
    }   	

%>

	<table class="table">
		<tr>
			<th>Professor Portal</th>
		</tr>
		<tr>
			<td>Please enter user id and password to login</td>
		</tr>
		<tr>
			<td>
				<form method="post" action="proflogin.jsp">
					<br> <br> User Id: <input type="text" name="pid">
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
