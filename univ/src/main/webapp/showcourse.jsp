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
				String str2= "Course List below for " + session.getAttribute ("dept") + " Department ";			
				out.println(str2);
				
		%>	
		</td>
		</tr>
	</table>
		
	<table class="table">
		<tr><td>Id</td><td>Dept</td><td>Credits</td><td>Name</td><td>Add Preqs</td><td>Add Schedule</td></tr>
		<%
				Utils u = new Utils();
				ArrayList<Course> crList = u.getCourseList(session.getAttribute ("dept").toString());
				for (Course course:crList) {
					String str="<tr><td>"+course.cid + " </td><td>" + course.dname + "</td><td>"+ course.credits+"</td><td>"+course.cname+"</td><td> <a href=\"addpreqs.jsp?cid="+course.cid+"\" > show/add prereqs </a> </td><td> <a href=\"addsection.jsp?cid="+course.cid+"\"> show/add section </a> </td></tr> ";
					out.println (str);
				}
				
		%>	
		
				<tr>
		<td colspan=6>
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
