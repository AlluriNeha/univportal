<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.catalina.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="org.rutgers.neha.univ.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


	<table  class="table" >
		<tr>
			<td colspan="4">
			Course Details: <br><br>
			<%
				String cid1 = request.getParameter("cid");
				Course c1 = new Utils().getCourse(cid1);
				out.println("Id:" + c1.cid + "<br>");
				out.println("Name:" + c1.cname + "<br>");
				out.println("Dept:" + c1.dname + "<br>");
				out.println("Credits:" + c1.credits + "<br>");

			%>
			</td>
		</tr>
		<tr>
			<td colspan="4">
			Pre Req Details:
			</td>
		<tr>
			<td>Pre Req Id</td><td>Pre Req Name</td><td> Dept </td><td>Credits</td>
		</tr>
		<tr>
			<%
				ArrayList<Course> ps  = new Utils().getPrereqs(cid1);
				for (Course p:ps)
					out.println("<tr><td>"+p.cid+"</td><td>" + p.cname + "</td><td>" +  p.dname + "</td><td>" + p.credits + "</td>"); 
			%>
		</tr>
		<tr>
				<td colspan=4>
		<br>
		Click  <a href="admin.jsp"> here </a>  to get back to admin page
		<br>
		Click  <a href="Welcome.jsp"> here </a>  to get back to main page
		<br>
		</td>
		</tr>
				
		
	</table>
