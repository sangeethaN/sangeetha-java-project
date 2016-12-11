<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.sql.PreparedStatement, java.sql.ResultSet, com.stock.util.Database, com.stock.util.Cookies, java.sql.Statement, java.sql.Connection,java.util.LinkedList,java.util.List,com.stock.dao.Item" %>  
   <% 
   String edit = request.getParameter("id");
   Database db = new Database();
PreparedStatement ps = db.getPS("select * from stock_management where identity =?");
ps.setString(1, edit);
ResultSet rs = ps.executeQuery();
String identity="";
String name="";
int quantity=0;
double mrp=0;
double discount=0;
String vendor="";
String manufacture="";
String expiry="";
if(rs.next()) {
    identity = rs.getString(1);
    name=rs.getString(2);
    quantity=rs.getInt(3);
    mrp=rs.getDouble(4);
    discount=rs.getDouble(5);
    vendor = rs.getString(6);
    manufacture = rs.getString(7);
    expiry = rs.getString(8);
}%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css" type="text/css" />

</head>
<style>
.center-content{
    width:512px;
    margin:150px auto;
}
</style>
<body>
<form>
  <fieldset disabled>
    <div class="form-group">
      <label for="identity">Disabled input</label>
      <input type="text" id="identity" class="form-control" placeholder="identity" value=<%out.println(identity);%>>
    </div>
    </fieldset>
</form>
<form class="form-horizontal center-content" action="updateedit.jsp" method="post">

   
    
  <div class="form-group">
    <label for="quantity" class="col-sm-4 control-label">Quantity</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" name="quantity" id="quantity" placeholder="Quantity in stock" value="<%out.println(quantity);%>">
    </div>
  </div>
  <div class="form-group">
    <label for="mrp" class="col-sm-4 control-label">MRP</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" name="mrp" id="mrp" placeholder="Maximum retail price" value="<%out.println(mrp);%>">
    </div>
  </div>
  <div class="form-group">
    <label for="discount" class="col-sm-4 control-label">Discount</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" name="discount" id="discount" placeholder="DISCOUNT" value="<%out.println(discount);%>">
    </div>
  </div>
   <div class="form-group">
    <label for="manufacturingdate" class="col-sm-4 control-label">Manufacturing Date</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" name="manufacturingdate" id="manufacturingdate" placeholder="Manufacturing Date" value="<%out.println(manufacture);%>">
    </div>
  </div>
   <div class="form-group">
    <label for="expirydate" class="col-sm-4 control-label">Expiring Date</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" name="expiring_date" id="expirydate" placeholder="Expiring_Date" value="<%out.println(expiry);%>">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-4 col-sm-8">
    <button type="submit" class="btn btn-primary col-sm-6">Submit Details</button>
    </div>
</div>
  </form>
</body>
</html>




