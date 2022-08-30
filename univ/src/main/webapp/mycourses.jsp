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
			String str = "Hello Professor: " + session.getAttribute ("user") + " <br> Here are your courses";
			out.println(str);
		%>
		</td>
		</tr>
</table>
	<table class="table">
		<tr><td>Course Id</td><td>Course Name</td><td>Dept</td><td>Credits</td><td>Section</td><td>Schedule</td></tr>
		<%
				Utils u = new Utils();
				ArrayList<Section> secs = u.getProfSections(session.getAttribute ("pid").toString());	
				SimpleDateFormat df = new SimpleDateFormat("HH:mm");
				for (Section sec:secs) {
					Course c  = u.getCourse(sec.cid+"");
					String str3 = "<tr><td>"+sec.cid+ "</td><td>" + c.cname + "</td><td>" + c.dname + "</td><td>" + c.credits + "</td><td>" + sec.snum +
							"<br><a href=\"gradestudents.jsp?cid="+ sec.cid+"&snum="+sec.snum+"\"> Grade Students</a> </td><td>";
					out.println(str3);
					for (Schedule sch:sec.sList) {
						String str4 =  "Schedule: " + sch.scheduleid + ":" +  sch.dayofweek + " From:" + df.format(sch.startTime) + " To:" + df.format(sch.endTime) + "<br>";
						out.println(str4);
					}
					out.println("</td></tr>");

				}
		%>
		<tr>	
		<td colspan=6>
		<br>
		Click  <a href="prof.jsp"> here </a>  to get back to main page
		<br>
		Click  <a href="Welcome.jsp"> here </a>  to logout
		<br>
		</td>
		</tr>
	</table>


</body>
</html>
