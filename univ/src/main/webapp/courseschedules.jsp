<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.catalina.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="org.rutgers.neha.univ.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


	<table  class="table" >
		<tr>
			<td colspan="3">Existing Sections/Schedules</td>			
		</tr>
		<tr>
			<td>Section Id</td><td>Professor Id</td><td>Schedules</td>
		</tr>
		<tr>
			<%
				String cid3 = request.getParameter("cid");
				ArrayList<Section> secs = new Utils().getCourseSections(cid3);
				SimpleDateFormat df = new SimpleDateFormat("HH:mm");
				for (Section sec:secs) {
					String str3 = "<tr><td>"+sec.snum + "</td><td>"+sec.pid+"</td><td>";
					out.println(str3);
					for (Schedule sch:sec.sList) {
						String str4 =  "Schedule: " + sch.scheduleid + ":" +  sch.dayofweek + " From:" + df.format(sch.startTime) + " To:" + df.format(sch.endTime) + "<br>";
						out.println(str4);
					}
					String str5="<a href=\"addschedule.jsp?cid="+ cid3+"&snum="+sec.snum+"\"> Add/Change Schedule</a>";
					out.println(str5);
					out.println("</td></tr>");

				}
			%>
		</tr>
		<tr>
		<td colspan=3>
		<br>
		Click  <a href="admin.jsp"> here </a>  to get back to admin page
		<br>
		Click  <a href="Welcome.jsp"> here </a>  to logout
		<br>
		</td>
		</tr>
		
		
	</table>
