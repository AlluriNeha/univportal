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
		<tr><td>Course Id</td><td>Course Name</td><td>Dept</td><td>Credits</td><td>Pre Reqs</td><td>Schedule</td></tr>
		<%
				Utils u = new Utils();
		        ArrayList<Course> courses  = u.getCoursesForEnrollment(sid);
				SimpleDateFormat df = new SimpleDateFormat("HH:mm");
				for (Course c:courses) {
					ArrayList<Section> secs = u.getCourseSections(c.cid+"");
					ArrayList<Course> prereqs=u.getPrereqs(c.cid+"");
					String course = "<tr><td>"+c.cid+ "</td><td>" + c.cname + "</td><td>" + c.dname + "</td><td>" + c.credits + "</td><td>";
					for (Course prereq:prereqs) 
						course = course + prereq.cid + "(" + prereq.cname +")<br>";					
					course= course + "</td><td>";
					out.println(course);
					
					for (Section sec:secs) {
						String sched = "<table class=\"table\"> <tr><td> Section Num: " + sec.snum + "<br>";						
						for (Schedule sch:sec.sList) {
							sched =  sched + "Schedule: " + sch.scheduleid + ":" +  sch.dayofweek + " From:" + df.format(sch.startTime) + " To:" + df.format(sch.endTime) + "<br>";
						}
						sched = sched + "<a href=\"registersec.jsp?cid="+c.cid+"&snum=" +sec.snum +  "\"> register </td></tr></table>";
						out.println(sched);
	
					}
					out.println("</td></tr>");
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