<%
	String command = request.getParameter("command");
    String redirectURL = command+".jsp";
    response.sendRedirect(redirectURL);
%>