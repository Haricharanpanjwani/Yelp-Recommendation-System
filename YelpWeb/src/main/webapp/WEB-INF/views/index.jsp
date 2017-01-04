<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Yelp Inc.</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">	
    <link rel="stylesheet" type="text/css" href="resources/css/index.css">   
	
	<!-- Bootstrap core CSS -->
    </head>
    
<body data-spy="scroll" data-target="#my-navbar">
          
<nav class="navbar navbar-inverse navbar-fixed-top" id="my-navbar">
<div class="container">
       <div class="navbar-header">
           <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse" >
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
           </button>
           <a href="" class="navbar-brand"><i><strong>Yelp</strong></i></a>
       </div><!--Navbar Header-->
       <div class="collapse navbar-collapse" id="navbar-collapse">              
        <!-- <a href="" class="btn btn-info navbar-btn navbar-right" data-toggle="modal" data-target="#myModal1" >SignUp</a>
        <a href="" class="btn btn-info navbar-btn navbar-right" data-toggle="modal" data-target="#myModal">Log In</a> -->
             <ul class="nav navbar-nav" >
             
              <li><a class="dropdown" data-toggle="dropdown"  role="button" aria-haspopup="true" aria-expanded="false">Algorithm <span class="caret"></span>
                  </a>
					<ul class="dropdown-menu">
					<li><a href="collaborative.jsp" target="ifrm">Collaborative Based Recommendation</a></li>
					<li><a href="content.jsp"  target="ifrm" align="top">Content Based Recommendation</a></li>
					<li><a href="prediction.jsp" target="ifrm" >Restaurant Rating Prediction</a></li>
					<!-- <li><a href="classification.jsp" target="ifrm" >Image Classification</a></li> -->
					</ul>
			</li>
             <li><a class="dropdown" data-toggle="dropdown"  role="button" aria-haspopup="true" aria-expanded="false">Downloads <span class="caret"></span></a>
             	<ul class="dropdown-menu">
					<li><a target="_blank" href="resources/Yelp Dataset/business.json" >Yelp Dataset</a></li>					
					<li><a target="_blank" href="resources/Yelp Documentation.pdf" >Yelp Documentation</a></li>
					<li><a target="_blank" href="resources/Yelp Presentation.pptx" >Yelp Presentation</a></li>
					<li><a target="_blank" href="https://drive.google.com/drive/folders/0B54xklq33wk_UHBnNnJNTG95SjQ?usp=sharing" >Google Drive</a></li>					
				</ul>
             <li> <a href="#contact" >ContactUs</a>
             </li>
          </ul>
       </div>
</div><!--End container-->
</nav><!--End navbar-->
    
<!--Jumbotron-->
<div class="jumbotron">



    <!--Gallery--> 
<div class="container ">
	  <section>
	  	 <div class="page-header" id="powerBI">
	  	 </div>		 
    	   <div class="carousel slide" id="screenshot-carousel" data-ride="carousel">
	  	   <ol class="carousel-indicators" >
	  	       <li data-target="#screenshot-carousel" data-slide-to="0" class="active"></li>
	  	       <li data-target="#screenshot-carousel" data-slide-to="1"></li>
	  	       <li data-target="#screenshot-carousel" data-slide-to="2"></li>
	  	       <li data-target="#screenshot-carousel" data-slide-to="3"></li>
	  	    </ol> 
	  	  <div class="carousel-inner">
            <div class="item active">
                	 <img src="resources/images/pic1.jpg" alt="Text of the image">
                	 <div class="carousel-caption">
                	 <h3> "How is that even possible!!" </h3>
                	 <p> Home made fusilli pasta hits the spot and thankfully lives up to the name and the pasta was cooked just as expected. Pasta had a nice bite to it and good flavor in the vodka sauce.  </p>
                	 </div>
            </div>	
          <div class="item">
                	 <img src="resources/images/pic2.jpg" alt="Text of the image">
                	 <div class="carousel-caption">
                	 <h3> Still love this place.  </h3>
                	 <p>  I've ordered from here a few more times since my last review, and they've been prompt, friendly, and the food has been pretty much unvaryingly excellent (for the price). </p>
                	 </div>
          </div>
          <div class="item">
                	 <img src="resources/images/pic3.jpg" alt="Text of the image">
                	 <div class="carousel-caption">
                	 <h3>  Dessert Love!!</h3>
                	 <p>  The prices are not cheap, but I wouldn't say they're exorbitant. We are in the North End. I had a hazelnut cannoli for $4. The cannolis seem to be very popular and are very large and good! I'd definitely come back next time I'm in the North End. Five stars if they took card! </p>
                	 </div>
          </div>
          <div class="item">
                	 <img src="resources/images/pic4.jpg" alt="Text of the image">
                	 <div class="carousel-caption">
                	 <h3> "Great steak, it melted in my mouth!" </h3>
                	 <p>   What really made it though was the personalized service that we received. Domingo and the other server (forgot his name!) were so attentive and cared so much about giving us the best service</br>, you must go here and find out for yourselves!:) </p>
                	 </div>
          </div>  	    	
	  	  </div><!--End inner--> 
	  	    <a href="#screenshot-carousel" class="left carousel-control" data-slide="prev">
	  	    <span class="glyphicon glyphicon-chevron-left"></span>
            </a>
            <a href="#screenshot-carousel" class="right carousel-control" data-slide="next">
	  	    <span class="glyphicon glyphicon-chevron-right"></span>
            </a>
	  	   </div><!--End Carousel--> 
	  </section>		
