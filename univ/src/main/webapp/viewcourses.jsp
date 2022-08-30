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
<title> Administrations Portal</title>
</head>
<body>

<%
	Object utype=session.getAttribute("utype");
	if (utype == null || !utype.toString().equals("student")) {
		response.sendRedirect("studentlogin.jsp");
	}
	String sid=session.getAttribute("sid").toString();

%>

<table class="table" >
		<tr><th>Student Portal</th> </tr>
		<tr>
		<td > 
		<%  
			String str = "Hello Student: " + session.getAttribute ("user") + " <br> Here are your enrolled courses";
			out.println(str);
		%>
		</td>
		</tr>
</table>
	<table class="table">
		<tr><td>Course Id</td><td>Course Name</td><td>Dept</td><td>Credits</td><td>Section</td><td>Grade</td></tr>
		<%
				Utils u = new Utils();
		        ArrayList<Enroll> enrolls  = u.getAllEnrolledCourses(sid);

				SimpleDateFormat df = new SimpleDateFormat("HH:mm");
				for (Enroll e:enrolls) {
					String str3 = "<tr><td>"+e.cid+ "</td><td>" + e.cname + "</td><td>" + e.dname + "</td><td>" + e.credits + "</td><td>" + e.snum + "</td><td>" + e.grade + "</td></tr>";
					out.println(str3);

				}
		%>
		<tr>	
		<td colspan=6>
		<br>
		Click  <a href="student.jsp"> here </a>  to get back to main page
		<br>
		Click  <a href="Welcome.jsp"> here </a>  to logout
		<br>
		</td>
		</tr>
	</table>


</body>
</html>