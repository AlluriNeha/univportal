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
			String snum=request.getParameter("snum");
			String scheduleId=request.getParameter("sid");

			String dow=request.getParameter("dow");
			String startTime=request.getParameter("start");
			String endTime=request.getParameter("end");
			String str2 = "Creating Schedule with following details: <br> <br> " + " Course Id    :" + cid+  "<br> Section   :" + snum +  "<br>Schedule Id  :" + scheduleId + " <br> Start Time:" + startTime + " <br> End Time: "  + endTime ;
			out.println (str2);
			String status = new Utils().addSchedule(cid, snum, scheduleId, dow, startTime, endTime);

			out.println (status);
						
		%>
		</td>
	</tr>
</table>


<%@include file="courseschedules.jsp" %>

	
	
</body>
</html>