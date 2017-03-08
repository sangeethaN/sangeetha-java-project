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
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","secure");
    PreparedStatement statement = connection.prepareStatement("delete from item where itemcode = ?");
    statement.setString(1, code);
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
