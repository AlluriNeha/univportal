<%@page import="org.apache.catalina.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="org.rutgers.neha.univ.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">

<title> Add Course</title>
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
			<th>Department Administrator Portal</th>
		</tr>
		<tr>
		<td>
			<%  
				String dept=session.getAttribute ("dept").toString();
				String str = "Hello " + session.getAttribute ("user") + " from " + dept + " Department ";
				out.println(str);
				out.println("<br>");
			%>
		</td>
		</tr>
		<tr>
		<td > 
		<%  
			String cid=request.getParameter("cid");
		    String prid=request.getParameter("prid");
			out.println ("Creating prereq with following details: <br> <br> " + "Id    :" + cid+  "<br>PreReq   :" + prid +  "<br> <br><br>");			
			String status = new Utils().addPreReq( cid, prid);
			out.println (status);
						
		%>
	</tr>
</table>

	<%@include file="coursedetails.jsp" %>

	
</body>
</html>