<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="org.rutgers.neha.univ.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<title>Administrations Portal</title>
</head>
<body>

<%
	Object utype=session.getAttribute("utype");
	if (utype == null ||  !utype.toString().equals("admin")) {
		response.sendRedirect("admin.jsp");
	}
	
	String dept=session.getAttribute("dept").toString();
    

%>	
	<table class="table">
		<tr>
			<th>Department Administrator Portal>  </th>
		</tr>
		<tr>
		<td>
		<%
		
				String str1 = "Hello " + session.getAttribute ("user") + " from " + session.getAttribute ("dept") + " Department ";
				out.println(str1);
				out.println("<br>");
				String str2= "Student List below ";			
				out.println(str2);
				
		%>	
		</td>
		</tr>
	</table>
		
	<table class="table">
		<tr><td>Id</td><td>Name</td><td>Phone</td><td>Birthdate</td></tr>
		<%
				Utils u = new Utils();
				ArrayList<User> studentList = u.getStudentList();
							
				java.text.SimpleDateFormat sd = new SimpleDateFormat("MM-dd-yyyy");
				for (User student:studentList) {
					String str="<tr><td>"+student.id + " </td><td>" + student.name + "</td><td>"+ student.phone+"</td><td>"+sd.format(student.birthday)+"</td></tr> ";
					out.println (str);
				}
				
		%>	
		
		<tr>
		<td colspan=4>
				<br>
		Click  <a href="admin.jsp"> here </a>  to get back to admin page
		<br>
		Click  <a href="Welcome.jsp"> here </a>  to logout
		<br>
		</td>
		</tr>
	</table>
</body>
</html>
