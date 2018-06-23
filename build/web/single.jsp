<%-- 
    Document   : desc
    Created on : 15 May, 2018, 8:31:59 PM
    Author     : srivathsan
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.Productbeans"%>
<%@page import="Operation.Totalcode"%>
<%@page import="static java.lang.Integer.parseInt"%>


<%@ include file = "header.jsp" %>

	<!-- //breadcrumbs -->  
	<!-- single -->
        <%
            int productid=Integer.parseInt(request.getParameter("productid"));
            
            Totalcode t=new Totalcode();
            ArrayList <Productbeans>ar1=t.desclist(productid);
            
            
            %>
            <div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
    <% for(Productbeans pb:ar1)
         {
             int i=pb.getQuantity();
         %>
        
 
        
	<div class="single">
		<div class="container">
			<div class="col-md-4 single-left">
				<div class="flexslider">
					<ul class="slides">
                                            <% out.println(pb.getProductname());%> 
                                            <% out.println(pb.getPrize());%>

						<li data-thumb="images/a.jpg">
							<div class="thumb-image"> <img src="data:image/gif;base64,<%=pb.getImage()%> " alt="" width="200" height="200"> </div>
						</li>
						 
					</ul>
				</div>
				<!-- flexslider -->
					<script defer src="js/jquery.flexslider.js"></script>
					<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
					<script>
					// Can also be used with $(document).ready()
					$(window).load(function() {
					  $('.flexslider').flexslider({
						animation: "slide",
						controlNav: "thumbnails"
					  });
					});
					</script>
				<!-- flexslider -->
				<!-- zooming-effect -->
					<script src="js/imagezoom.js"></script>
				<!-- //zooming-effect -->
			</div>
			
				<div class="description">
					<h5><i>Description</i></h5>
					<p><% out.println(pb.getProductdesc());%></p>
				</div>
				
					
					<div class="clearfix"> </div>
				</div>
				
				<div class="simpleCart_shelfItem">
					<p><span></span> <i class="item_price">            </i></p>
                                        PRIZE:&#8377; <%out.println(pb.getPrize());%><br>
                                        <% if(pb.getQuantity()<10)
                                        out.println("only "+pb.getQuantity()+" Left");%>
					<form action="Addcartservlet" method="post">
                                            <% if(pb.getQuantity()==0){
                                        out.println("OUT OF STOCK");
                                                                                    }
                                            %>
                                                
                                            
      
                                            <h5>QUANTITY:</h5>   <input name="quantity" type="number" value="1" min="1" max="<%=i%>"><br>
						<input type="hidden" name="productname" value="<%=pb.getProductname()%>">
                                                <input type="hidden" name="prize" value="<%=pb.getPrize()%>"> 
						<input type="hidden" name="productid" value="<%=pb.getProductid()%>"> 
						<input type="hidden" name="catagories" value="<%=pb.getCatagories()%>">   
						<button type="submit" class="w3ls-cart">Add to cart</button>
					</form>
				</div> 
			</div>
         <%}%>
			<div class="clearfix"> </div>
		
	   
	
	<!-- //Related Products -->
	
	<!-- //single -->
	<!-- newsletter -->
	<div class="newsletter">
		<div class="container">
			<div class="col-md-6 w3agile_newsletter_left">
				<h3>Newsletter</h3>
				<p>Excepteur sint occaecat cupidatat non proident, sunt.</p>
			</div>
			<div class="col-md-6 w3agile_newsletter_right">
				<form action="#" method="post">
					<input type="email" name="Email" placeholder="Email" required="">
					<input type="submit" value="" />
				</form>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<!-- //newsletter -->
	<!-- footer -->
	<%@ include file = "footer.jsp" %>
