<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.PreparedStatement, java.sql.ResultSet, com.stock.util.Database, com.stock.util.Cookies, java.sql.Statement, java.sql.Connection,java.util.LinkedList,java.util.List,com.stock.dao.*" %>
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
String id = request.getParameter("identity");
    String quantity = request.getParameter("quantity");
    String mrp = request.getParameter("mrp");
    String discount = request.getParameter("discount");
    String manufacturingdate = request.getParameter("manufacturingdate");
    String expirydate = request.getParameter("expirydate");
    Database db = new Database();
    PreparedStatement ps = db.getPS("update stock_management set quantity_in_stock=?,mrp=?,discount=?,manufactring_date=?,expiring_date=? where identity=?");
    ps.setInt(1, Integer.parseInt(quantity));
    ps.setDouble(2, Double.parseDouble(mrp));
    ps.setDouble(3, Double.parseDouble(discount));
    ps.setString(4, manufacturingdate);
    ps.setString(5, expirydate);
    ps.setString(6, id);
    ps.executeUpdate();
    response.sendRedirect("index.jsp");
%>