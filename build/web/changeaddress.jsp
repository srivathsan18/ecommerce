<%@page import="beans.Signupbeans"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Operation.Totalcode"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>Electronic Store Checkout</title>
<!-- custom-theme -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Fascinating Checkout Form template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login sign up Responsive web template, SmartPhone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //custom-theme -->
<link href="css/style3.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/creditly.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/easy-responsive-tabs.css">
<script src="js/jquery.min.js"></script>
<link href="//fonts.googleapis.com/css?family=Overpass:100,100i,200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext" rel="stylesheet">
</head>

<body>
    
    <%HttpSession ses=request.getSession();
    String userid=(String)ses.getAttribute("userid");
    Totalcode t=new Totalcode();
    ArrayList<Signupbeans> al=t.userdetails(userid);
    for(Signupbeans a:al)
    {
    
    %>
  
	<div class="main">	
		<h1> CASH ON DELIVERY</h1>
		<div class="w3_agile_main_grids">
			<div class="agile_main_top_grid">
				<div class="agileits_w3layouts_main_top_grid_left">
					<a href="confirmorder.jsp"><img src="images/1.png" alt=" " /></a>
				</div>
				<div class="w3_agileits_main_top_grid_right">
					<h3>Change Address</h3>
				</div>
				<div class="clear"> </div>
				<div class="wthree_total">
					
				</div>
			</div>
			<div class="agileinfo_main_bottom_grid">
				<div id="horizontalTab">
					
					<div class="resp-tabs-container">
						<div class="agileits_w3layouts_tab1">
							<form action="Changeaddressservlet" method="post" class="creditly-card-form agileinfo_form">
								<section class="creditly-wrapper wthree, w3_agileits_wrapper">
									<div class="credit-card-wrapper">
										
                                                                                    
                                                                                    <div class="controls">
												<label class="control-label">ADDRESS :</label>
                                                                             <input class="billing-address-name form-control" type="text" name="address" placeholder="<%=a.getAddress()%>" >

											</div>
                                                                                    <div class="controls">
												<label class="control-label">STATE   :</label> 
												<input class="billing-address-name form-control" type="text" name="state" placeholder="<%=a.getState()%>" >
											</div>
                                                                                                  <div class="controls">
												<label class="control-label">PIN CODE :</label>
												<input class="billing-address-name form-control" type="text" name="pincode" placeholder="<%=a.getPincode()%>" >
											</div>
                                                                                          
											
                                                                                        <button class="submit"><span>SUBMIT</span></button> 
									</div>
								</section>
							</form>
						</div>
						
					</div>
				</div>
			</div>
		</div>
                   
		<div class="agileits_copyright">
			<p>© 2017 Fascinating Checkout Form. All rights reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a></p>
		</div>
	</div>
                 <%}%>
	<!-- credit-card -->
		<script type="text/javascript" src="js/creditly.js"></script>
		<script type="text/javascript">
			$(function() {
			  var creditly = Creditly.initialize(
				  '.creditly-wrapper .expiration-month-and-year',
				  '.creditly-wrapper .credit-card-number',
				  '.creditly-wrapper .security-code',
				  '.creditly-wrapper .card-type');

			  $(".creditly-card-form .submit").click(function(e) {
				e.preventDefault();
				var output = creditly.validate();
				if (output) {
				  // Your validated credit card output
				  console.log(output);
				}
			  });
			});
		</script>
	<!-- //credit-card -->
	<!-- tabs -->
	<script src="js/easy-responsive-tabs.js"></script>
	<script>
		$(document).ready(function () {
			$('#horizontalTab').easyResponsiveTabs({
				type: 'default', //Types: default, vertical, accordion           
				width: 'auto', //auto or any width like 600px
				fit: true,   // 100% fit in a container
				closed: 'accordion', // Start closed if in accordion view
				activate: function(event) { // Callback function if tab is switched
				var $tab = $(this);
				var $info = $('#tabInfo');
				var $name = $('span', $info);
				$name.text($tab.text());
				$info.show();
				}
			});
		});
	</script>
	<!-- //tabs -->
</body>
</html>