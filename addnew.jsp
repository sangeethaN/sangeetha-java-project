<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.PreparedStatement, java.sql.ResultSet, com.stock.util.Database, com.stock.util.Cookies, java.sql.Statement, java.sql.Connection,java.util.LinkedList,java.util.List,com.stock.dao.Item" %>
<%
String search = request.getParameter("search");
Database db = new Database();
PreparedStatement ps = db.getPS("select * from stock_management where identity like ? or name like ?");
ps.setString(1, "%"+search+"%");
ps.setString(2, "%"+search+"%");
ResultSet rs = ps.executeQuery();
String identity="";
String name="";
int quantity=0;
double mrp=0;
double discount=0;
String vendor="";
String manufacture="";
String expiry="";
List<Item> li = new LinkedList<Item>();
while(rs.next()) {
    identity = rs.getString(1);
    name=rs.getString(2);
    quantity=rs.getInt(3);
    mrp=rs.getDouble(4);
    discount=rs.getDouble(5);
    vendor = rs.getString(6);
    manufacture = rs.getString(7);
    expiry = rs.getString(8);
    li.add(new Item(identity,name,quantity,mrp,discount,vendor,manufacture,expiry));   
}%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.center-content{
    width:512px;
    margin:150px auto;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css" type="text/css" />
</head>
<body>
<form class="form-inline center-content" action="search.jsp" method="post">
  <div class="form-group">
    <label for="search" ">Search</label>  
    <input type="text" class="form-control" id="search" name="search" placeholder="Search" value="<% out.println(search);%>">
  </div>
  <button type="submit" class="btn btn-default">
  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
  </button>  
</form>
</body>
</html>
<%

out.println("<table class=\"table table-bordered\" >");
%>
<html>
<tr>
<td> <b>IDENTITY </b> </td>
<td> <b>NAME</b> </td>
<td><b>QUANTITY</b> </td>
<td> <b>MRP </b></td>
<td> <b>DISCOUNT</b> </td>
<td> <b>VENDOR </b></td>
</tr>
<tr>
</html>
<%
for(Item each:li) {
    out.println("<tr><td>"+each.getIdentity()+"</td><td>"+each.getName()+"</td><td>"+each.getQuantity()+"</td><td>"+each.getMrp()+"</td><td>"+each.getDiscount()+"</td><td>"+each.getVendor()+"</td></tr>");
}
out.println("</table>");
%>
	