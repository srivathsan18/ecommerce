<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.Viewcartbeans"%>
<%@page import="Operation.Totalcode"%>
<%@page import="conn.Dao"%>


<!DOCTYPE html>
<html>
<head>
<title>Shopping Cart Widget Flat Responsive Widget Template :: w3layouts</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Electronic Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	SmartPhone Compatible web template, free web designs for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
	function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<!-- Custom Theme files -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/fasthover.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
<!-- //Custom Theme files -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- js -->
<script src="js/jquery.min.js"></script>
<link rel="stylesheet" href="css/jquery.countdown.css" /> <!-- countdown --> 
<!-- //js -->  
<!-- web fonts --> 
<link href='//fonts.googleapis.com/css?family=Glegoo:400,700' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!-- //web fonts -->  
<!-- start-smooth-scrolling -->
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- //end-smooth-scrolling --> 
</head> 
<body>
	<!-- for bootstrap working -->
	<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
	<!-- //for bootstrap working -->
	<!-- header modal -->
	
	<script>
		$('#myModal88').modal('show');
	</script>  
	<!-- header modal -->
	<!-- header -->
	<div class="header" id="home1">
		<div class="container">
			
			<div class="w3l_logo">
                            <h3 style="color: white">Electronic Store<span>Your stores. Your place.</span></h3>
			</div>
			
			<div class="cart cart box_1"> 
				<form action="cart.jsp" method="post" class="last"> 
					<input type="hidden" name="cmd" value="_cart" />
					<input type="hidden" name="display" value="1" />
					<button class="w3view-cart" type="submit" name="submit" value=""><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button>
				</form>   
			</div>  
		</div>
	</div>
	<!-- //header -->
	<!-- navigation -->
	<div class="navigation">
		<div class="container">
			<nav class="navbar navbar-default">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header nav_2">
					<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div> 
				<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
					<ul class="nav navbar-nav">
						<li><a href="index1.jsp" class="act">Home</a></li>	
						<!-- Mega Menu -->
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Products <b class="caret"></b></a>
							<ul class="dropdown-menu multi-column columns-3">
								<div class="row">
									<div class="col-sm-3">
										<ul class="multi-column-dropdown">
											<h6>Clothes</h6>
											<li><a href="Menswearservlet">MENSWEAR</a></li>
											<li><a href="Womenswearservlet">WOMENSWEAR <span>New</span></a></li> 
											
										</ul>
									</div>
									<div class="col-sm-3">
										<ul class="multi-column-dropdown">
											<h6>Electronics</h6>
											<li><a href="Electronicservlet">electronic</a></li>
											
										</ul>
									</div>
									
									<div class="clearfix"></div>
								</div>
							</ul>
						</li>
						<li><a href="about.jsp">About Us</a></li> 
						<li class="w3pages"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Pages <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="icons.jsp">Web Icons</a></li>
								<li><a href="codes.jsp">Short Codes</a></li>     
							</ul>
						</li>  
						<li><a href="mail.jsp">Mail Us</a></li>
                                                
					</ul>
                                    
				</div>
                                                                <a href="Summary.jsp">ORDERS</a>

			</nav>
		</div>
	</div>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Shopping Cart Widget Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/style1.css" rel="stylesheet" type="text/css" media="all" />
<link href='//fonts.googleapis.com/css?family=Signika:400,300,600,700' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>

</head>
<body>
     <%
         
        
                      HttpSession ses=request.getSession();
                     String str1=(String) ses.getAttribute("userid");

         
         Dao d=new Dao();
            Totalcode t=new Totalcode();
            ArrayList <Viewcartbeans>ar=t.viewcart(str1);
           
            
            %>
            
	<!-- main -->
		<div class="main">
			<h1>Shopping Cart Widget</h1>
			<div class="main-grid1">
				<ul>
					<li><a href="editcart.jsp" class="car">EDIT CART</a></li>
				</ul>
			</div>
                        
			<div class="main-grid2">
				<h2>My Shopping Bag</h2>
                                <div class="cart_box">
                                    <% int prize1=0;%>
                                 <% for(Viewcartbeans vb:ar)
         {
             
                     String str= t.image(vb.getProductid());
                     int prize=vb.getPrize();
                     String name=vb.getName();
                     int quantity=vb.getQuantity();
                     prize1=(prize*quantity)+prize1;
                     
         
         %>
				
					<div class="message">
						 <div class="alert-close"> </div> 
						<div class="list_img"><img src="data:image/gif;base64, <%=str %>" class="img-responsive" alt="" /></div>
                                                
                                       <h4><%=name%></h4>
                                                <br>
                                                <br>
                                      PRIZE:<%=prize%>
                                      quantity:<%=quantity%>
                                     
						<div class="list_desc"><h4></h4><span class="actual">
						 </span></div>
						  <div class="clear"></div>
					</div>
				
				<% }%>
                                </div>
							</div>
			<div class="copy-right">
				<p>Copyright &copy; 2015 Shopping Cart Widget. All rights  Reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
			</div>
		</div>
	<!-- //main -->
</body>
</html>