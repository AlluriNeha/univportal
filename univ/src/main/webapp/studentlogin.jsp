
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
	if (utype != null && utype.toString().equals("student")) {
		response.sendRedirect("student.jsp");
	}
	
	String sid=request.getParameter("sid");
    String pwd=request.getParameter("pwd");
    
    if (sid != null & pwd != null) {
   		String name =  new Utils().checkStudent(sid, pwd);
   		
   		if (name != null) {
   			session.setAttribute("user", name);
   			session.setAttribute("sid", sid);
   			
   			session.setAttribute("utype", "student");
   			response.sendRedirect("student.jsp");
   		}
    }   	

%>

	<table class="table">
		<tr>
			<th>Student Portal</th>
		</tr>
		<tr>
			<td>Please enter user id and password to login</td>
		</tr>
		<tr>
			<td>
				<form method="post" action="studentlogin.jsp">
					<br> <br> User Id: <input type="text" name="sid">
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