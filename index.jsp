<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.PreparedStatement, java.sql.ResultSet, com.stock.util.Database ,com.stock.util.Cookies,com.stock.dao.*" %>
<%@page import="java.util.List,java.util.LinkedList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stock Management</title>
<style>
.center-content {
	width: 512px;
	margin: 150px auto;
}
</style>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css" />
</head>

<body>
<form class="form-inline center-content" action="search.jsp" method="post">
  <div class="form-group">
 <label for="Search"></label>
 <input type="search" class="form-control" id="search" name="search" placeholder="search">
  <button type="submit" class="btn btn-default btn-lg">
  <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 
</button>
</div>
<div class="row"> <p>	</p></div>
<div class="row">
  <div class="col-xs-3">
   <a class="btn btn-default" href="discount.jsp" role="button">Apply Discount</a>
  </div>
  <div class="col-xs-2">
    <a class="btn btn-default" href="filter.jsp" role="button">Filter By</a>
  </div>
  <div class="col-xs-2">
   <a class="btn btn-default" href="addnew.jsp" role="button">Add New</a>
  </div>
</div>
  </form>
<form class="center-content">
<div class="row"> <p>	</p></div>
<div class="row"> <p>	</p></div>
<select name="sort" id="sort">
<option value="nothing" selected>Sort by</option>
<option value="identity">Identity</option>
<option value="name">Name</option>
<option value="quantity_in_stock">Quantity in Stock</option>
<option value="mrp">MRP</option>
<option value="discount">Discount</option>

</select>
<select name="either" id="either">
<option value="nothing" selected>Either</option>
<option value="ascending">ascending</option>
<option value="descending">descending</option>
</select>
 <button type="submit" class="btn btn-default">Get view</button>
  </form>

  </body>
</html>

<%
String sort=request.getParameter("sort");
String either=request.getParameter("either");
Database db = new Database();
PreparedStatement ps = db.getPS("select * from stock_management");
ResultSet rs = ps.executeQuery();
String identity="";
String name="";
int quantity=0;
double mrp=0;
double discount=0;
String vendor="";
String manufacture="";
String expiry="";
List<Item> ll = new LinkedList<Item>();
while(rs.next()) {
    identity = rs.getString(1);
    name=rs.getString(2);
    quantity=rs.getInt(3);
    mrp=rs.getDouble(4);
    discount=rs.getDouble(5);
    vendor = rs.getString(6);
    manufacture = rs.getString(7);
    expiry = rs.getString(8);
    ll.add(new Item(identity,name,quantity,mrp,discount,vendor,manufacture,expiry));   
}
if(sort!=null && either!=null)
if(sort.equals("identity") && either.equals("ascending"))
        ll.sort(new    IdentityComparatorAsc());
else if(sort.compareTo("identity")==0 && either.compareTo("descending")==0)
    ll.sort(new    IdentityComparatorDesc());
else if(sort.compareTo("name")==0 && either.compareTo("ascending")==0)
        ll.sort(new    NameComparatorAsc());
        else if(sort.compareTo("name")==0 && either.compareTo("descending")==0)
        ll.sort(new    NameComparatorDesc());
        else if(sort.compareTo("quantity_in_stock")==0 && either.compareTo("ascending")==0)
            ll.sort(new   QuantityComparatorAsc());
        else if(sort.compareTo("quantity_in_stock")==0 && either.compareTo("descending")==0)
            ll.sort(new    QuantityComparatorDesc());
        else if(sort.compareTo("mrp")==0 && either.compareTo("ascending")==0)
            ll.sort(new    MrpComparatorAsc());
        else if(sort.compareTo("mrp")==0 && either.compareTo("descending")==0)
            ll.sort(new    MrpComparatorDesc());
        else if(sort.compareTo("discount")==0 && either.compareTo("Ascending")==0)
            ll.sort(new    DiscountComparatorAsc());
        else if(sort.compareTo("discount")==0 && either.compareTo("descending")==0)
            ll.sort(new    DiscountComparatorDesc());
       
%>
<%
out.println("<table class=\"table table-boarded\" >");
%>
       <html>
<tr>
<td> <b>iIDENTITY </b> </td>
<td> <b>NAME</b> </td>
<td><b>QUANTITY</b> </td>
<td> <b>MRP </b></td>
<td> <b>DISCOUNT</b> </td>
<td> <b>VENDOR </b></td>
<td> <b>EDIT </b></td>
<td> <b>DELETE </b></td>
</tr>
<tr>
</html>
<%
for(Item each:ll)
{
    out.println("<tr><td>"+each.getIdentity()+"</td><td>"+each.getName()+"</td><td>"+each.getQuantity()+"</td><td>"+each.getMrp()+"</td><td>"+each.getDiscount()+"</td><td>"+each.getVendor()+"</td>");
    out.println("<td> <form action=\"edit.jsp\" method=\"get\" ><input type=\"hidden\" name=\"id\" value="+each.getIdentity() +" /> <input type=\"submit\" value=\"Edit\" class=\"btn btn-info btn-xs\" />");
    out.println(" </form> </td>");
    out.println("<td> <form action=\"delete.jsp\" method=\"get\" ><input type=\"hidden\" name=\"id\" value="+each.getIdentity() +" /> <input type=\"submit\" value=\"Delete\" class=\"btn btn-info-danger btn-xs\" />");
    out.println(" </form> </td></tr>");
}
%>
