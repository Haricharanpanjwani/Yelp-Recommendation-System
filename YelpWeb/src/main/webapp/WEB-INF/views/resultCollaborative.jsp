<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<title>Collaborative Filtering</title>
</head>
<body>

<div class="nav-control">   
      <div class="container">
        <div class="form-group row">
        	<div>
           		<center><h2> Yelp Collaborative Based Recommendation System </h2></center>
            </div>
        </div>
        
        <div class="clearfix"></div>

        <form method="POST" action="collabrec.htm">          

          <div class="form-group row col-lg-4 col-lg-offset-2">
            <label for="name" class="col-sm-2 col-form-label">User Name</label>
            <div class="col-sm-5">
              <select id="username" name="username" class="form-control">
                <option value="zzmRKNph-pBHDL2qwGv9Fw">Jim</option>
                <option value="15J3D1xNze1NbO2SoqAQfg">John</option>                                
                <option value="nUGV1dVjO84ZI3nplRbwFQ">Beth</option>                
                <option value="jyu9ThrwLGgVE1csLKR1Yw">Amy</option>                
                <option value="FGFYZUNgWcyBpWWH-1aauw">Beach</option>                
                <option value="fCAuRQFkaN3UEebkfgpHUw">Christine</option>                				
                <option value="3QaC0Ljl2hWLdL_jzt6nJA">Denis</option>                                
                <option value="RpC1jwOttGJcM5TIgscMTQ">Ann-Marie</option>                                              
              </select>
            </div>
          </div>
		  
		  <div class="form-group row col-lg-4 col-lg-offset-2">
            <label for="stars" class="col-sm-2 col-form-label">Average Stars</label>
            <div class="col-sm-5">
              <input type="text" class="form-control" id="stars" name="stars" readonly=true>
            </div>
          </div>
		  
		  <div class="form-group row col-lg-4 col-lg-offset-2">
            <label for="review" class="col-sm-2 col-form-label">Review Count</label>
            <div class="col-sm-5">
              <input type="text" class="form-control" id="review" name="review" readonly=true>
            </div>
          </div>		  		                          
            
            <div class="form-group row">     
	            <div class="col-lg-4 col-lg-offset-4">
	              <input type="submit" value ="Recommend" align="center" class="btn btn-primary" />
	            </div>
            </div>
        </form>        
      </div>
      </div>
      
      <div class="nav-control">
      <div class="form-group row">   
      		<c:if test="${not empty output}">
      		<div class="alert alert-success">	      		
	      			<h3>Restaurants recommended by model is: <c:out value="${output}"></c:out></h3>
	      	</div>
      		</c:if>
      </div>
      </div>
</body>
</html>