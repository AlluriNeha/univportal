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
			String str = "Hello Student: " + session.getAttribute ("user") + " <br> You have selected to enroll for following: <br>";
			String cid= request.getParameter("cid");
			String snum= request.getParameter("snum");
			Utils u = new Utils();
			Course c= u.getCourse(cid);
			out.println ("Id:" + c.cid + "<br>");
			out.println ("Name:" + c.cname +  "<br>");
			out.println ("Credits:" + c.credits +  "<br>");
			out.println ("Dept:" + c.dname +  "<br>");
			
			ArrayList<Course> nc = u.getPreReqsNotCompleted(sid, cid);
			
			if (nc.size() > 0 ) {
				out.println ("Sorry .. you can't enroll as following prereqs not completed <br>");
				for (Course n:nc) {
					out.println ( "Id:" + n.cid + "   Name:" + n.cname + " Dept:" + n.dname+ "<br>");
				}
				
			} 
			else {
				String status = u.registerCourse(sid, cid, snum);
				out.println(status+"<br><br>");
				
			}
		%>
		</td>
		</tr>
		<tr>
		<td>
		<br>
		Click  <a href="student.jsp"> here </a>  to get back to main page
		<br>
		Click  <a href="Welcome.jsp"> here </a>  to logout
		<br>
		</td>
		</tr>
	</table>
		
</table>

</body>
</html>