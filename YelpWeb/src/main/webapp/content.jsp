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
<title>Content Filtering</title>
</head>
<body>

<div class="nav-control">   
      <div class="container">
        <div class="form-group row">
        	<div>
           		<center><h2>Yelp Content Based Recommendation System </h2></center>
            </div>
        </div>
        
        <div class="clearfix"></div>		

        <form method="POST" action="contentrec.htm">          

          <div class="form-group row col-lg-4 col-lg-offset-2">
            <label for="name" class="col-sm-2 col-form-label">User Name</label>
            <div class="col-sm-5">
              <select id="username" name="username" class="form-control">
                <option value="CR2y7yEm4X035ZMzrTtN9Q">Jim</option>
                <option value="Ch6CdTR2IVaVANr-RglMOg">John</option>                
                <option value="NZrLmHRyiHmyT1JrfzkCOA">Beth</option>
                <option value="mWx5Sxt_dx-sYBZg6RgJHQ">Amy</option>
                <option value="hryUDaRk7FLuDAYui2oldw">Beach</option>
                <option value="2t6fZNLtiqsihVmeO7zggg">Christine</option>				
                <option value="mn6F-eP5WU37b-iLTop2mQ">Denis</option>                
                <option value="y5YxcvgbQX_uVW0UtHWKxA">Ann-Marie</option>
                <option value="Vu29H1sy1poRld4LIL2Jqw">Sandy</option>
                <option value="8lrTKMjIJ9kt7rfVtjq3qg">Dan</option>    
				<option value="IcSsf2QCA7T-KpdraDxTew">Scott</option>
                <option value="d09KNIq4YPYq1u5nVyqIUg">Michael</option>                
                <option value="bwPaqC08ddUoq-zminI3bw">Kelly</option>
                <option value="TGQRbUuikgzO2ARVicH1cQ">Angie</option>
                <option value="XYx6ZiTSIpbC3qm_xEm-KA">Steve</option>
                <option value="zKyJDKJwAfWGB4HKXp9snw">Ron</option>
                <option value="owCSYaRJEiV-kk2L2HP00A">Rob</option>                
                <option value="xZJO6cRX6OHabaePvPzsXw">Tiffani</option>
                <option value="v1ntgoANp9xLxf4u5iJR4Q">Tim</option>
                <option value="vz05hlteS6XvnczIInsnqw">Sarah</option>		
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
	              <input type="submit" value ="Recommend" class="btn btn-primary" />
	            </div>
            </div>
        </form>        
      </div>
      </div>
</body>
</html>