</div>




		   <!--Jumbotron-->
<div class="jumbotron page-header" id="Analysis">
<div class="container text-center j1" >
	   

<!--Iframe Start-->  
<div class="main_ifrm">
<a class="header_link4" href="main_frame.html" target="ifrm" align="top" ></a> 
<iframe class="main_ifrm1" src="search.jsp" name="ifrm" target="ifrm" width="1100" height="600" ></iframe>
</div>



<!--Iframe End-->  
        
</div><!--End container-->
</div>  <!--End jumbotron-->  



<!--call to action-->

		<div class="well">		
	      <div class="container text-center" id="downloads" class="page-header">
            <h3>Download the <span style="color:#FFA500">Yelp!!</span> App Here:</h3>
            <a href="http://www.apple.com/osx/apps/app-store/"><img src="resources/images/avail_app_store.png" alt="appstore_logo" style="width:125px;height:42px;border:0"></a>
			<a href="https://play.google.com/store?hl=en"><img src="resources/images/avail_play_store.png" alt="playstore_logo" style="width:125px;height:42px;border:0"></a>
			<a href="https://www.microsoft.com/en-us/store/apps"><img src="resources/images/avail_win_store.png" alt="winstore_logo" style="width:125px;height:42px;border:0"></a>
		   </div><!--End container-->
		
		<hr class="vertical">
		   <div class="container text-center" id="subscribe">
            <h3><span style="color:#FFA500">Subscribe</span> for more Info</h3>
              <form action="" class="form-inline">
               <div class="form-group">
                   <label for="subscription">Enter your Email to <span style="color:#FFA500">subscribe:</span></label>
            	   <input type="text" class="form-control" id="email" placeholder="Enter your email:">
               </div>
                 <button type="submit" class="btn btn-warning">Subscribe</button>
                 <hr>
             </form>  
		   </div><!--End container--> 


		   
		   
		   <div class="container text-center" id="follow_us">
            <h3>Follow Us on <span style="color:#3b5998">Social Media</span></h3>
			<a href="https://www.facebook.com/Yelpz!!"><img src="resources/images/fb.png" alt="fb_logo" style="width:42px;height:42px;border:0"></a>
			<a href="https://twitter.com/Yelpz!!"><img src="resources/images/twitter.png" alt="twitter_logo" style="width:42px;height:42px;border:0"></a>
			<a href="https://plus.google.com/collections/featured/Yelpz!!"><img src="resources/images/gplus.png" alt="gplus_logo" style="width:42px;height:42px;border:0"></a>
			<a href="https://www.instagram.com/Yelpz!!"><img src="resources/images/insta.png" alt="insta_logo" style="width:42px;height:42px;border:0"></a>
            </div>
		   </div><!--End container--> 
		
<hr>		
<p align="center">© 2015, www.Yelpz!!.com, Inc. or its affiliates<p>


<script>
function myFunction() {
    window.open("main.html");
}
</script>



</body>
</html>
