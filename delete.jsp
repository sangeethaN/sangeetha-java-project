<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.PreparedStatement, java.sql.ResultSet, com.stock.util.Database ,com.stock.util.Cookies" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%
String identity=request.getParameter("id");
Database db = new Database();
PreparedStatement ps = db.getPS("delete from stock_management where identity=?");
ps.setString(1,identity);
ps.executeUpdate();
response.sendRedirect("index.jsp");
%>