<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
  <html>
      <head>
        <title>Yelp Business Prediction</title>
        <script type="text/javascript">
	        function isNumber(evt) {
	            evt = (evt) ? evt : window.event;
	            var charCode = (evt.which) ? evt.which : evt.keyCode;
	            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
	            	alert("You can enter only digits!")
	                return false;
	            }
	            return true;
	        }
        </script>
        	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
			<!-- Optional theme -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
			<!-- Latest compiled and minified JavaScript -->
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>            
      </head>    
    <body>    
    <!-- 
    	<c:if test="${not empty error}">
    		<div class="form-group row">        	    	
		    	<div class="alert alert-danger">    		
		    		<c:if test="${error == 'no_value'}">
		  				One or more field is empty. Please enter the value!
		  			</c:if> 
		  			<c:if test="${error == 'hour'}">
		  				Time can be only in between 0 and 23. Please re-enter the value!
		  			</c:if>    	
		  			<c:if test="${error == 'invalid'}">
		  				Invalid Output!
		  			</c:if>    	
		  			<c:if test="${error == 'maxdigit'}">
		  				Maximum 5 digits are allowed.
		  			</c:if>    	
		    	</div>	    		    		    	
	    	</div>
	    </c:if>
	     -->
    <div class="nav-control">   
      <div class="container">
        <div class="form-group row">
        	<div>
           		<center><h2> Yelp Restaurant Rating Prediction</h2></center>
            </div>
        </div>
        
        <div class="clearfix"></div>

        <form method="POST" action="rating.htm">                    

			<div class="nav-control">   
      <div class="container">
        <div class="form-group row">
        </div>
        
        <div class="clearfix"></div>

        <form method="POST" action="rating.htm"> 
        
        <div class="form-group row col-lg-4 col-lg-offset-2">
            <label for="category" class="col-sm-2 col-form-label">Category</label>
            <div class="col-sm-5">
              <select id="category" name="category" class="form-control">
                <option value="food">Food</option>
                <option value="cafes">Cafe</option>                
                <option value="chickenwings">Chicken Wings</option>
                <option value="bars">Bars</option>                  
                <option value="lounges">Lounges</option>
                <option value="nightlife">Nightlife</option>                
                <option value="pizza">Pizza</option>
                <option value="mexican">Mexican</option>                  
                <option value="barbeque">Barbeque</option>                
                <option value="divebar">Dive Bars</option>
                <option value="fastfood">Fast Food</option>                 
                <option value="chinese">Chinese</option>                
                <option value="burgers">Burgers</option>                                           
              </select>
            </div>
          </div>         

          <div class="form-group row col-lg-4 col-lg-offset-2">
            <label for="country" class="col-sm-2 col-form-label">Business Country</label>
            <div class="col-sm-5">
              <select id="country" name="country" class="form-control">
                <option value="US">United States</option>
                <option value="Canada">Canada</option>                
                <option value="Germany">Germany</option>
                <option value="Scotland">Scotland</option>               
              </select>
            </div>
          </div>
          
          <div class="form-group row col-lg-4 col-lg-offset-2">
            <label for="state" class="col-sm-2 col-form-label">Business State</label>
            <div class="col-sm-5">
              <select id="state" name="state" class="form-control">
                <option value="AZ">Arizona</option>
                <option value="BW">Bostwana</option>                
                <option value="EDH">Edinburgh</option>
                <option value="ELN">East Lothian</option>
                <option value="IL">Illinois</option>
                <option value="NC">North Carolina</option>                
                <option value="NM">New Mexico</option>                
                <option value="NV">Nevada</option>                
                <option value="ON">Ontario</option>                
                <option value="PA">Pennsylvania</option>                
                <option value="QC">Québec</option>
                <option value="RP">Rhineland-Palatinate</option>
                <option value="SC">South Carolina</option>                
                <option value="SCB">Southern California</option>                
                <option value="TX">Texas</option>
                <option value="WI">Wisconsin</option>                                
              </select>
            </div>
          </div>
          
          <div class="form-group row col-lg-4 col-lg-offset-2">
            <label for="checkin" class="col-sm-2 col-form-label">Checkin Count</label>
            <div class="col-sm-5">
              <input type="number" max="99999" class="form-control" id="checkin" name="checkin" placeholder="Checkin Count" onkeypress="return isNumber(event)">
            </div>
          </div>
          
          <div class="form-group row col-lg-4 col-lg-offset-2">
            <label for="review" class="col-sm-2 col-form-label">Review Count</label>
            <div class="col-sm-5">
              <input type="number" max="99999" class="form-control" id="review" name="review" placeholder="Review Count" onkeypress="return isNumber(event)">
            </div>
          </div>          

          <div class="form-group row col-lg-4 col-lg-offset-2">
            <label for="latitude" class="col-sm-2 col-form-label">Latitude</label>
            <!-- <div class="col-sm-1">
              <input type="text"  class="form-control" id="" value="">
            </div> -->
            <div class="col-sm-2">
              <input type="text" maxlength="6" class="form-control" id="latitude" name="latitude" placeholder="Latitude" onkeypress="return isNumber(event)">
            </div>
          </div>

          <div class="form-group row col-lg-4 col-lg-offset-2">
            <label for="longitude" class="col-sm-2 col-form-label">Longitude</label>
            <!-- <div class="col-sm-1">
              <input type="text" class="form-control" id="" value="">
            </div> -->
            <div class="col-sm-2">
              <input type="text" maxlength="6" class="form-control" id="longitude" name="longitude" placeholder="Longitude" onkeypress="return isNumber(event)">
            </div>
          </div>
          
          <div class="form-group row col-lg-4 col-lg-offset-2">
            <label for="price" class="col-sm-2 col-form-label">Price Range</label>
            <div class="col-sm-5">
              <select id="price" name="price" class="form-control">
                <option value="1">1</option>
                <option value="2">2</option>                
                <option value="3">3</option>
                <option value="4">4</option>               
              </select>
            </div>
          </div>
          
          <div class="form-group row col-lg-4 col-lg-offset-2">
            <label for="creditcard" class="col-sm-2 col-form-label">Accept Credit Card</label>
            <div class="col-sm-5">
              <select id="creditcard" name="creditcard" class="form-control">
                <option value="1">TRUE</option>
                <option value="0">FALSE</option>                
              </select>
            </div>
          </div>
          
          <div class="form-group row col-lg-4 col-lg-offset-2">
            <label for="delivery" class="col-sm-2 col-form-label">Delivery</label>
            <div class="col-sm-5">
              <select id="delivery" name="delivery" class="form-control">
                <option value="1">TRUE</option>
                <option value="0">FALSE</option>                
              </select>
            </div>
          </div>
          
          <div class="form-group row col-lg-4 col-lg-offset-2">
            <label for="wifi" class="col-sm-2 col-form-label">Free Wi-fi</label>
            <div class="col-sm-5">
              <select id="wifi" name="wifi" class="form-control">
                <option value="1">TRUE</option>
                <option value="0">FALSE</option>                
              </select>
            </div>
          </div>
          
          <div class="form-group row col-lg-4 col-lg-offset-2">
            <label for="tv" class="col-sm-2 col-form-label">Has TV</label>
            <div class="col-sm-5">
              <select id="tv" name="tv" class="form-control">
                <option value="1">TRUE</option>
                <option value="0">FALSE</option>                
              </select>
            </div>
          </div>
          
          <div class="form-group row col-lg-4 col-lg-offset-2">
            <label for="parking" class="col-sm-2 col-form-label">Parking</label>
            <div class="col-sm-5">
              <select id="parking" name="parking" class="form-control">
                <option value="1">TRUE</option>
                <option value="0">FALSE</option>                
              </select>
            </div>
          </div>
          
          <div class="form-group row col-lg-4 col-lg-offset-2">
            <label for="takeout" class="col-sm-2 col-form-label">Take Out</label>
            <div class="col-sm-5">
              <select id="takeout" name="takeout" class="form-control">
                <option value="1">TRUE</option>
                <option value="0">FALSE</option>                
              </select>
            </div>
          </div>                     
            
            <div class="form-group row">     
	            <div class="col-lg-4 col-lg-offset-4">
	              <input type="submit" class="btn btn-primary" />
	            </div>
            </div>
        </form>        
      </div>

      </div>
          
        </form>        
      </div>

      </div>
      
      
      <div class="nav-control">
      <div class="form-group row">   
      		<c:if test="${not empty output}">
      		<div class="alert alert-success">	      		
	      			<h3>Predicted Business Rating by model is: <c:out value="${output}"></c:out></h3>
	      	</div>
      		</c:if>
      </div>
      </div>
       
      
  </body>
 </html>