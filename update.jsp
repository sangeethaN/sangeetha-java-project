<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String code = request.getParameter("code");
String type = request.getParameter("type");
String desc = request.getParameter("desc");
double price = Double.valueOf(request.getParameter("price"));
int reo = Integer.valueOf(request.getParameter("reo"));
int qty = Integer.valueOf(request.getParameter("qty"));
String cat = request.getParameter("cat");
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","secure");
    PreparedStatement statement = connection.prepareStatement("update item set itemtype=?, description=?, price=?, reorderlevel=?, quantityonhand=?,category=? where itemcode = ?");
    statement.setString(7, code);
    statement.setString(1, type);
    statement.setString(2, desc);
    statement.setDouble(3, price);
    statement.setInt(4, reo);
    statement.setInt(5, qty);
    statement.setString(6, cat);
    statement.executeUpdate();
    statement.close();
    connection.close();
    response.sendRedirect("view.jsp");
} catch(Exception e) {
    e.printStackTrace();
}
%>
</body>
</html>
