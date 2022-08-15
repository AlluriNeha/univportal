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
	if (utype == null || !utype.toString().equals("prof")) {
		response.sendRedirect("proflogin.jsp");
	}

%>

<table class="table" >
		<tr><th>Professors Portal</th> </tr>
		<tr>
		<td > 
		<%  
			String str = "Hello Professor: " + session.getAttribute ("user") + " <br> Input Grades for Course";
			out.println(str);
			String cid = request.getParameter("cid");
			String snum= request.getParameter("snum");
			Course c1 = new Utils().getCourse(cid);
			out.println("Id:" + c1.cid + "<br>");
			out.println("Name:" + c1.cname + "<br>");
			out.println("Dept:" + c1.dname + "<br>");
			out.println("Credits:" + c1.credits + "<br>");
			out.println("Section:" + request.getParameter("snum") + "<br>");
			
		%>
		</td>
		</tr>
</table>
		<form method="post" action="submitgrades.jsp">

	<table class="table">
		<tr><td>Student Id</td><td>Student Name</td><td>Current Grade</td><td>New Grade</td></tr>
		
		<%
		
				Utils u = new Utils();
				ArrayList<Enroll> enrolls = u.getEnrolledCoursesBySection(cid,snum);
				String hidden = "<input type=hidden name=\"cid\" value=\""+cid+"\"> <input type=hidden name=\"snum\" value=\""+snum+"\">";
				String s="selected";
				String e="";
				out.println(hidden);
				for (Enroll enroll:enrolls) {
					if (enroll.grade == null) 
						enroll.grade="";
					String opt = " <option " +  ( enroll.grade.equals("") ?s:e)  + " value=\"\"></option>" + 
							" <option " +  ( enroll.grade.equals("A") ?s:e)  + " value=\"A\">A</option>" + 
							" <option " +  ( enroll.grade.equals("B") ?s:e)  + " value=\"B\">B</option>" + 
							" <option " +  ( enroll.grade.equals("C") ?s:e)  + " value=\"C\">C</option>" + 
							" <option " +  ( enroll.grade.equals("D") ?s:e)  + " value=\"D\">D</option>" + 
							" <option " +  ( enroll.grade.equals("F") ?s:e)  + " value=\"F\">F</option>" ;					
					String str3 = "<tr><td>"+enroll.sid+ "</td><td>" + enroll.sname + "</td><td>"+ enroll.grade + "</td><td>"
					+ " <select name=\"grade_"+ enroll.sid+"\" id=\"grade_"+enroll.sid +"\">" + opt + "</select> </td></tr>";
					out.println(str3);
					out.println("</td></tr>");

				}
		%>
		<tr> <td colspan=4>  <button class="button" type="submit">Submit Grades</button> </td></tr>
		
				<tr>	
		<td colspan=4>
		<br>
		Click  <a href="prof.jsp"> here </a>  to get back to main page
		<br>
		Click  <a href="Welcome.jsp"> here </a>  to logout
		<br>
		</td>
		</tr>
	</table>
			</form>
	
</body>
</html>

