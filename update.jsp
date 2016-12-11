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
String identity = request.getParameter("identity");
String name = request.getParameter("name");
String quantity_of_stock= request.getParameter("quantity_of_stock");
String mrp = request.getParameter("mrp");
String discount = request.getParameter("discount");
String vendor = request.getParameter("vendor");
String manufactring_date = request.getParameter("manufactring_date");
String expiring_date = request.getParameter("expiring_date");
Database db = new Database();
PreparedStatement ps = db.getPS("insert into stock_management values(?,?,?,?,?,?,?,?)");
ps.setString(1,identity);
ps.setString(2,name);
ps.setInt(3,Integer.parseInt(quantity_of_stock));
ps.setDouble(4,Double.parseDouble(mrp));
ps.setDouble(5,Double.parseDouble(discount));
ps.setString(6,vendor);
ps.setString(7,manufactring_date);
ps.setString(8,expiring_date);
ps.executeUpdate();
response.sendRedirect("index.jsp");
%>