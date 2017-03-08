<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="theme.css" type="text/css" />
</head>
<body>
<table border="1" width="1024px" class="centered data">
<tr>
<th>Id</th>
<th>Type</th>
<th>Description</th>
<th>Price</th>
<th>Reorder</th>
<th>Quantity</th>
<th>Category</th>
</tr>
<%
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","secure");
    PreparedStatement statement = connection.prepareStatement("select * from item");
    ResultSet rs = statement.executeQuery();
    while(rs.next()) {
%>
<tr>
    <td><%= rs.getString(1) %></td>
    <td><%= rs.getString(2) %></td>
    <td><%= rs.getString(3) %></td>
    <td><%= rs.getDouble(4) %></td>
    <td><%= rs.getInt(5) %></td>
    <td><%= rs.getInt(6) %></td>
    <td><%= rs.getString(7) %></td>
    <td>
        <form action="edit.jsp">
        <input type="hidden" name = "code" value="<%= rs.getString(1) %>" />
        <input type="submit" value="edit" />
        </form>
    </td>
    <td>
        <form action="delete.jsp">
        <input type="hidden" name = "code" value="<%= rs.getString(1) %>" />
        <input type="submit" value="delete" />
        </form>
    </td>
</tr>
<%
    }
    rs.close();
    statement.close();
    connection.close();
} catch(Exception e) {
    e.printStackTrace();
}
%>
</table>
</body>
</html>