<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.gree.lsa.web.utils.URLConnectionTest"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	String movieName = request.getParameter("movieName");

	String result = URLConnectionTest.getText("http://api.nytimes.com/svc/movies/v2/reviews/search.xml?query=" + movieName + "&api-key=96450337676c2144e8616e2948ef099e:9:60181737&response-format=json");
%>
<jsp:forward page="writeResponse.jsp">
	<jsp:param value="<%=result %>" name="result"/>
</jsp:forward>
</body>
</html>