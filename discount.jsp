<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.center-content {
	width: 512px;
	margin: 150px auto;
}
</style>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css" />
</head>
<body>
<div class="center-content">
<form class="form-horizontal" method="post"  action="updatediscount.jsp" >
  <div class="form-group">
    <label for="name" class="col-sm-4 control-label">Discount</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="discount" name="discount" placeholder="discount">
    </div>
    </div>
  <div class="form-group">
    <div class="col-sm-offset-4 col-sm-8">
    <button type="submit" class="btn btn-primary col-sm-6">Submit Discount</button>
    </div>

  </div>
</body>
</html>